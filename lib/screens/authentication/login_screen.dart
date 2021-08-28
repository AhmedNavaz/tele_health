import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tele_health/constants/colors.dart';
import 'package:tele_health/constants/controllers.dart';
import 'package:tele_health/controllers/authentication/profile_controller.dart';
import 'package:tele_health/widgets/auth_button.dart';
import 'package:tele_health/widgets/text_field_body.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ProfileController profileController = Get.find<ProfileController>();

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
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
                    'Welcome\nback',
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
                          return 'Password must be atleat 8 characters';
                        }
                        return null;
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
              text: Text('Sign In'),
              onClick: _submit,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Forgot Your Password?'),
                  TextButton(
                    onPressed: () {
                      navigationController.sheetController.animateToPage(1,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate);
                    },
                    child: Text(
                      'Signup',
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
