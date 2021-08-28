import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tele_health/constants/colors.dart';
import 'package:tele_health/constants/controllers.dart';
import 'package:tele_health/controllers/authentication/profile_controller.dart';
import 'package:tele_health/models/doctor_profile.dart';
import 'dart:io';

import 'package:tele_health/utils/image_handler.dart';

class IDScreen extends StatefulWidget {
  const IDScreen({Key? key}) : super(key: key);

  @override
  _IDScreenState createState() => _IDScreenState();
}

class _IDScreenState extends State<IDScreen> {
  ProfileController profileController = Get.find<ProfileController>();

  File? _frontImage;
  File? _backImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blue,
        centerTitle: true,
        title: Text(
          "National ID Scan",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Text(
                  "Have a final check if all data is clearly visible and that matches the information you'll be providing us.",
                  textAlign: TextAlign.center),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ListTile(
                title: Text(
                  'Front Side',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.camera_alt, color: blue),
                  onPressed: () {
                    ImageHandler.takePicture()!.then((value) {
                      value.path == ''
                          ? null
                          : setState(() {
                              _frontImage = value;
                            });
                    });
                  },
                ),
              ),
              Container(
                width: 500,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: _frontImage == null
                    ? Text('No Image Taken')
                    : Image.file(
                        _frontImage!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                alignment: Alignment.center,
              ),
              ListTile(
                title: Text(
                  'Back Side',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.camera_alt, color: blue),
                  onPressed: () {
                    ImageHandler.takePicture()!.then((value) {
                      value.path == ''
                          ? null
                          : setState(() {
                              _backImage = value;
                            });
                    });
                  },
                ),
              ),
              Container(
                width: 500,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: _backImage == null
                    ? Text('No Image Taken')
                    : Image.file(
                        _backImage!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                alignment: Alignment.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(120, 50),
                ),
                onPressed: () {
                  profileController.doctorProfile.value.idImage = true;
                  navigationController.goBack();
                },
                child: Text('Save'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
