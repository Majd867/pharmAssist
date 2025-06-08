import 'package:flutter/material.dart';
import 'package:pharma_ssist/models/medicine_model.dart';
import 'package:pharma_ssist/widgets/customs/custom_medicine_card.dart';

class MedicineCardListWidget extends StatelessWidget {
  const MedicineCardListWidget({super.key, required this.medicineList});
  final List<MedicineModel> medicineList;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: medicineList.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CustomMedicineCard(medicine: medicineList[index]),
          );
        },
      ),
    );
  }
}
