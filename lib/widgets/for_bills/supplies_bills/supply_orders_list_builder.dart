import 'package:flutter/material.dart';
import 'package:pharma_ssist/controllers/supply_order_controller.dart';
import 'package:pharma_ssist/models/supply_order_model.dart';
import 'package:pharma_ssist/widgets/for_bills/supplies_bills/supply_order_card_list_widget.dart';
import '../../customs/custom_text.dart';

class SupplyOrdersListBuilder extends StatefulWidget {
  const SupplyOrdersListBuilder({super.key});

  @override
  State<SupplyOrdersListBuilder> createState() =>
      _SupplyOrdersListBuilderState();
}

class _SupplyOrdersListBuilderState extends State<SupplyOrdersListBuilder> {
  @override
  void initState() {
    future = SupplyOrderService().getSupplyOrderBills();
    super.initState();
  }

  late Future<List<SupplyOrderModel>> future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: CustomText(text: 'Failed, try again later.'));
          } else if (snapshot.hasData) {
            return SupplyOrderCardListWidget(suppliesOrders: snapshot.data!);
          } else {
            return const Center(child: CustomText(text: 'No bill were found.'));
          }
        });
  }
}
