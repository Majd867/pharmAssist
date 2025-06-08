import 'package:flutter/material.dart';
import 'package:pharma_ssist/models/user_login_model.dart';
import 'package:pharma_ssist/screens/admin_screens/employees_screen.dart';
import 'package:pharma_ssist/screens/public_screens/contacts_screen.dart';
import 'package:pharma_ssist/screens/public_screens/profile_screen.dart';
import 'package:pharma_ssist/widgets/customs/custom_list_tile.dart';
import 'package:pharma_ssist/widgets/for_home_page/log_out_pop_up.dart';
import '../../constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key, required this.user});
  final UserLoginModel user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: white,
      shadowColor: Colors.white24,
      elevation: 20,
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(1.0),
                bottomRight: Radius.circular(1.0),
              ),
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/decoration_images/pharmacy_image2.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: IntrinsicWidth(
                child: Card(
                  color: white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      user.userName,
                      style: const TextStyle(
                        color: darkPurple,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),


          CustomListTile(
            title: 'My Profile',
            icon: const Icon(Icons.account_circle_rounded),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                ProfileScreen.id,
              );
            },
          ),


          if (user.isAdmin)
            CustomListTile(
              title: 'Income Statistics',
              icon: const Icon(Icons.query_stats),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  '',
                );
              },
            ),


          CustomListTile(
            title: 'Contacts',
            icon: const Icon(Icons.contacts_rounded),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                ContactsScreen.id,
              );
            },
          ),


          if (user.isAdmin)
            CustomListTile(
              title: 'Employees',
              icon: const Icon(Icons.people_alt),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  EmployeesScreen.id,
                );
              },
            ),


          const SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Divider(
                thickness: 0.7,
                color: Colors.blueGrey,
              ),
            ),
          ),


          CustomListTile(
            title: 'Language',
            icon: const Icon(Icons.language_sharp),
            onTap: () {
              Navigator.pop(context);
            },
          ),


          CustomListTile(
            title: 'Log out',
            icon: const Icon(Icons.logout),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (context) {
                    return const LogOutPopUp();
                  });
            },
          ),
        ],
      ),
    );
  }
}
