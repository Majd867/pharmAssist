import 'package:flutter/material.dart';
import '../../constants.dart';

class BillPopUpMenu extends StatefulWidget {
  final String selectedValue;
  final Function(String) onSelected;

  const BillPopUpMenu({
    super.key,
    required this.selectedValue,
    required this.onSelected,
  });


  @override
  State<BillPopUpMenu> createState() => _BillPopUpMenuState();
}

class _BillPopUpMenuState extends State<BillPopUpMenu> {
  String _selectedCategory = 'Customer bills';


  final List<String> categories = [
    'Customer bills',
    'Supply orders',
  ];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      menuPadding: const EdgeInsets.all(10),
      iconColor: white,
      onSelected: (value) {
        setState(() {
          _selectedCategory = value;
        });
        widget.onSelected(value);
      },
      itemBuilder: (context) {
        return categories.map((category) {
          return PopupMenuItem<String>(
            value: category,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(category),
                if (_selectedCategory == category)
                  const Icon(Icons.check, color: middleShadePurple),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}
