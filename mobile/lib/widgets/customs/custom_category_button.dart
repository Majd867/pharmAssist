
import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/models/category_model.dart';

class CustomCategoryButton extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomCategoryButton({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor = isSelected ? darkPurple : middleShadePurple;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 8, 0, 2),
        child: Container(
          height: 45,
          constraints: const BoxConstraints(minWidth: 120),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(60),
          ),
          child: Center(
            child: Text(
              category.categoryName,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
