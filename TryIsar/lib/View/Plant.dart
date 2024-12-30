import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isarapp/CreateDataBase/CreateDateBase.dart'; // Import CreateDataBase class
import 'package:isarapp/Model/Plant.dart'; // Import Plant model
import '../Pages/Plant.dart'; // Import AddPlantPage

class PlantPage extends StatefulWidget {
  @override
  _PlantPageState createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  List<Plant> plantData = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final data = await CreateDataBase.getAllplant();
      setState(() {
        plantData = data;
      });
    } catch (e) {
      print('讀取資料時發生錯誤: $e');
    }
  }

  Future<void> _refreshData() async {
    await _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '植物表',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.green[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refreshData,
                child: plantData.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columnSpacing: 20,
                          columns: const [
                            DataColumn(label: Text('植物ID')),
                            DataColumn(label: Text('植物HP')),
                            DataColumn(label: Text('植物攻速')),
                            DataColumn(label: Text('植物攻擊力')),
                            DataColumn(label: Text('植物名稱')),
                            DataColumn(label: Text('創建時間')),
                            DataColumn(label: Text('圖片')), // 新增圖片列
                          ],
                          rows: plantData
                              .map(
                                (plant) => DataRow(
                              cells: [
                                DataCell(Text(plant.id.toString())),
                                DataCell(Text(plant.PlantHp ?? 'N/A')),
                                DataCell(Text(plant.PlantAttackSpeed ?? 'N/A')),
                                DataCell(Text(plant.PlantAttack ?? 'N/A')),
                                DataCell(Text(plant.PlantName ?? 'N/A')),
                                DataCell(Text(_formatDate(plant.CreateDateTime).replaceAll("-", "/"))),
                                DataCell(
                                  plant.ImagePath != null
                                      ? Image.file(
                                    File(plant.ImagePath!), // 顯示圖片
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  )
                                      : Text('No Image'), // 無圖片情況
                                ),
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
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddPlantPage()),
                  ).then((_) {
                    _loadData();
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green[600],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(
                  '插入植物資料',
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

  String _formatDate(String? dateTime) {
    if (dateTime == null) return 'N/A';
    try {
      final DateTime date = DateTime.parse(dateTime);
      final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
      return dateFormat.format(date);
    } catch (e) {
      print('日期格式錯誤: $e');
      return 'N/A';
    }
  }
}

