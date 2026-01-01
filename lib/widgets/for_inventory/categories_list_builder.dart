import 'package:flutter/material.dart';
import 'package:pharma_ssist/models/category_model.dart';
import '../../controllers/category_controller.dart';
import '../customs/custom_text.dart';
import 'inventory_category_list_view.dart';

class CategoriesListBuilder extends StatefulWidget {
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CategoriesListBuilder({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

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
          return InventoryCategoryListView(
            categories: snapshot.data!,
            selectedCategory: widget.selectedCategory,
            onCategorySelected: widget.onCategorySelected,
          );
        } else {
          return const Center(child: CustomText(text: 'No categories found.'));
        }
      },
    );
  }
}
