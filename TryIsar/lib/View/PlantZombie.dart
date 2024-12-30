import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:isarapp/Model/Plant.dart';
import 'package:isarapp/Model/Zombie.dart';
import 'package:isarapp/CreateDataBase/CreateDateBase.dart';

class PlantVsZombiePage extends StatefulWidget {
  @override
  _PlantVsZombiePageState createState() => _PlantVsZombiePageState();
}

class _PlantVsZombiePageState extends State<PlantVsZombiePage> {
  List<List<Plant>> plants = [[], [], []]; // 儲存三條道路的植物資料
  List<List<Zombie>> zombies = [[], [], []]; // 儲存三條道路的殭屍資料
  int score = 0; // 玩家得分
  bool gameOver = false; // 遊戲結束標記
  List<AttackEffect> attackEffects = []; // 儲存攻擊特效

  @override
  void initState() {
    super.initState();
    _loadData(); // 載入植物和殭屍資料
  }

  Future<void> _loadData() async {
    var plantData = await getPlantsFromDatabase();
    var zombieData = await getZombiesFromDatabase();

    setState(() {
      plants = [[], [], []];
      zombies = [[], [], []];

      for (int i = 0; i < plantData.length; i++) {
        int roadIndex = i % 3;
        plants[roadIndex].add(plantData[i]);
      }

      for (int i = 0; i < zombieData.length; i++) {
        int roadIndex = i % 3;
        zombies[roadIndex].add(zombieData[i]);
      }
    });

    if (plants.isNotEmpty && zombies.isNotEmpty) {
      _startAttacking();
    }
  }

  void _startAttacking() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (gameOver) {
        timer.cancel();
      } else {
        _attack();
      }
    });
  }

  void _attack() {
    setState(() {
      for (int road = 0; road < 3; road++) {
        List<Plant> roadPlants = plants[road];
        List<Zombie> roadZombies = zombies[road];

        for (int i = 0; i < roadPlants.length && i < roadZombies.length; i++) {
          final plant = roadPlants[i];
          final zombie = roadZombies[i];

          int attackPower = int.parse(plant.PlantAttack!);
          zombie.ZombieHp = (int.parse(zombie.ZombieHp!) - attackPower).toString();

          if (int.parse(zombie.ZombieHp!) <= 0) {
            zombies[road].removeAt(i);
            score++;
            _addAttackEffect(road, i, 'zombie'); // 加入攻擊特效
          }

          int zombieAttackPower = int.parse(zombie.ZombieAttack!);
          plant.PlantHp = (int.parse(plant.PlantHp!) - zombieAttackPower).toString();

          if (int.parse(plant.PlantHp!) <= 0) {
            plants[road].removeAt(i);
            _addAttackEffect(road, i, 'plant'); // 加入攻擊特效
          }
        }
      }

      if (plants.every((road) => road.isEmpty)) {
        gameOver = true;
        _showGameOverDialog("殭屍獲勝！");
      } else if (zombies.every((road) => road.isEmpty)) {
        gameOver = true;
        _showGameOverDialog("植物獲勝！");
      }
    });
  }

  void _addAttackEffect(int road, int index, String type) {
    setState(() {
      attackEffects.add(AttackEffect(road: road, index: index, type: type, isAttacking: true, positionOffset: 0.0));
    });

    // 模擬攻擊時植物和殭屍卡片向彼此靠近
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        attackEffects[attackEffects.length - 1].isAttacking = true;
      });
    });

    // 模擬垂直移動
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        attackEffects[attackEffects.length - 1].positionOffset = 50.0; // 調整為垂直移動的距離
      });
    });

    // 1秒後，重置並移除特效
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        attackEffects.removeWhere((effect) =>
        effect.road == road && effect.index == index && effect.type == type);
      });
    });
  }

  void _showGameOverDialog(String winner) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(winner, style: TextStyle(color: Colors.red, fontSize: 24)),
        content: Text('遊戲結束！您的得分: $score', style: TextStyle(fontSize: 18)),
        actions: <Widget>[
          TextButton(
            child: Text('重新開始', style: TextStyle(color: Colors.blue)),
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                gameOver = false;
                score = 0;
                plants = [[], [], []];
                zombies = [[], [], []];
                attackEffects.clear(); // 清除攻擊特效
                _loadData();
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('植物大戰殭屍 - 得分: $score'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              '植物對抗殭屍大戰！',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int road = 0; road < 3; road++) ...[
                    Expanded(
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Text(
                                '道路 ${road + 1}',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
                              ),
                              SizedBox(height: 10),
                              _buildCharacterList(road, 'Plant'),
                              SizedBox(height: 10),
                              _buildCharacterList(road, 'Zombie'),
                            ],
                          ),
                          ..._buildAttackEffects(road), // 顯示攻擊特效
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAttackEffects(int road) {
    return attackEffects
        .where((effect) => effect.road == road)
        .map((effect) {
      return AnimatedPositioned(
        // 攻擊時植物和殭屍卡片從上下兩邊靠近
        top: effect.type == 'plant'
            ? 50.0 - effect.positionOffset
            : 100.0 + effect.positionOffset, // 根據攻擊時的位移
        left: effect.index * 100.0, // 根據位置調整特效的水平位置
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: effect.type == 'plant' ? Colors.green : Colors.red,
            shape: BoxShape.circle,
          ),
        ),
      );
    }).toList();
  }

  Widget _buildCharacterList(int road, String type) {
    return Expanded(
      child: ListView.builder(
        itemCount: type == 'Plant' ? plants[road].length : zombies[road].length,
        itemBuilder: (context, index) {
          final character = type == 'Plant' ? plants[road][index] : zombies[road][index];

          // 在每個植物或殭屍卡片之間加入距離
          return Column(
            children: [
              if (character is Plant)
                _buildCharacterCard(character.ImagePath, character.PlantAttack, character.PlantHp, type),
              if (character is Zombie)
                _buildCharacterCard(character.ImagePath, character.ZombieAttack, character.ZombieHp, type),
              SizedBox(height: 10), // 在每個植物/殭屍之間增加間距
            ],
          );
        },
      ),
    );
  }

  Widget _buildCharacterCard(String? imagePath, String? attackPower, String? hp, String type) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.min, // 使Row的寬度不會被擴展
          children: [
            if (imagePath != null)
              Column(
                mainAxisSize: MainAxisSize.min, // 讓Column根據內容自適應高度
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 5), // 圖片和文字之間的間距
                  Text(
                    'HP: $hp',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Future<List<Plant>> getPlantsFromDatabase() async {
    var plantList = await CreateDataBase.getAllplant();
    return plantList;
  }

  Future<List<Zombie>> getZombiesFromDatabase() async {
    var zombieList = await CreateDataBase.getAllZombie();
    return zombieList;
  }
}

class AttackEffect {
  final int road;
  final int index;
  final String type;
  bool isAttacking; // 用來標識是否正在進行攻擊動畫
  double positionOffset; // 控制圖片移動的距離

  AttackEffect({
    required this.road,
    required this.index,
    required this.type,
    this.isAttacking = false,
    this.positionOffset = 0.0,
  });
}
