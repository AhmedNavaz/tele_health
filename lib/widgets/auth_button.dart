import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthButton extends StatelessWidget {
  AuthButton({Key? key, this.text, this.onClick}) : super(key: key);
  Widget? text;
  Function? onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: () => onClick,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 119, vertical: 22),
          child: text,
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
