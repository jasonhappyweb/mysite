import 'package:flutter/material.dart';
import 'package:isarapp/Model/Page1.dart'; // Import Page1 page
import 'package:isarapp/CreateDataBase/CreateDateBase.dart'; // Import CRUD database operations
import 'package:isarapp/Pages/Page1.dart'; // Import InsertDataPage page
import 'package:isarapp/View/Plant.dart';
import 'package:isarapp/View/Zombie.dart';
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

  @override
  void initState() {
    super.initState();
    _initializeDatabase(); // Initialize database
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
      body: Stack(  // Stack to layer the background and the buttons
        children: [
          // Background Image with Opacity
          Positioned.fill(
            child: Opacity(
              opacity: 0.7,  // Set the opacity to make the image transparent
              child: Image.network(
                'https://jasonhappyweb.github.io/mysite/%E8%BD%89%E7%9B%A4%E9%81%8A%E6%88%B2/LINE_ALBUM_1130715_240729_1.jpg', // Background image
                fit: BoxFit.cover,  // Cover the entire screen
              ),
            ),
          ),
          // Foreground widgets (buttons)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,  // Vertically center the widgets
                crossAxisAlignment: CrossAxisAlignment.center,  // Horizontally center the widgets
                children: <Widget>[
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReadData()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[600],  // Background color
                      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),  // Rounded corners
                      ),
                      elevation: 5,  // Shadow effect
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
      backgroundColor: Colors.green[50], // Subtle green background for the app
    );
  }
}
