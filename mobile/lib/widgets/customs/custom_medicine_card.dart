import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/models/medicine_model.dart';
import 'package:pharma_ssist/widgets/for_inventory/show_medicine_info.dart';

class CustomMedicineCard extends StatelessWidget {
  const CustomMedicineCard({super.key, required this.medicine});
  final MedicineModel medicine;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,0,10,0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: softGray,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        medicine.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        medicine.price.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      const Text('SP , '),
                      Text(
                        medicine.manufacturer,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          medicine.scientificName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Quantity: ${medicine.quantityInStock.toString()}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              GestureDetector(
                onTap: (){
                  showDialog(
                    context: context,
                      builder: (context)=>ShowMedicineInfo(medicine: medicine),);
                },
                child: const Align(
                  alignment: Alignment.centerRight,
                  child:  Text(
                    '...',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
