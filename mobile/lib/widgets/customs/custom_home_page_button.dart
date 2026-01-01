import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomHomePageButton extends StatelessWidget {
  const CustomHomePageButton({super.key, required this.title1, required this.title2, required this.icon, required this.routeName,});

  final String title1;
  final String title2;
  final IconData icon;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        height: 170,
        width: 170,
        decoration: BoxDecoration(
          color: middleShadePurple,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 55,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title1,
                  style: const TextStyle(
                    // fontFamily: 'Anton',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: darkPurple,
                  ),
                ),
                Text(
                  title2,
                  style: const TextStyle(
                    // fontFamily: 'Anton',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: darkPurple,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}