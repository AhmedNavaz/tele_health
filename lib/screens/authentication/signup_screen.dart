import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tele_health/constants/colors.dart';
import 'package:tele_health/constants/controllers.dart';
import 'package:tele_health/controllers/authentication/profile_controller.dart';
import 'package:tele_health/models/doctor_profile.dart';
import 'package:tele_health/widgets/auth_button.dart';
import 'package:tele_health/widgets/text_field_body.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  ProfileController profileController = Get.find<ProfileController>();

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();

      profileController.doctorProfile.value = DoctorProfile(
        name: 'Dr. John Doe',
        email: 'heh@gmail.com',
        idImage: false,
        academicDocuments: false,
        certifications: false,
      );
      navigationController.getOffAll('/verification');
    }
  }

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
                    'assets/images/${profileController.accountType.toString().split('.').last}.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFieldBody(
                    textField: TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: 'Name',
                      ),
                      textInputAction: TextInputAction.next,
                      onSaved: (value) {},
                    ),
                  ),
                  TextFieldBody(
                    textField: TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: 'Email Address',
                      ),
                      textInputAction: TextInputAction.next,
                      onSaved: (value) {},
                    ),
                  ),
                  TextFieldBody(
                    textField: TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 8) {
                          return 'Password must be atleast 8 characters';
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: 'Password',
                      ),
                      textInputAction: TextInputAction.done,
                      onSaved: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            AuthButton(
              text: Text('Signup'),
              onClick: _submit,
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
