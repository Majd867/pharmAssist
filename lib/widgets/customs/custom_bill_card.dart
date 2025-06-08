import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/models/sale_bill.dart';
import 'package:pharma_ssist/widgets/print_sales_items.dart';
import '../for_bills/show_bill_info.dart';

class CustomBillCard extends StatelessWidget {
  const  CustomBillCard({super.key, required this.bill});
  final SaleBillModel bill;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,8,10,0),
      child: GestureDetector(
        onTap: (){
          showDialog(
            context: context,
            builder: (context)=>ShowBillInfo(bill: bill),);
        },
        child: Container(
          height: 240,
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
                          'Bill ID: ${bill.id.toString()}.',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sold by Dr.${bill.pharmacistName}.',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          PrintSalesItems.getSalesItems(bill.salesItems),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        const Text(
                          '....Tap to show more',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Total price: ${bill.totalPriceOfBill} S.P.',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Released on date: ${bill.date}.',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
