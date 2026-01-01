import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/controllers/profile_controller.dart';
import 'package:pharma_ssist/models/user_profile_model.dart';
import 'package:pharma_ssist/screens/public_screens/home_page_screen.dart';
import 'package:pharma_ssist/widgets/customs/custom_profile_card.dart';
import 'package:pharma_ssist/widgets/main_scaffold_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const String id = 'profile page';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: beforeDarkPurple,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            color: middleShadePurple,
            borderRadius: BorderRadius.circular(45),
          ),
          child: FutureBuilder<UserProfileModel>(
            future: ProfileController().getProfile(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(color: white));
              } else if (snapshot.hasError) {
                return Center(
                    child: Text('Error: ${snapshot.error}',
                        style: const TextStyle(color: white)));
              } else if (!snapshot.hasData) {
                return const Center(
                    child:
                        Text('No data found', style: TextStyle(color: white)));
              }

              final user = snapshot.data!;

              return Column(
                children: [
                  const SizedBox(height: 60),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Divider(thickness: 1.3, color: white),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image:
                              AssetImage('assets/images/logos/SnakeLogo.png'),
                          height: 70,
                          width: 70,
                        ),
                        Text(
                          'My Profile',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: white,
                            fontFamily: 'Anton',
                          ),
                        ),
                        Image(
                          image:
                              AssetImage('assets/images/logos/SnakeLogo.png'),
                          height: 70,
                          width: 70,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Divider(thickness: 1.3, color: white),
                  ),
                  const SizedBox(height: 80),
                  CustomProfileCard(
                      title: 'FirstName: ${user.firstName}',
                      icon: Icons.person),
                  CustomProfileCard(
                      title: 'LastName: ${user.lastName}', icon: Icons.person),
                  CustomProfileCard(
                      title: 'Username: ${user.userName}', icon: Icons.person),
                  CustomProfileCard(
                      title: 'Phone: ${user.phoneNumber}', icon: Icons.phone),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    child: Divider(thickness: 1.3, color: white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, MainScaffoldWidget.id);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Center(
                        child: Text(
                            'Return home',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
