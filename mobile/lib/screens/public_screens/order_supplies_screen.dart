import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../helper/header_box.dart';
import '../../widgets/customs/custom_button.dart';
import '../../widgets/customs/custom_text_field2.dart';

class OrderSuppliesScreen extends StatelessWidget {
  const OrderSuppliesScreen({super.key});
  static const String id = 'Order supplies page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: beforeDarkPurple,
        title: const Text(
          'Order supplies',
          style: TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: white),
      ),
      body: SafeArea(
        child: Container(
          color: softGray,
          child: Column(
            children: [
              const HeaderBox(title: "Order", icon: Icons.add_shopping_cart),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    children: const [

                      SizedBox(height: 20),
                      CustomTextField2(
                        label: 'Sales representative name',
                        hintText: 'Enter Sales representative name...',
                        prefixIcon: Icons.person,
                        suffixIcon: Icons.expand_more_rounded,
                      ),
                      SizedBox(height: 20),
                      CustomTextField2(
                        label: 'Medicine name',
                        hintText: 'Enter Medicine name...',
                        prefixIcon: Icons.search,
                        suffixIcon: Icons.qr_code_2,
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: CustomButton(
                  title: 'Submit order',
                  buttonColor: beforeDarkPurple,
                  titleColor: white,
                  height: 60,
                  width: 300,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
