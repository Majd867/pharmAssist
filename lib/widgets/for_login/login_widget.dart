import 'package:flutter/material.dart';
import 'package:pharma_ssist/constants.dart';
import 'package:pharma_ssist/widgets/customs/custom_button.dart';
import 'package:pharma_ssist/widgets/main_scaffold_widget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 5,),
          customTextFormField(Icons.perm_identity_outlined, 'Username'),
          const SizedBox(height: 10,),
          customTextFormField(Icons.lock_outline, 'Password', isObscure: true),
          const SizedBox(height: 100,),
          GestureDetector(
            child: const CustomButton(
              title: 'Sign in',
              buttonColor: Colors.white,
              titleColor: middleShadePurple,
              height: 60,
              width: 120,
              fontSize: 18,
            ),
            onTap: () {
              if(_formKey.currentState!.validate()){
                Navigator.pushReplacementNamed(context, MainScaffoldWidget.id);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget customTextFormField(
    IconData icon,
    String title, {
    bool isObscure = false,
  }) {
    return Container(
      color: white,
      height: 60,
      width: 350,
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        obscureText: isObscure ? _obscurePassword : false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: middleShadePurple,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: title,
          hintStyle: const TextStyle(
            color: middleShadePurple,
            fontFamily: 'Anton',
            fontSize: 17,
          ),
          suffixIcon: isObscure
              ? IconButton(
                  icon: _obscurePassword
                      ? const Icon(Icons.visibility_outlined, color: middleShadePurple,)
                      : const Icon(Icons.visibility_off_outlined, color: middleShadePurple,),
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
            return 'Please enter $title';
          }
          if (title == 'Password' && value.length < 8) {
            return 'Password must be at least 8 characters';
          }
          return null;
        },
      ),
    );
  }
}
