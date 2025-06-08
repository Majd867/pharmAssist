import 'package:flutter/material.dart';
import 'package:pharma_ssist/controllers/category_controller.dart';
import 'package:pharma_ssist/models/category_model.dart';
import 'package:pharma_ssist/widgets/for_inventory/inventory_category_list_view.dart';

import '../customs/custom_text.dart';

class CategoriesListBuilder extends StatefulWidget {
  const CategoriesListBuilder({super.key});

  @override
  State<CategoriesListBuilder> createState() => _CategoriesListBuilderState();
}

class _CategoriesListBuilderState extends State<CategoriesListBuilder> {
  @override
  void initState() {
    future = CategoryService().getCategories();
    super.initState();
  }
  late Future<List<CategoryModel>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot){
         if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: CustomText(text: 'Failed to load Categories, try again later.'));
        } else if (snapshot.hasData) {
          return InventoryCategoryListView(categories: snapshot.data!);
        } else {
          return const Center(child: CustomText(text: 'No categories found.'));
        }
      },
    );
  }
}
