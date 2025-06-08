import 'package:flutter/material.dart';
import '../../constants.dart';

class CustomTextField2 extends StatelessWidget {
  const CustomTextField2(
      {super.key,
      required this.label,
      required this.hintText,
      required this.prefixIcon,
      this.suffixIcon
      });

  final String label, hintText;
  final IconData? prefixIcon, suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      style: const TextStyle(
        fontSize: 20,
        color: darkPurple,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        label: Text(
          label,
          style: const TextStyle(
            color: darkPurple,
            fontSize: 18,
          ),
        ),
        prefixIcon: Icon(
          prefixIcon,
          size: 25,
          color: darkPurple,
        ),

        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            suffixIcon,
            size: 40,
            color: darkPurple,
          ),
        ),

        hintText: hintText,
        hintStyle: const TextStyle(
          color: darkPurple,
          fontSize: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 4.0,
            color: darkPurple,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            width: 4.0,
            color: darkPurple,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            width: 4.0,
            color: darkPurple,
          ),
        ),
      ),
    );
  }
}
