import 'package:flutter/material.dart';
import 'package:tele_health/constants/colors.dart';
import 'package:tele_health/constants/controllers.dart';
import 'package:tele_health/widgets/auth_button.dart';
import 'package:tele_health/widgets/text_field_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              alignment: Alignment.topLeft,
              child: Text(
                'Welcome\nback',
                style: TextStyle(
                    color: blue, fontSize: 38, fontWeight: FontWeight.bold),
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
              text: Text('Sign In'),
              onClick: () {},
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
