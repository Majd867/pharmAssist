import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/widgets/for_inventory/categories_list_builder.dart';
import 'package:pharma_ssist/widgets/for_inventory/medicine_card_list_builder.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: white,
      child: Stack(
        children: [
          Positioned(
            bottom: 30,
            right: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 2,
                backgroundColor: beforeDarkPurple,
                foregroundColor: white,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(17),
              ),
              onPressed: (){
              },
              child: const Icon(
                Icons.add,
                size: 35,
              ),
            ),
          ),
          const CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: CategoriesListBuilder()),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              MedicineCardListBuilder(category: 'All'),
            ],
          ),
        ],
      )
    );
  }
}
