import 'package:flutter/material.dart';
import 'package:pharma_ssist/models/sale_bill.dart';
import 'package:pharma_ssist/widgets/customs/custom_bill_card.dart';

class CustomerBillCardListWidget extends StatelessWidget {
  const CustomerBillCardListWidget({super.key, required this.salesBills});

  final List<SaleBillModel> salesBills;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: salesBills.length,
      itemBuilder: (context, index){
        return CustomBillCard(bill: salesBills[index]);
      },
    );
  }
}
