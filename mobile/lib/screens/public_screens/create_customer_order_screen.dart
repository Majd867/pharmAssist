import 'package:flutter/material.dart';
import 'package:pharma_ssist/widgets/customs/custom_button.dart';
import '../../constants.dart';
import '../../helper/header_box.dart';
import '../../widgets/customs/custom_text_field2.dart';

class CreateCustomerOrderScreen extends StatelessWidget {
  const CreateCustomerOrderScreen({super.key});
  static const String id = 'Customer order page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: beforeDarkPurple,
        title: const Text(
          'Customer order',
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
              const HeaderBox(
                title: "Sell",
                icon: Icons.medication_liquid,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5,),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: ListView(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                      children: const [
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
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20, top: 5,),
                child: CustomButton(
                  title: 'Confirm sale',
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
