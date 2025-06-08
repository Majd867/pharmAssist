import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/screens/public_screens/home_page_screen.dart';
import 'package:pharma_ssist/widgets/for_bills/bill_pop_up_menu.dart';
import 'package:pharma_ssist/widgets/for_inventory/search_view.dart';
import 'package:pharma_ssist/widgets/for_home_page/side_menu.dart';
import '../models/user_login_model.dart';
import '../screens/public_screens/bills_screen.dart';
import '../screens/public_screens/inventory_screen.dart';

class MainScaffoldWidget extends StatefulWidget {
  const MainScaffoldWidget({super.key});
  static const String id = 'Main scaffold page';

  @override
  State<MainScaffoldWidget> createState() => _MainScaffoldWidgetState();
}

class _MainScaffoldWidgetState extends State<MainScaffoldWidget> {
  UserLoginModel user = const UserLoginModel(
    userName: 'Majd darawcheh',
    password: 'lll',
    isAdmin: true,
  );

  final PageController pageController = PageController(initialPage: 1);
  int currentIndex = 1;
  String selectedBillCategory = 'Customer bills';

  final List<Widget> icons = const [
    Icon(Icons.storage, color: white),
    Icon(Icons.home, color: white),
    Icon(Icons.receipt_long, color: white),
  ];

  String appBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Inventory';
      case 1:
        return 'PharmAssist';
      case 2:
        return 'Bills';
    }
    return 'PharmAssist';
  }

  void _onBillCategorySelected(String category) {
    setState(() {
      selectedBillCategory = category;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const InventoryScreen(),
      const HomePageScreen(),
      Builder(
        builder: (_) => BillsScreen(selectedCategory: selectedBillCategory),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: currentIndex == 1
            ? Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, size: 28, color: white),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              )
            : const SizedBox.shrink(),
        backgroundColor: beforeDarkPurple,
        centerTitle: true,
        title: Text(
          appBarTitle(currentIndex),
          style: const TextStyle(
            color: white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: currentIndex == 0
            ? [
                IconButton(
                  icon: const Icon(Icons.search, size: 30, color: white),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SearchView(),
                      ),
                    );
                  },
                ),
              ]
            : currentIndex == 2
                ? [
                    BillPopUpMenu(
                      selectedValue: selectedBillCategory,
                      onSelected: _onBillCategorySelected,
                    ),
                  ]
                : [],
      ),
      drawer: SideMenu(user: user),
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        color: beforeDarkPurple,
        backgroundColor: white,
        buttonBackgroundColor: darkPurple,
        index: currentIndex,
        items: icons,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 340),
            curve: Curves.easeInOut,
          );
        },
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: pages,
      ),
    );
  }
}
