import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/models/supply_order_model.dart';
import 'package:pharma_ssist/widgets/customs/custom_button.dart';
import 'package:pharma_ssist/widgets/customs/custom_text.dart';
import 'package:pharma_ssist/widgets/print_date.dart';

class ShowSupplyOrderInfo extends StatelessWidget {
  const ShowSupplyOrderInfo({super.key, required this.supplyOrder});

  final SupplyOrderModel supplyOrder;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Bill ID: ${supplyOrder.orderID}.',
        style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Anton'
        ),
      ),
      content: SizedBox(
        height: 800,
        width: 300,
        child: ListView(
          children: [
            CustomText(text: 'From: ${supplyOrder.wareHouseName}.'),
            const SizedBox(height: 12),

            CustomText(text: 'By sales representative: ${supplyOrder.salesRepresentative}'),
            const SizedBox(height: 12),

            CustomText(text: '{[ Total price: ${supplyOrder.totalPrice} ]}'),
            const SizedBox(height: 12),

            CustomText(text: 'Ordered on date: ${PrintDate.getDate(supplyOrder.purchaseDate)}.'),
            const SizedBox(height: 12),
          ],
        ),
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
            height: 40,
            width: 80,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
