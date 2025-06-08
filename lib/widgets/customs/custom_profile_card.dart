import 'package:flutter/material.dart';
import '../../constants.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: white,
      margin: const EdgeInsets.symmetric(vertical: 7.0 , horizontal: 12.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: darkPurple,
            size: 25.0,
          ),
          title: Text(
            title,
            style: const TextStyle(
              //fontFamily: 'Anton',
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
              color: darkPurple,
            ),
          ),
        ),
      ),
    );
  }
}
