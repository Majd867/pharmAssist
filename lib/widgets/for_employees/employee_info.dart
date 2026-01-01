import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';
import '../../../models/pharmacist_model.dart';

class EmployeeInfo extends StatelessWidget {
  const EmployeeInfo({super.key, required this.pharmacist});
  final PharmacistModel pharmacist;

  static const String id = 'EmployeeInfoPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Pharmacist Info',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: beforeDarkPurple,
        iconTheme: const IconThemeData(color: white),
      ),
      body: Container(
        color: white,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView(
              children: [
                _infoCard(title: 'First Name', value: pharmacist.firstname),
                _infoCard(title: 'Last Name', value: pharmacist.lastname),
                _infoCard(title: 'user Name', value: pharmacist.username),
                _infoCard(title: 'Phone', value: pharmacist.phone),
                _infoCard(title: 'Salary', value: '${pharmacist.salary} S.P.'),
                _infoCard(title: 'Is Admin', value: pharmacist.isAdmin ? 'Yes' : 'No'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoCard({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          alignment: Alignment.centerLeft,
          constraints: const BoxConstraints(minHeight: 80),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '$title: $value',
            style: const TextStyle(
              color: darkPurple,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
