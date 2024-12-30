import 'package:flutter/material.dart';
import 'package:isarapp/Model/Page1.dart';

import '../CreateDataBase/CreateDateBase.dart';

class InsertDataPage extends StatefulWidget {
  @override
  _InsertDataPageState createState() => _InsertDataPageState();
}

class _InsertDataPageState extends State<InsertDataPage> {
  final _formKey = GlobalKey<FormState>();  // 表单的关键字
  final _userNMCController = TextEditingController();
  final _timesController = TextEditingController();
  final _peopleController = TextEditingController();
  final _talkController = TextEditingController();
  final _lineController = TextEditingController();

  // 用來存儲頁面輸入的數據
  String? userNMC;
  String? times;
  String? people;
  String? talk;
  String? line;

  // 保存数据到数据库
  Future<void> _insertData() async {
    if (_formKey.currentState!.validate()) {
      // 确保表单验证通过
      // 创建新的 Page1 实例
      await CreateDataBase.createPage1(
        userNMC: userNMC,
        times: times,
        people: people,
        talk: talk,
        line: line,
      );  // 调用数据库操作插入数据
      Navigator.pop(context);  // 插入完成后返回上一个页面
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("插入 Page1 數據"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,  // 使用表单的 key
          child: ListView(
            children: <Widget>[
              // 用户名称输入框
              TextFormField(
                controller: _userNMCController,
                decoration: InputDecoration(labelText: "用户名"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入用户名';
                  }
                  return null;
                },
                onChanged: (value) {
                  userNMC = value;  // 更新变量
                },
              ),
              // 时间输入框
              TextFormField(
                controller: _timesController,
                decoration: InputDecoration(labelText: "时间"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入时间';
                  }
                  return null;
                },
                onChanged: (value) {
                  times = value;  // 更新变量
                },
              ),
              // 人数输入框
              TextFormField(
                controller: _peopleController,
                decoration: InputDecoration(labelText: "人数"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入人数';
                  }
                  if (int.tryParse(value) == null) {
                    return '请输入有效的人数';
                  }
                  return null;
                },
                onChanged: (value) {
                  people = value;  // 更新变量
                },
              ),
              // 谈话输入框
              TextFormField(
                controller: _talkController,
                decoration: InputDecoration(labelText: "talk"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入谈话内容';
                  }
                  return null;
                },
                onChanged: (value) {
                  talk = value;  // 更新变量
                },
              ),
              // 路线输入框
              TextFormField(
                controller: _lineController,
                decoration: InputDecoration(labelText: "Line"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入路线';
                  }
                  return null;
                },
                onChanged: (value) {
                  line = value;  // 更新变量
                },
              ),
              // 提交按钮
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: _insertData,  // 点击按钮保存数据
                  child: Text("保存数据"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
