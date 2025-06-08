import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/models/supply_order_model.dart';
import 'package:pharma_ssist/widgets/print_date.dart';
import 'package:pharma_ssist/widgets/for_bills/show_supply_order_info.dart';

class CustomSupplyOrderCard extends StatelessWidget {
  const CustomSupplyOrderCard({super.key, required this.supplyOrder});
  final SupplyOrderModel supplyOrder;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,8,10,0),
      child: GestureDetector(
        onTap: (){
          showDialog(
            context: context,
            builder: (context)=>ShowSupplyOrderInfo(supplyOrder: supplyOrder),);
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
                          'Supply order ID: ${supplyOrder.orderID.toString()}.',
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
                          'From: ${supplyOrder.wareHouseName}.',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        // Text(
                        //   PrintSalesItems.getSalesItems(bill.salesItems),
                        //   maxLines: 2,
                        //   overflow: TextOverflow.ellipsis,
                        //   style: const TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 16,
                        //   ),
                        //),
                        const Text(
                          '....Tap to show more',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Total price: ${supplyOrder.totalPrice} S.P.',
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
                          'Ordered on date: ${PrintDate.getDate(supplyOrder.purchaseDate)}.',
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
