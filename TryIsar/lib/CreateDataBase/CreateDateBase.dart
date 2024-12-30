import 'package:isar/isar.dart';
import 'package:isarapp/Model/Page1.dart';
import 'package:isarapp/Model/Plant.dart';
import 'package:isarapp/Model/Zombie.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../Model/Plant.dart';

class CreateDataBase {
  static late Isar isar;

  // 初始化資料庫
  static Future<void> initialize() async {
    final directory = await getApplicationDocumentsDirectory(); // 獲取應用的文件目錄
    isar = await Isar.open(
      [Page1Schema, PlantSchema, ZombieSchema], // 这里传入 Plant 的 Schema
      directory: directory.path, // 設定資料庫存放位置
    );
  }

  // 新增資料到 Page1 集合
  static Future<void> createPage1(
      {required String? userNMC,
        required String? times,
        required String? people,
        required String? talk,
        required String? line}) async {
    final page1 = Page1()
      ..UserNMC = userNMC
      ..Times = times
      ..People = people
      ..Talk = talk
      ..Line = line;

    await isar.writeTxn(() async {
      await isar.page1s.put(page1); // 插入數據到 Page1 集合
    });
  }
  // 新增資料到 Plant 集合
  static Future<void> createPlant({
    required String? PlantHp,
    required String? PlantAttackSpeed,
    required String? PlantAttack,
    required String? PlantName,
    String? ImagePath, // 新增圖片路徑
  }) async {
    final newPlant = Plant()
      ..PlantHp = PlantHp
      ..PlantAttackSpeed = PlantAttackSpeed
      ..PlantAttack = PlantAttack
      ..PlantName = PlantName
      ..CreateDateTime = DateTime.now().toString().split(' ')[0]
      ..ImagePath = ImagePath;

    await isar.writeTxn(() async {
      await isar.plants.put(newPlant);
    });
  }


  // 新增資料到 Plant 集合
  static Future<void> createZombie({
    required String? ZombieHp,
    required String? ZombieAttackSpeed,
    required String? ZombieAttack,
    required String? ZombieName,
    String? ImagePath, // 新增圖片路徑
  }) async {
    final newZombie = Zombie()
      ..ZombieHp = ZombieHp
      ..ZombieAttackSpeed = ZombieAttackSpeed
      ..ZombieAttack = ZombieAttack
      ..ZombieName = ZombieName
      ..CreateDateTime = DateTime.now().toString().split(' ')[0]
      ..ImagePath = ImagePath;

    await isar.writeTxn(() async {
      await isar.zombies.put(newZombie);
    });
  }
  
  // 確認資料是否成功插入
  static Future<List<Page1>> getAllPage1s() async {
    return await isar.page1s.where().findAll();
  }

  // 取得植物資料
  static Future<List<Plant>> getAllplant() async {
    return await isar.plants.where().findAll();
  }
  // 取得植物資料
  static Future<List<Zombie>> getAllZombie() async {
    return await isar.zombies.where().findAll();
  }
}
