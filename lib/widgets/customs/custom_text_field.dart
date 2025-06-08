import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.title, required this.isObscure, required this.icon,});

  final String title;
  final bool isObscure;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      child: TextField(
        style: const TextStyle(
          height: 2.5,
          fontSize: 17,
          color: middleShadePurple,
        ),
        obscureText: isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(icon.icon,
            color: middleShadePurple,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: title,
          hintStyle: const TextStyle(
            color: middleShadePurple,
            fontFamily: 'Anton',
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
