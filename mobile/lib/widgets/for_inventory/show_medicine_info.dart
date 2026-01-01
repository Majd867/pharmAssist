import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/models/medicine_model.dart';
import 'package:pharma_ssist/widgets/customs/custom_button.dart';
import 'package:pharma_ssist/widgets/customs/custom_text.dart';

class ShowMedicineInfo extends StatelessWidget {
  const ShowMedicineInfo({super.key, required this.medicine});

  final MedicineModel medicine;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
          medicine.name,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: 'Anton'
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(text: 'Scientific Name: ${medicine.scientificName}'),
          const SizedBox(height: 12),

          CustomText(text: 'Category: ${medicine.category}.'),
          const SizedBox(height: 12),

          CustomText(text: 'Manufacturer: ${medicine.manufacturer}.'),
          const SizedBox(height: 12),

          CustomText(text: 'Price: ${medicine.price.toString()} S.P.'),
          const SizedBox(height: 12),

          CustomText(text: 'Prescription: ${medicine.prescription}.'),
          const SizedBox(height: 12),

          CustomText(text: 'Quantity in stock: ${medicine.quantityInStock.toString()}.'),
          const SizedBox(height: 12),

          CustomText(text: 'Production date: ${medicine.productionDate}.'),
          const SizedBox(height: 12),

          CustomText(text: 'Expiration date: ${medicine.expirationDate}.'),
          const SizedBox(height: 12),

          CustomText(text: 'Barcode: ${medicine.barCode}.'),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const CustomButton(
            title: 'Done',
            buttonColor: middleShadePurple,
            titleColor: white,
            height: 45,
            width: 85,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
