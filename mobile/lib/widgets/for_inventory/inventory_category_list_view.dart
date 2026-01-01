import 'package:flutter/material.dart';
import 'package:pharma_ssist/models/category_model.dart';
import 'package:pharma_ssist/widgets/customs/custom_category_button.dart';

class InventoryCategoryListView extends StatelessWidget {
  final List<CategoryModel> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const InventoryCategoryListView({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 6,),
      child: Row(
        children: categories.map((cat) {
          return CustomCategoryButton(
            category: cat,
            isSelected: selectedCategory == cat.categoryName,
            onTap: () => onCategorySelected(cat.categoryName),
          );
        }).toList(),
      ),
    );
  }
}
