import 'package:flutter/material.dart';
import 'package:pharma_ssist/widgets/customs/custom_text_field2.dart';
import '../../constants.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: white,
        ),
        backgroundColor: beforeDarkPurple,
        centerTitle: true,
        title: const Text(
          'Search',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CustomTextField2(
              label: 'medicine search',
              hintText: 'Enter a medicine name...',
              prefixIcon: Icons.search,
            ),
          ),
        ],
      ),
    );
  }
}
