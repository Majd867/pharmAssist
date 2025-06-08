  import 'package:flutter/material.dart';
import 'package:pharma_ssist/screens/public_screens/log_in_screen.dart';

  import '../../constants.dart';
  import '../customs/custom_button.dart';

  class LogOutPopUp extends StatelessWidget {
    const LogOutPopUp({super.key});

    @override
    Widget build(BuildContext context) {
      return AlertDialog(
        title: const Text('Log out of PharmAssist'),
        content: const Text('Do you really want to log out?'),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const CustomButton(
              title: 'cancel',
              buttonColor: softGray,
              titleColor: middleShadePurple,
              height: 40,
              width: 95,
              fontSize: 18,
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, LogInScreen.id);
            },
            child: const CustomButton(
              title: 'Yes',
              buttonColor: Colors.red,
              titleColor: softGray,
              height: 40,
              width: 85,
              fontSize: 18,
            ),
          )
        ],
      );
    }
  }
