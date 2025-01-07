import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'RegicRead.dart'; // 导入 InsertDataPage 页面
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(InsertData());
}

class InsertData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ragic Data Insert',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InsertDataPage(),
      locale: Locale('zh', 'CN'), // 設定為中文（簡體）或 Locale('zh', 'TW') 為繁體
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // 英文
        const Locale('zh', 'CN'), // 中文（簡體）
        const Locale('zh', 'TW'), // 中文（繁體）
      ],
    );
  }
}

class InsertDataPage extends StatefulWidget {
  @override
  _InsertDataPageState createState() => _InsertDataPageState();
}

class _InsertDataPageState extends State<InsertDataPage> {
  @override
  void initState() {
    super.initState();
    // 設定預設日期為當前日期
    final DateTime now = DateTime.now();
    dateController.text = "${now.year.toString().padLeft(4, '0')}/${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')}";
  }
  // 定義輸入控制器
  final TextEditingController nameController = TextEditingController();
  final TextEditingController peopleController = TextEditingController(text: "0");
  final TextEditingController timesController = TextEditingController(text: "0");
  final TextEditingController talkController = TextEditingController(text: "0");
  final TextEditingController lineController = TextEditingController(text: "0");
  // 定義選擇時間的控制器
  final TextEditingController dateController = TextEditingController();
  // 狀態提示訊息
  String message = '';
  Color messageColor = Colors.black;

  // Ragic API 相關常數
  final String apiUrl =
      "https://ap13.ragic.com/OCHDB/ragicsales-order-management/1";
  final String apiKey =
      "dkRKQnBSWCtMZjdja0pnYW5DUFBXZjZMbXNOR3NwYkFkSmI2UStQR2ZEWStxRU5KQ1FHOEQybGFERWFLWUpOVQ=";

  // 用於顯示 loading 層的狀態
  bool isLoading = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('zh', 'TW'), // 如果需要指定中文，這裡可以強制設置
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text = "${pickedDate.year}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.day.toString().padLeft(2, '0')}";
        print(dateController.text);
      });
    }
  }

  // 發送數據的函數
  Future<void> insertData() async {
    // 驗證輸入框是否已填寫
    if (nameController.text.isEmpty ||
        peopleController.text.isEmpty ||
        timesController.text.isEmpty ||
        talkController.text.isEmpty ||
        lineController.text.isEmpty) {
      setState(() {
        message = "請填寫所有欄位！";
        messageColor = Colors.red;
      });
      return;
    }

    // 獲取當前日期和時間，並將其格式化為 yyyy/MM/dd HH:mm 形式
    final DateTime now = DateTime.now();
    final String today = "${now.year.toString().padLeft(4, '0')}/${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')}";
    final String formattedDatetime =
        "${now.year.toString().padLeft(4, '0')}/${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')} "
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
// 判断 dateController.text 是否等于今天的日期
    if (dateController.text == today) {
      // 如果是今天，设置为日期和时间
      dateController.text = formattedDatetime;
    } else {
      // 如果不是今天，追加当前时间
      dateController.text = "${dateController.text} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
    }
    // 準備請求的 payload
    final Map<String, dynamic> payload = {
      "1000001": nameController.text.trim(),
      "1000002": peopleController.text.trim(),
      "1000003": timesController.text.trim(),
      "1000004": talkController.text.trim(),
      "1000005": lineController.text.trim(),
      "1000007": dateController.text.trim(),  // 使用格式化後的日期字串
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

  // 控制加減的函數
  void _incrementValue(TextEditingController controller) {
    setState(() {
      int value = int.tryParse(controller.text) ?? 0;
      controller.text = (value + 1).toString();
    });
  }

  void _decrementValue(TextEditingController controller) {
    setState(() {
      int value = int.tryParse(controller.text) ?? 0;
      if (value > 0) {
        controller.text = (value - 1).toString();
      }
    });
  }

  // 顯示確認對話框
  Future<void> _showConfirmationDialog() async {
    final bool confirm = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("確認"),
          content: Text("確定要新增資料嗎？"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // 返回 false
              },
              child: Text("取消"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // 返回 true
              },
              child: Text("確定"),
            ),
          ],
        );
      },
    ) ?? false;

    if (confirm) {
      insertData(); // 確定後新增資料
    }
  }

  // 顯示成功的提示對話框並返回上一頁
  Future<void> _showSuccessDialog() async {
    final bool confirm = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("成功"),
          content: Text("資料新增成功！"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // 返回 true
                _clearFields(); // 清空輸入框
                Navigator.of(context).pop(); // 返回上一頁
              },
              child: Text("確定"),
            ),
          ],
        );
      },
    );
  }

  // 清空所有輸入框
  void _clearFields() {
    nameController.clear();
    peopleController.text = "0";
    timesController.text = "0";
    talkController.text = "0";
    lineController.text = "0";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("上傳資料"),
        backgroundColor: Colors.purpleAccent,
        elevation: 0, // 去除 AppBar 的陰影
      ),
      body: Center(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 文字输入框
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: "名稱",
                      labelStyle: TextStyle(color: Colors.blue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16), // 增加间距
                  _buildNumberInputField("次數", peopleController),
                  SizedBox(height: 16), // 增加间距
                  _buildNumberInputField("人數", timesController),
                  SizedBox(height: 16), // 增加间距
                  _buildNumberInputField("交談次數", talkController),
                  SizedBox(height: 16), // 增加间距
                  _buildNumberInputField("Line", lineController),
                  SizedBox(height: 16),
// 增加日期選擇器的輸入框
                  TextField(
                    controller: dateController,
                    readOnly: true, // 設定為唯讀
                    onTap: () => _selectDate(context), // 點擊時觸發日期選擇器
                    decoration: InputDecoration(
                      labelText: "選擇日期",
                      labelStyle: TextStyle(color: Colors.blue),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.blue, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                      ),
                    ),
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _showConfirmationDialog, // 顯示確認對話框
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.blueAccent, // 按鈕背景色
                    ),
                    child: Text(
                      "新增",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReadData()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.yellow, // 按鈕背景色
                    ),
                    child: const Text("福音紀錄",
                      style: TextStyle(fontSize: 18)),

                  ),
                  SizedBox(height: 20),
                  // 提示訊息
                  Text(
                    message,
                    style: TextStyle(
                      color: messageColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            // 顯示loading遮罩層
            if (isLoading)
              Positioned.fill(
                child: Container(
                  color: Colors.black54, // 半透明遮罩
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // 加減輸入框的組件
  Widget _buildNumberInputField(String label, TextEditingController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.remove, color: Colors.blue),
          onPressed: () => _decrementValue(controller),
        ),
        SizedBox(
          width: 80,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(color: Colors.blue),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.add, color: Colors.blue),
          onPressed: () => _incrementValue(controller),
        ),
      ],
    );
  }
}
