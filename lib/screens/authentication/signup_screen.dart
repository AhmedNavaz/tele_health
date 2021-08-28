import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tele_health/constants/colors.dart';
import 'package:tele_health/constants/controllers.dart';
import 'package:tele_health/controllers/authentication/profile_controller.dart';
import 'package:tele_health/models/doctor_profile.dart';
import 'package:tele_health/widgets/auth_button.dart';
import 'package:tele_health/widgets/text_field_body.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Signup to\nget started',
                    style: TextStyle(
                        color: blue, fontSize: 38, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    'assets/images/doctor.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
            TextFieldBody(
              textField: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: 'Name',
                ),
              ),
            ),
            TextFieldBody(
              textField: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: 'Email Address',
                ),
              ),
            ),
            TextFieldBody(
              textField: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: 'Password',
                ),
              ),
            ),
            AuthButton(
              text: Text('Signup'),
              onClick: () {
                profileController.doctorProfile.value = DoctorProfile(
                  name: 'Dr. John Doe',
                  email: 'heh@gmail.com',
                  idImage: false,
                  academicDocuments: false,
                  certifications: false,
                );
                navigationController.getOffAll('/verification');
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Already Have An Account?'),
                  TextButton(
                    onPressed: () {
                      navigationController.sheetController.animateToPage(0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate);
                    },
                    child: Text(
                      'Sign In',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
