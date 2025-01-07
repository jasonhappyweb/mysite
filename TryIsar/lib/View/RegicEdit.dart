import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'RegicRead.dart'; // Import InsertDataPage page
class EditDataPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const EditDataPage({Key? key, required this.data}) : super(key: key);

  @override
  _EditDataPageState createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
  // 使用 TextEditingController 來處理文本框
  late TextEditingController _nameController;
  late TextEditingController _peopleController;
  late TextEditingController _timesController;
  late TextEditingController _talkController;
  late TextEditingController _lineController;
  late TextEditingController _DateTimeController;

  bool isLoading = false;
  String message = '';
  Color messageColor = Colors.black;

  @override
  void initState() {
    super.initState();
    // 初始化控制器，並將原始資料填充到控制器中
    String OldName = widget.data["Name"];
    String OdlDateTime = widget.data["Datetime"];
    _nameController = TextEditingController(text: widget.data["Name"]);
    _peopleController = TextEditingController(text: widget.data["People"].toString());
    _timesController = TextEditingController(text: widget.data["Times"].toString());
    _talkController = TextEditingController(text: widget.data["Talk"].toString());
    _lineController = TextEditingController(text: widget.data["Line"].toString());
    _DateTimeController = TextEditingController(text: widget.data["Datetime"].toString());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _peopleController.dispose();
    _timesController.dispose();
    _talkController.dispose();
    _lineController.dispose();
    _DateTimeController.dispose();
    super.dispose();
  }
  // Ragic API 相關常數

  // 儲存修改的資料
  Future<void> _saveData() async {
    String oldName = widget.data["Name"];
    String oldDatetime = widget.data["Datetime"];

    // 先刪除舊的資料
    await _deleteData(oldName, oldDatetime);

    final String apiUrl = "https://ap13.ragic.com/OCHDB/ragicsales-order-management/1";
    final String apiKey = "dkRKQnBSWCtMZjdja0pnYW5DUFBXZjZMbXNOR3NwYkFkSmI2UStQR2ZEWStxRU5KQ1FHOEQybGFERWFLWUpOVQ=";

    // 驗證輸入框是否已填寫
    if (_nameController.text.isEmpty ||
        _peopleController.text.isEmpty ||
        _timesController.text.isEmpty ||
        _talkController.text.isEmpty ||
        _lineController.text.isEmpty) {
      setState(() {
        message = "請填寫所有欄位！";
        messageColor = Colors.red;
      });
      return;
    }

    // 準備請求的 payload
    final Map<String, dynamic> payload = {
      "1000001": _nameController.text.trim(),
      "1000002": _peopleController.text.trim(),
      "1000003": _timesController.text.trim(),
      "1000004": _talkController.text.trim(),
      "1000005": _lineController.text.trim(),
      "1000007": _DateTimeController.text.trim(),  // 使用格式化後的日期字串
    };

    // 顯示 loading 層
    setState(() {
      isLoading = true;
    });

    try {
      // 發送 HTTP POST 請求
      final response = await http.post(
        Uri.parse("$apiUrl?APIKey=$apiKey&api"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(payload),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // 顯示新增成功的對話框
        _showSuccessDialog();
      } else {
        setState(() {
          message = "資料新增失敗：${response.statusCode}";
          messageColor = Colors.red;
        });
      }
    } catch (error) {
      setState(() {
        message = "資料新增失敗，請檢查網路連線。";
        messageColor = Colors.red;
      });
      print("Error: $error");
    } finally {
      // 隱藏 loading 層
      setState(() {
        isLoading = false;
      });
    }
  }

// 刪除資料
  Future<void> _deleteData(String name, String datetime) async {
    final String baseUrl = "https://ap13.ragic.com/OCHDB/ragicsales-order-management/1";
    final String apiKey = "dkRKQnBSWCtMZjdja0pnYW5DUFBXZjZMbXNOR3NwYkFkSmI2UStQR2ZEWStxRU5KQ1FHOEQybGFERWFLWUpOVQ=";  // 請將此替換為正確的 API key

    // 執行刪除操作
    String url = "$baseUrl?V=1&APIKey=$apiKey&api&where=1000001,eq,$name&where=1000007,eq,$datetime";

    try {
      final response = await http.delete(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          message = "舊資料已成功刪除！";
          messageColor = Colors.green;
        });
      } else {
        setState(() {
          message = "刪除舊資料失敗！";
          messageColor = Colors.red;
        });
      }
    } catch (error) {
      setState(() {
        message = "刪除資料失敗，請檢查網路連線。";
        messageColor = Colors.red;
      });
      print("Error: $error");
    }
  }
// 顯示成功提示對話框
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("成功"),
        content: const Text("資料已成功插入！"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReadData()),
              );
            },
            child: const Text("確定"),
          ),
        ],
      ),
    );
  }
// 日期選擇器，並添加當前時間
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('zh', 'TW'), // 如果需要指定中文，這裡可以強制設置
    );

    if (pickedDate != null) {
      // Get current time (hour and minute)
      final TimeOfDay nowTime = TimeOfDay.now();
      // Format the date and time as 'yyyy/MM/dd HH:mm'
      setState(() {
        _DateTimeController.text = "${pickedDate.year}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.day.toString().padLeft(2, '0')} ${nowTime.hour.toString().padLeft(2, '0')}:${nowTime.minute.toString().padLeft(2, '0')}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("編輯資料"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "姓名",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _peopleController,
              decoration: const InputDecoration(
                labelText: "次數",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _timesController,
              decoration: const InputDecoration(
                labelText: "人數",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _talkController,
              decoration: const InputDecoration(
                labelText: "對話",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _lineController,
              decoration: const InputDecoration(
                labelText: "Line",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _DateTimeController,
              decoration: InputDecoration(
                labelText: "創建日期時間",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading ? null : _saveData,
              child: isLoading ? const CircularProgressIndicator() : const Text("儲存修改"),
            ),
            if (message.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  message,
                  style: TextStyle(color: messageColor),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
