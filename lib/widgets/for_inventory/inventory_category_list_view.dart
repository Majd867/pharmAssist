import 'package:flutter/material.dart';
import 'package:pharma_ssist/models/category_model.dart';
import 'package:pharma_ssist/widgets/customs/custom_category_button.dart';

class InventoryCategoryListView extends StatefulWidget {
  const InventoryCategoryListView({super.key, required this.categories});
  final List<CategoryModel> categories;

  @override
  State<InventoryCategoryListView> createState() =>
      _InventoryCategoryListViewState();
}

class _InventoryCategoryListViewState extends State<InventoryCategoryListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          return CustomCategoryButton(
            category: widget.categories[index],
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
