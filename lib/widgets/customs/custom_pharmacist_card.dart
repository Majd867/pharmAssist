import 'package:flutter/material.dart';
import '../../../models/pharmacist_model.dart';
import '../for_employees/employee_info.dart';

class CustomPharmacistCard extends StatelessWidget {
  const CustomPharmacistCard({super.key, required this.pharmacistModel});
  final PharmacistModel pharmacistModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 0),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '- Dr. ${pharmacistModel.firstname} ${pharmacistModel.lastname}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EmployeeInfo(pharmacist: pharmacistModel),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
