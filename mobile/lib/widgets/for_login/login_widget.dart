import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/models/user_login_model.dart';
import 'package:pharma_ssist/widgets/customs/custom_button.dart';
import '../../controllers/login_controller.dart';
import '../../helper/info_storage.dart';
import '../main_scaffold_widget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  final LoginService loginService = LoginService();

  void _signIn() async {
    if (_formKey.currentState!.validate()) {
      final request = UserLoginModel(
        username: _usernameController.text.trim(),
        password: _passwordController.text,
      );

      try {
        final response = await loginService.login(request);

        if (response['message'] == 'Login Success') {
          SessionManager().saveSession(
            tokenValue: response['token'],
            adminStatus: response['Is_admin'],
            username: response['pharmacist']['username'],
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Signed in successfully'),
            ),
          );

          Navigator.pushReplacementNamed(context, MainScaffoldWidget.id);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to login. Invalid credentials.'),
            ),
          );
        }
      } catch (e) {
        log('Login exception: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error occurred: incorrect information'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 5),
          customTextFormField(
            controller: _usernameController,
            icon: Icons.perm_identity_outlined,
            hintText: 'Username',
          ),
          const SizedBox(height: 10),
          customTextFormField(
            controller: _passwordController,
            icon: Icons.lock_outline,
            hintText: 'Password',
            isObscure: true,
          ),
          const SizedBox(height: 100),
          GestureDetector(
            onTap: _signIn,
            child: const CustomButton(
              title: 'Sign in',
              buttonColor: Colors.white,
              titleColor: middleShadePurple,
              height: 60,
              width: 120,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget customTextFormField({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    bool isObscure = false,
  }) {
    return Container(
      color: white,
      height: 60,
      width: 350,
      child: TextFormField(
        controller: controller,
        obscureText: isObscure ? _obscurePassword : false,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: middleShadePurple),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: middleShadePurple,
            fontFamily: 'Anton',
            fontSize: 17,
          ),
          suffixIcon: isObscure
              ? IconButton(
            icon: Icon(
              _obscurePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: middleShadePurple,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          )
              : null,
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter $hintText';
          }
          if (hintText == 'Password' && value.length < 8) {
            return 'Password must be at least 8 characters';
          }
          return null;
        },
      ),
    );
  }
}
