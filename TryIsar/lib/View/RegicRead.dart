import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Regic.dart'; // 导入 InsertDataPage 页面
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:isarapp/main.dart';
void main() {
  runApp(const ReadData(),);

}

class ReadData extends StatelessWidget {
  const ReadData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', 'CN'), // 简体中文
        Locale('zh', 'TW'), // 繁体中文
      ],
      locale: const Locale('zh', 'CN'), // 设置默认语言为简体中文
      title: 'Ragic Data Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DataViewer(),
    );
  }
}

class DataViewer extends StatefulWidget {
  const DataViewer({Key? key}) : super(key: key);

  @override
  _DataViewerState createState() => _DataViewerState();
}

class _DataViewerState extends State<DataViewer> {
  final TextEditingController _nameController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;
  List<Map<String, dynamic>> _fetchedData = [];
  bool _isLoading = false;

  // 统计数据
  int totalPeople = 0;
  int totalTimes = 0;
  int totalTalk = 0;
  int totalLine = 0;

  final String baseUrl = "https://ap13.ragic.com/OCHDB/ragicsales-order-management/1";
  final String apiKey =
      "dkRKQnBSWCtMZjdja0pnYW5DUFBXZjZMbXNOR3NwYkFkSmI2UStQR2ZEWStxRU5KQ1FHOEQybGFERWFLWUpOVQ=";

  @override
  void initState() {
    super.initState();
    // 设置默认的起始日期和结束日期为今天的日期
    _startDate = DateTime.now();
    _endDate = DateTime.now();
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
      _fetchedData = [];
      // 重置统计数据
      totalPeople = 0;
      totalTimes = 0;
      totalTalk = 0;
      totalLine = 0;
    });

    final String name = _nameController.text.trim();
    String url = "$baseUrl?V=1&APIKey=$apiKey&api";

    // 添加姓名条件
    if (name.isNotEmpty) {
      url += "&where=1000001,like,$name";
    }

    // 添加日期范围条件
    if (_startDate != null && _endDate != null) {
      String startFormattedDate = "${_startDate!.year}/${_startDate!.month.toString().padLeft(2, '0')}/${_startDate!.day.toString().padLeft(2, '0')}";
      String endFormattedDate = "${_endDate!.year}/${_endDate!.month.toString().padLeft(2, '0')}/${_endDate!.day.toString().padLeft(2, '0')}";
      if(startFormattedDate == endFormattedDate){
        url += "&where=1000007,like,$startFormattedDate";
      }
      else{
        url += "&where=1000007,gt,${startFormattedDate} 00:00&where=1000007,lt,${endFormattedDate} 23:59";
      }
    }
    print("Fetching data from URL: $url");

    try {
      final response = await http.get(Uri.parse(url));
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        try {
          final Map<String, dynamic> jsonData = json.decode(response.body);
          setState(() {
            _fetchedData = jsonData.values.map((data) {
              totalPeople += int.tryParse(data["people"]?.toString() ?? "0") ?? 0;
              totalTimes += int.tryParse(data["times"]?.toString() ?? "0") ?? 0;
              totalTalk += int.tryParse(data["talk"]?.toString() ?? "0") ?? 0;
              totalLine += int.tryParse(data["line"]?.toString() ?? "0") ?? 0;

              return {
                "Name": data["Name"] ?? "N/A",
                "People": data["people"] ?? "N/A",
                "Times": data["times"] ?? "N/A",
                "Talk": data["talk"] ?? "N/A",
                "Line": data["line"] ?? "N/A",
                "Datetime": data["CreateDatetime"] ?? "N/A",
              };
            }).toList();
          });
        } catch (e) {
          print("Error parsing JSON: $e");
          _showError("資料解析失敗，請檢查返回的數據格式。");
        }
      } else {
        _showError("資料查詢失敗，請檢查伺服器狀態。");
      }
    } catch (e) {
      print("Error occurred: $e");
      _showError("無法取得資料，請檢查網路連線。");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("錯誤"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("確定"),
          ),
        ],
      ),
    );
  }

  Widget _buildTable() {
    if (_fetchedData.isEmpty) {
      return const Text("無資料可顯示");
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 30,   // 列之间的间距，调整为合适的宽度
        columns: const [
          DataColumn(label: Text("姓名")),
          DataColumn(label: Text("人數")),
          DataColumn(label: Text("次數")),
          DataColumn(label: Text("對話")),
          DataColumn(label: Text("Line")),
          DataColumn(label: Text("上傳時間")),
        ],
        rows: _fetchedData.map((data) {
          return DataRow(cells: [
            DataCell(Text(data["Name"] ?? "")),
            DataCell(Text(data["People"] ?? "")),
            DataCell(Text(data["Times"] ?? "")),
            DataCell(Text(data["Talk"] ?? "")),
            DataCell(Text(data["Line"] ?? "")),
            DataCell(Text(data["Datetime"] ?? "")),
          ]);
        }).toList(),
      ),
    );
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      locale: const Locale('zh', 'TW'), // 如果需要指定中文，這裡可以強制設置
    );
    if (picked != null && picked != _startDate)
      setState(() {
        _startDate = picked;
      });
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      locale: const Locale('zh', 'TW'), // 如果需要指定中文，這裡可以強制設置
    );
    if (picked != null && picked != _endDate)
      setState(() {
        _endDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("查詢資料"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "請輸入姓名",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            // 日期选择部分美化
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.blue.shade50, // 背景颜色
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => _selectStartDate(context),
                      child: Text(
                        _startDate == null
                            ? '選擇起始日期'
                            : '${_startDate!.year}-${_startDate!.month}-${_startDate!.day}',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16, // 增大字体
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "~",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () => _selectEndDate(context),
                      child: Text(
                        _endDate == null
                            ? '選擇結束日期'
                            : '${_endDate!.year}-${_endDate!.month}-${_endDate!.day}',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16, // 增大字体
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _fetchData,
                  child: const Text("查詢"),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InsertData()),
                    );
                  },
                  child: const Text("新增資料"),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                  child: const Text("返回"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: _buildTable(),
              ),
            ),
            const SizedBox(height: 20),
            // 顯示總計
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("總計："),
                Text("人數: $totalPeople"),
                Text("次數: $totalTimes"),
                Text("對話: $totalTalk"),
                Text("Line: $totalLine"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

