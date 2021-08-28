import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tele_health/constants/colors.dart';
import 'package:tele_health/constants/controllers.dart';
import 'package:tele_health/controllers/authentication/profile_controller.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  ProfileController profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Welcom to TeleHealth",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Please add your documets for verification, so that you can start working on TeleHealth',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Row(
              children: [
                addDoc('National ID', () {
                  navigationController.navigateTo('/national-id');
                }),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Obx(
                      () =>
                          profileController.doctorProfile.value.idImage == false
                              ? Icon(Icons.close, color: Colors.red)
                              : Icon(Icons.check, color: Colors.green),
                    ))
              ],
            ),
            Row(
              children: [
                addDoc('Academic Documents', () {
                  navigationController.navigateTo('/academic-docs');
                }),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Obx(
                      () => profileController
                                  .doctorProfile.value.academicDocuments ==
                              false
                          ? Icon(Icons.close, color: Colors.red)
                          : Icon(Icons.check, color: Colors.green),
                    ))
              ],
            ),
            Row(
              children: [
                addDoc('Certifications', () {
                  navigationController.navigateTo('/certifications');
                }),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Obx(
                      () => profileController
                                  .doctorProfile.value.certifications ==
                              false
                          ? Icon(Icons.close, color: Colors.red)
                          : Icon(Icons.check, color: Colors.green),
                    ))
              ],
            ),
            Container(
              child: Obx(
                () => ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text('Start Verification'),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary:
                        profileController.doctorProfile.value.idImage == true &&
                                profileController.doctorProfile.value
                                        .academicDocuments ==
                                    true &&
                                profileController
                                        .doctorProfile.value.certifications ==
                                    true
                            ? blue
                            : Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ListTile(
              title: Text('Status:'),
              trailing: Text(
                'Not Verified',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded addDoc(String? text, VoidCallback? onClick) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: OutlinedButton(
          onPressed: onClick,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(text!)),
        ),
      ),
    );
  }
}
