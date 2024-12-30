import 'package:flutter/material.dart';
import 'package:isarapp/Model/Plant.dart'; // 确保路径正确
import '../CreateDataBase/CreateDateBase.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // 用于文件操作

class AddPlantPage extends StatefulWidget {
  @override
  _AddPlantPageState createState() => _AddPlantPageState();
}

class _AddPlantPageState extends State<AddPlantPage> {
  final _formKey = GlobalKey<FormState>();
  String? PlantHp;
  String? PlantAttackSpeed;
  String? PlantAttack;
  String? _plantName;
  String? _imagePath; // 保存图片路径

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imagePath = image.path; // 保存图片路径
      });
    }
  }

  Future<void> _savePlant() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      await CreateDataBase.createPlant(
        PlantHp: PlantHp,
        PlantAttackSpeed: PlantAttackSpeed,
        PlantAttack: PlantAttack,
        PlantName: _plantName,
        ImagePath: _imagePath, // 保存图片路径到数据库
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Plant added successfully!')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Plant'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400, // 限制表单宽度
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'PlantHp'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the plant name';
                      }
                      return null;
                    },
                    onSaved: (value) => PlantHp = value,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'PlantAttackSpeed'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the plant name';
                      }
                      return null;
                    },
                    onSaved: (value) => PlantAttackSpeed = value,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'PlantAttack'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the plant name';
                      }
                      return null;
                    },
                    onSaved: (value) => PlantAttack = value,
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Plant Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the plant name';
                      }
                      return null;
                    },
                    onSaved: (value) => _plantName = value,
                  ),
                  SizedBox(height: 16),
                  _imagePath != null
                      ? Image.file(
                    File(_imagePath!),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ) // 显示选择的图片
                      : Text('No image selected'),
                  TextButton(
                    onPressed: _pickImage,
                    child: Text('Select Image'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _savePlant,
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
