import 'package:flutter/material.dart';
import 'package:pharma_ssist/models/supply_order_model.dart';
import 'package:pharma_ssist/widgets/customs/custom_supply_order_card.dart';

class SupplyOrderCardListWidget extends StatelessWidget {
  const SupplyOrderCardListWidget({super.key, required this.suppliesOrders});

  final List<SupplyOrderModel> suppliesOrders;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: suppliesOrders.length,
      itemBuilder: (context, index){
        return CustomSupplyOrderCard(supplyOrder: suppliesOrders[index]);
      },
    );
  }
}
