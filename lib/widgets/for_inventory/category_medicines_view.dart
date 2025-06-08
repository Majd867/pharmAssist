import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/models/category_model.dart';
import 'medicine_card_list_builder.dart';

class CategoryMedicinesView extends StatelessWidget {
  const CategoryMedicinesView({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: beforeDarkPurple,
        centerTitle: true,
        title: Text(
          '${category.categoryName} Medicines',
          style: const TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          MedicineCardListBuilder(category: category.categoryName),
        ],
      ),
    );
  }
}
