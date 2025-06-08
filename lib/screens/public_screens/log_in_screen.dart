import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/widgets/for_login/login_widget.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});
  static const String id = 'Login page';

  @override
  Widget build(BuildContext context) {

    return Container(
      color: darkPurple,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(50),
          child: Container(
            decoration: const BoxDecoration(
              color: middleShadePurple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(400),
                topRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 115,
                          height: 115,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(

                                'assets/images/logos/PurpleCross.png',
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 65,
                        ),
                      ],
                    ),

                    const Spacer(),

                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 65,
                          ),

                          Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontFamily: 'Anton',
                            ),
                          ),
                          Text(
                            'To PharmAssist',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontFamily: 'Anton',
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Image.asset(
                    'assets/images/logos/SnakeLogo.png',
                    height: 200,
                    width: 200,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Text(
                    'Sign in to continue',
                    style: TextStyle(
                      fontSize: 20,
                      color: white,
                      fontFamily: 'Anton',
                    ),
                  ),
                ),
                const LoginWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
