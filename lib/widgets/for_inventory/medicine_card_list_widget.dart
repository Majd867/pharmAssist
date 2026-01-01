import 'package:flutter/material.dart';
import 'package:pharma_ssist/models/medicine_model.dart';
import 'package:pharma_ssist/widgets/customs/custom_medicine_card.dart';

class MedicineCardListWidget extends StatelessWidget {
  final List<MedicineModel> medicineList;

  const MedicineCardListWidget({super.key, required this.medicineList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: medicineList
          .map(
            (medicine) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CustomMedicineCard(medicine: medicine),
        ),
      )
          .toList(),
    );
  }
}
