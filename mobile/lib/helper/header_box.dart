import 'package:flutter/material.dart';
import '../constants.dart';

class HeaderBox extends StatelessWidget {
  final String title;
  final IconData icon;

  const HeaderBox({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          Container(height: 55, color: beforeDarkPurple),
          Positioned(
            top: 5,
            left: 40,
            right: 40,
            child: Container(
              height: 80,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: purple,
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(icon, color: white, size: 55),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
