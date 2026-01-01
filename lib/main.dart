import 'package:flutter/material.dart';
import 'package:pharma_ssist/screens/admin_screens/employees_screen.dart';
import 'package:pharma_ssist/screens/public_screens/contacts_screen.dart';
import 'package:pharma_ssist/screens/public_screens/create_customer_order_screen.dart';
import 'package:pharma_ssist/screens/public_screens/log_in_screen.dart';
import 'package:pharma_ssist/screens/public_screens/order_supplies_screen.dart';
import 'package:pharma_ssist/screens/public_screens/profile_screen.dart';
import 'package:pharma_ssist/widgets/main_scaffold_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PharmAssistApp());
}

class PharmAssistApp extends StatelessWidget {
  const PharmAssistApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   brightness: Brightness.dark,
      // ),
      routes: {
        LogInScreen.id : (context)=> const LogInScreen(),
        MainScaffoldWidget.id : (context)=> const MainScaffoldWidget(),
        ProfileScreen.id : (context)=> const ProfileScreen(),
        ContactsScreen.id : (context)=> const ContactsScreen(),
        OrderSuppliesScreen.id : (context)=> const OrderSuppliesScreen(),
        CreateCustomerOrderScreen.id : (context)=> const CreateCustomerOrderScreen(),
        EmployeesScreen.id : (context)=> const EmployeesScreen(),
        //EmployeeInfo.id : (context)=> const EmployeeInfo(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: LogInScreen.id,
    );
  }
}

