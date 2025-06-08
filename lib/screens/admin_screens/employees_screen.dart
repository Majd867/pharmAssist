import 'package:flutter/material.dart';
import 'package:pharma_ssist/widgets/customs/custom_button.dart';
import 'package:pharma_ssist/widgets/for_employees/add_employee_popup.dart';

import '../../constants.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({super.key});
  static const String id = 'Employees page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: white,
        ),
        backgroundColor: beforeDarkPurple,
        centerTitle: true,
        title: const Text(
          'Pharmacists management',
          style: TextStyle(
            color: white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: softGray,
      body: Stack(
        children: [
          Positioned(
            bottom: 30,
            left: 50,
            right: 50,
            child: GestureDetector(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (context) => const AddEmployeePopup(),
                );
              },
              child: const CustomButton(
                icon: Icons.add,
                iconSize: 36,
                iconColor: white,
                title: 'Add pharmacist',
                buttonColor: middleShadePurple,
                titleColor: white,
                height: 60,
                width: 200,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
