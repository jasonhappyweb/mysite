import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:isarapp/main.dart';
void main() {
  runApp(const ReadBest());
}

class ReadBest extends StatelessWidget {
  const ReadBest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  // 變數存儲最常出現的姓名
  String mostFrequentName = '';
  int mostFrequentCount = 0;

  final String baseUrl = "https://ap13.ragic.com/OCHDB/ragicsales-order-management/1";
  final String apiKey ="dkRKQnBSWCtMZjdja0pnYW5DUFBXZjZMbXNOR3NwYkFkSmI2UStQR2ZEWStxRU5KQ1FHOEQybGFERWFLWUpOVQ=";

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
    });

    final String name = _nameController.text.trim();
    String url = "$baseUrl?V=1&APIKey=$apiKey&api";

    // 添加姓名條件
    if (name.isNotEmpty) {
      url += "&where=1000001,eq,$name";
    }

    // 添加日期範圍條件
    if (_startDate != null && _endDate != null && _startDate != _endDate) {
      String startFormattedDate = "${_startDate!.year}/${_startDate!.month.toString().padLeft(2, '0')}/${_startDate!.day.toString().padLeft(2, '0')}";
      String endFormattedDate = "${_endDate!.year}/${_endDate!.month.toString().padLeft(2, '0')}/${_endDate!.day.toString().padLeft(2, '0')}";
      if (startFormattedDate == endFormattedDate) {
        url += "&where=1000007,like,$startFormattedDate";
      } else {
        url += "&where=1000007,gt,${startFormattedDate} 00:00&where=1000007,lt,${endFormattedDate} 23:59";
      }
    }

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        try {
          final Map<String, dynamic> jsonData = json.decode(response.body);

          setState(() {
            _fetchedData = jsonData.values.map((data) {
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

          // Calculate the most frequent names
          _findMostFrequentName();

        } catch (e) {
          _showError("資料解析失敗，請檢查返回的數據格式。");
        }
      } else {
        _showError("資料查詢失敗，請檢查伺服器狀態。");
      }
    } catch (e) {
      _showError("無法取得資料，請檢查網路連線。");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Calculate the most frequent name(s)
  void _findMostFrequentName() {
    Map<String, int> nameFrequency = {};

    for (var data in _fetchedData) {
      String name = data["Name"];
      if (nameFrequency.containsKey(name)) {
        nameFrequency[name] = nameFrequency[name]! + 1;
      } else {
        nameFrequency[name] = 1;
      }
    }

    int maxCount = nameFrequency.values.fold(0, (prev, count) => count > prev ? count : prev);

    List<String> frequentNames = [];
    nameFrequency.forEach((name, count) {
      if (count == maxCount) {
        frequentNames.add(name);
      }
    });

    setState(() {
      mostFrequentName = frequentNames.join(", ");  // Join names with commas
      mostFrequentCount = maxCount;
    });
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
            Row(
              children: [
                TextButton(
                  onPressed: () => _selectStartDate(context),
                  child: Text(
                    _startDate == null
                        ? '選擇起始日期'
                        : '${_startDate!.year}-${_startDate!.month}-${_startDate!.day}',
                  ),
                ),
                const SizedBox(width: 16),
                TextButton(
                  onPressed: () => _selectEndDate(context),
                  child: Text(
                    _endDate == null
                        ? '選擇結束日期'
                        : '${_endDate!.year}-${_endDate!.month}-${_endDate!.day}',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchData,
              child: const Text("查詢"),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : Column(
              children: [
                mostFrequentName.isEmpty
                    ? const Text("未查詢到資料")
                    : Text(
                  "傳福音最多次的人是: $mostFrequentName\n次數是: $mostFrequentCount",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to MoleGamePage and pass plantData
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
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
                '返回',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
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
    );
    if (picked != null && picked != _endDate)
      setState(() {
        _endDate = picked;
      });
  }
}
