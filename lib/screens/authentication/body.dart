import 'package:flutter/material.dart';
import 'package:tele_health/constants/colors.dart';
import 'package:tele_health/constants/controllers.dart';
import 'package:tele_health/screens/authentication/login_screen.dart';
import 'package:tele_health/screens/authentication/signup_screen.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Align(
            alignment: Alignment.topLeft,
            child: ElevatedButton(
              onPressed: () {
                navigationController.goBack();
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, left: 20, right: 5),
                child: Icon(Icons.arrow_back_ios),
              ),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                onPrimary: blue,
                primary: blue.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                )),
              ),
            ),
          ),
          Expanded(
              child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: navigationController.sheetController,
            children: [
              LoginScreen(),
              SignupScreen(),
            ],
          ))
        ],
      ),
    );
  }
}
