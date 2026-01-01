import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/screens/public_screens/create_customer_order_screen.dart';
import 'package:pharma_ssist/screens/public_screens/order_supplies_screen.dart';
import 'package:pharma_ssist/widgets/for_bills/customer_bills/sales_bills_list_builder.dart';
import 'package:pharma_ssist/widgets/for_bills/supplies_bills/supply_orders_list_builder.dart';

class BillsScreen extends StatefulWidget {
  final String selectedCategory;
  const BillsScreen({super.key, required this.selectedCategory});

  @override
  State<BillsScreen> createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  @override
  Widget build(BuildContext context) {
    final bool isCustomerBills = widget.selectedCategory == 'Customer bills';

    return Scaffold(
      backgroundColor: white,
      body: ListView(
        children: [
          if (widget.selectedCategory == 'Supply orders')
            const SupplyOrdersListBuilder()
          else if (isCustomerBills)
            const SalesBillsListBuilder(),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          backgroundColor: beforeDarkPurple,
          foregroundColor: white,
          onPressed: () {
            Navigator.pushNamed(
              context,
              isCustomerBills ? CreateCustomerOrderScreen.id : OrderSuppliesScreen.id,
            );
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.add, size: 35),
        ),
      ),
    );
  }
}
