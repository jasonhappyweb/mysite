import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isarapp/CreateDataBase/CreateDateBase.dart'; // Import CreateDataBase class
import 'package:isarapp/Model/Zombie.dart'; // Import Zombie model
import '../Pages/Zombie.dart'; // Import AddZombiePage

class ZombiePage extends StatefulWidget {
  @override
  _ZombiePageState createState() => _ZombiePageState();
}

class _ZombiePageState extends State<ZombiePage> {
  List<Zombie> ZombieData = []; // List to store Zombie data

  @override
  void initState() {
    super.initState();
    _loadData(); // Load data when the page initializes
  }

  // Load Zombie data from the database
  Future<void> _loadData() async {
    try {
      final data = await CreateDataBase.getAllZombie(); // Fetch all Zombies
      if (data.isNotEmpty) {
        print('成功載入 ${data.length} 筆資料');
      } else {
        print('資料庫無資料');
      }
      setState(() {
        ZombieData = data; // Update the state with the fetched data
      });
    } catch (e) {
      print('讀取資料時發生錯誤: $e');
    }
  }

  // Refresh data
  Future<void> _refreshData() async {
    await _loadData(); // Reload data when the page is refreshed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '殭屍表',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green[600], // 更改AppBar顏色
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // 包裝 DataTable 以 Card 來增加層次感
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshData,
                child: ZombieData.isEmpty
                    ? Center(child: CircularProgressIndicator()) // 顯示載入指示器
                    : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Card(
                    elevation: 5, // 陰影效果
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal, // 使表格可以水平滾動
                        child: DataTable(
                          columnSpacing: 20, // 增加列間距
                          columns: const [
                            DataColumn(label: Text('殭屍ID')),
                            DataColumn(label: Text('殭屍HP')),
                            DataColumn(label: Text('殭屍攻速')),
                            DataColumn(label: Text('殭屍攻擊力')),
                            DataColumn(label: Text('殭屍名稱')),
                            DataColumn(label: Text('創建時間')),
                          ],
                          rows: ZombieData
                              .map(
                                (Zombie) => DataRow(
                              cells: [
                                DataCell(Text(Zombie.id.toString())),
                                DataCell(Text(Zombie.ZombieHp ?? 'N/A')),
                                DataCell(Text(Zombie.ZombieAttackSpeed ?? 'N/A')),
                                DataCell(Text(Zombie.ZombieAttack ?? 'N/A')),
                                DataCell(Text(Zombie.ZombieName ?? 'N/A')),
                                DataCell(Text(_formatDate(Zombie.CreateDateTime).replaceAll("-", "/"))),
                              ],
                            ),
                          )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            // 重新設計按鈕
            Container(
              width: double.infinity, // 設定按鈕的最大寬度
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddZombiePage()),
                  ).then((_) {
                    _loadData(); // 重新加載資料
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green[600], // 設定背景顏色
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(
                  '插入殭屍資料',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // 用來格式化日期，顯示只要日期部分
  String _formatDate(String? dateTime) {
    if (dateTime == null) return 'N/A';
    try {
      final DateTime date = DateTime.parse(dateTime);
      final DateFormat dateFormat = DateFormat('yyyy-MM-dd'); // 只顯示到日期
      return dateFormat.format(date);
    } catch (e) {
      print('日期格式錯誤: $e');
      return 'N/A';
    }
  }
}
