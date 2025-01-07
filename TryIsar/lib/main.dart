import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:isarapp/Model/Page1.dart'; // Import Page1 page
import 'package:isarapp/CreateDataBase/CreateDateBase.dart'; // Import CRUD database operations
import 'package:isarapp/Pages/Page1.dart'; // Import InsertDataPage page
import 'package:isarapp/View/Plant.dart';
import 'package:isarapp/View/Zombie.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart'; // For launching URLs
import 'Model/Plant.dart';
import 'View/PlantZombie.dart'; // Import InsertDataPage page
import 'View/Regic.dart'; // Import InsertDataPage page
import 'View/RegicRead.dart'; // Import InsertDataPage page
import 'View/RegicBest.dart'; // Import InsertDataPage page

void main() {
  CreateDataBase.initialize(); // Initialize database
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '植物大戰殭屍',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(), // Main page to show all data
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double size = 24;
  List<Page1> page1Data = []; // Store Page1 data
  List<Plant> plantData = []; // Store Plant data

  final String versionUrl =
      "https://ap13.ragic.com/OCHDB/ragicsales-order-management/2?V=1&APIKey=dkRKQnBSWCtMZjdja0pnYW5DUFBXZjZMbXNOR3NwYkFkSmI2UStQR2ZEWStxRU5KQ1FHOEQybGFERWFLWUpOVQ=&api&where=1000008,eq,ochapp";

  @override
  void initState() {
    super.initState();
    _initializeDatabase(); // Initialize database
    _checkVersion(); // Check version on app start
  }

  Future<void> _checkVersion() async {
    try {
      // Fetch server version (expecting JSON format)
      final response = await http.get(Uri.parse(versionUrl));
      if (response.statusCode == 200) {
        final data = response.body;
        final serverVersion = _parseVersion(data); // Extract version from JSON

        // Get current app version
        final packageInfo = await PackageInfo.fromPlatform();
        final appVersion = packageInfo.version;

        if (serverVersion != appVersion) {
          // Show update dialog if versions don't match
          _showUpdateDialog(serverVersion);
        }
      } else {
        print("Failed to fetch server version. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching version: $e");
    }
  }

  String _parseVersion(String responseData) {
    final Map<String, dynamic> jsonData = json.decode(responseData);
    return jsonData["0"]["VersionNumber"]; // Extract the "VersionNumber" field
  }

  void _showUpdateDialog(String serverVersion) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("更新版本"),
          content: Text("有新版本可用：$serverVersion。是否立即更新？"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: Text("稍後"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                _launchUpdateUrl();
              },
              child: Text("更新"),
            ),
          ],
        );
      },
    );
  }

  void _launchUpdateUrl() async {
    final Uri url = Uri.parse("https://jasonhappyweb.github.io/mysite/TryIsar/Index.html");

    try {
      // 使用 launchUrl 來打開 URL
      await launchUrl(url);
    } catch (e) {
      // 捕捉錯誤並打印
      print("Could not launch $url: $e");
    }
  }

  // Refresh data logic
  Future<void> _refreshData() async {
    await _loadPage1Data(); // Reload Page1 data
    await _loadPlantData(); // Reload Plant data
  }

  // Initialize database and load data
  Future<void> _initializeDatabase() async {
    await CreateDataBase.initialize(); // Ensure the database is initialized
    await _loadPage1Data(); // Load Page1 data
    await _loadPlantData(); // Load Plant data
  }

  // Load Page1 data from Isar
  Future<void> _loadPage1Data() async {
    final data = await CreateDataBase.getAllPage1s(); // Get all Page1 data
    setState(() {
      page1Data = data; // Update Page1 data for display
    });
  }

  // Load Plant data from Isar
  Future<void> _loadPlantData() async {
    final data = await CreateDataBase.getAllplant(); // Get all Plant data
    setState(() {
      plantData = data; // Update Plant data for display
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '傳福音App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green[600],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.7,
              child: Image.network(
                'https://jasonhappyweb.github.io/mysite/%E8%BD%89%E7%9B%A4%E9%81%8A%E6%88%B2/LINE_ALBUM_1130715_240729_1.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReadData()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[600],
                      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      '讀取福音紀錄',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InsertData()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[600],
                      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      '新增福音紀錄',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReadBest()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[600],
                      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      '傳到王',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.green[50],
    );
  }
}
