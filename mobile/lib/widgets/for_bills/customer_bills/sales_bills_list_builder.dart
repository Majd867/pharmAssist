import 'package:flutter/material.dart';
import 'package:pharma_ssist/controllers/sales_bills_controller.dart';
import 'package:pharma_ssist/models/sale_bill.dart';
import 'package:pharma_ssist/widgets/for_bills/customer_bills/customer_bill_card_list_widget.dart';
import '../../customs/custom_text.dart';

class SalesBillsListBuilder extends StatefulWidget {
  const SalesBillsListBuilder({super.key});

  @override
  State<SalesBillsListBuilder> createState() => _SalesBillsListBuilderState();
}

class _SalesBillsListBuilderState extends State<SalesBillsListBuilder> {
  @override
  void initState() {
    future = CustomerBillService().getSalesBills();
    super.initState();
  }
  late Future<List<SaleBillModel>> future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: CustomText(text: 'Failed, try again later.'));
        } else if (snapshot.hasData) {
          return CustomerBillCardListWidget(salesBills: snapshot.data!);
        } else {
          return const Center(child: CustomText(text: 'No bill were found.'));
        }
      }
    );
  }
}
