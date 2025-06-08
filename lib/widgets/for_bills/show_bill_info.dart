import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/models/sale_bill.dart';
import 'package:pharma_ssist/widgets/customs/custom_button.dart';
import 'package:pharma_ssist/widgets/customs/custom_text.dart';
import 'package:pharma_ssist/widgets/print_sales_items.dart';

class ShowBillInfo extends StatelessWidget {
  const ShowBillInfo({super.key, required this.bill});

  final SaleBillModel bill;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Bill ID: ${bill.id}.',
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
            CustomText(text: 'Sold by DR.${bill.pharmacistName}.'),
            const SizedBox(height: 12),

            CustomText(text: PrintSalesItems.getSalesItems(bill.salesItems)),
            const SizedBox(height: 12),
        
            CustomText(text: '{[ Total price: ${bill.totalPriceOfBill} S.P.]}'),
            const SizedBox(height: 12),
        
            CustomText(text: 'Released on date: ${bill.date}'),
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
