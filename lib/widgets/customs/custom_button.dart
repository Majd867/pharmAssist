import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.buttonColor,
    required this.titleColor,
    required this.height,
    required this.width,
    required this.fontSize,
    this.icon,
    this.iconSize,
    this.iconColor,
  });

  final String title;
  final Color buttonColor;
  final Color titleColor;
  final double height;
  final double width;
  final double fontSize;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Anton',
                fontSize: fontSize,
                color: titleColor,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
