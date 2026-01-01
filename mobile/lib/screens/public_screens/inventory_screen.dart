import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/models/medicine_model.dart';
import 'package:pharma_ssist/widgets/for_inventory/categories_list_builder.dart';
import 'package:pharma_ssist/widgets/for_inventory/medicine_card_list_widget.dart';
import '../../widgets/for_inventory/inventory_logic_controller.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final InventoryLogicController controller = InventoryLogicController();
  late Future<List<MedicineModel>> future;

  @override
  void initState() {
    super.initState();
    future = controller.fetchMedicines('All');
  }

  void _onCategorySelected(String category) {
    setState(() {
      future = controller.fetchMedicines(category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CategoriesListBuilder(
                  selectedCategory: controller.selectedCategory,
                  onCategorySelected: _onCategorySelected,
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(
                child: FutureBuilder<List<MedicineModel>>(
                  future: future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('No medicines found'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No medicines found'));
                    }
                    return MedicineCardListWidget(medicineList: snapshot.data!);
                  },
                ),
              ),
            ],
          ),
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
              onPressed: () {
                //for adding medicines
              },
              child: const Icon(Icons.add, size: 35),
            ),
          ),
        ],
      ),
    );
  }
}
