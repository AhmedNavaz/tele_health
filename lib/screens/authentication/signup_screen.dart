import 'package:flutter/material.dart';
import 'package:tele_health/constants/colors.dart';
import 'package:tele_health/constants/controllers.dart';
import 'package:tele_health/widgets/auth_button.dart';
import 'package:tele_health/widgets/text_field_body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

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
                'Signup to\nget started',
                style: TextStyle(
                    color: blue, fontSize: 38, fontWeight: FontWeight.bold),
              ),
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
              onClick: () {},
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
