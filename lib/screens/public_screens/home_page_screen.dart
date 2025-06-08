import 'package:flutter/material.dart';
import 'package:pharma_ssist/screens/public_screens/create_customer_order_screen.dart';
import 'package:pharma_ssist/screens/public_screens/order_supplies_screen.dart';
import 'package:pharma_ssist/widgets/customs/custom_home_page_button.dart';
import '../../constants.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: softGray,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 100,
                  color: beforeDarkPurple,
                ),
                Positioned(
                  top: 15,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 180,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: purple,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome,',
                                style: TextStyle(
                                  fontSize: 33,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                              Text(
                                'what would you',
                                style: TextStyle(
                                  fontSize: 33,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                              Text(
                                'like to do?',
                                style: TextStyle(
                                  fontSize: 33,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            height: 90,
                            width: 90,
                            child: Image(
                              image: AssetImage(
                                'assets/images/logos/darkPurple24Hlogo.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.zero,
                child: Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomHomePageButton(
                              routeName: CreateCustomerOrderScreen.id,
                              title1: 'Customer',
                              title2: 'Order',
                              icon: Icons.medication_liquid,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomHomePageButton(
                              routeName: '',
                              title1: 'Return',
                              title2: 'Medication',
                              icon: Icons.keyboard_return_rounded,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomHomePageButton(
                              routeName: OrderSuppliesScreen.id,
                              title1: 'Order',
                              title2: 'Supplies',
                              icon: Icons.add_shopping_cart,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomHomePageButton(
                              routeName: '',
                              title1: 'Return',
                              title2: 'Supplies',
                              icon: Icons.keyboard_return_rounded,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 70,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
