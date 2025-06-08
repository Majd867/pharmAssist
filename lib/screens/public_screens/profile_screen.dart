import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/widgets/customs/custom_profile_card.dart';

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
          child: const Column(
            children: [
              SizedBox(
                height: 60,
              ),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                  child: Divider(
                    thickness: 1.3,
                    color: white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: AssetImage('assets/images/logos/SnakeLogo.png'),
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
                      image: AssetImage('assets/images/logos/SnakeLogo.png'),
                      height: 70,
                      width: 70,
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 0),
                  child: Divider(
                    thickness: 1.3,
                    color: white,
                  ),
                ),
              ),
              SizedBox(height: 80,),
              CustomProfileCard(title: 'FirstName: Majd',icon: Icons.person,),
              CustomProfileCard(title: 'LastName: Darawcheh',icon: Icons.person,),
              CustomProfileCard(title: 'Username: مجهوووود',icon: Icons.person,),
              CustomProfileCard(title: 'Phone: 0930536935',icon: Icons.phone,),
              CustomProfileCard(title: 'Password: 123456542',icon: Icons.lock,),
              Spacer(),
              SizedBox(
                //height: 230,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 60),
                  child: Divider(
                    thickness: 1.3,
                    color: white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
