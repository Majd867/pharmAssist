import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharma_ssist/controllers/pharmacist_register_controller.dart';
import 'package:pharma_ssist/models/pharmacist_model.dart';
import '../../constants.dart';
import '../customs/custom_button.dart';

class AddEmployeePopup extends StatefulWidget {
  const AddEmployeePopup({super.key});

  @override
  State<AddEmployeePopup> createState() => _AddEmployeePopupState();
}

class _AddEmployeePopupState extends State<AddEmployeePopup> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController monthlySalaryController = TextEditingController();

  bool _obscurePassword = true;
  String? selectedRole;
  bool isAdmin = false;

  final List<String> roles = ['Admin Pharmacist', 'Normal Pharmacist'];

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    monthlySalaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          left: 24,
          right: 24,
          top: 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Register New Pharmacist',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: 'Anton',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  _buildTextField(firstnameController, 'First Name', Icons.person_outline),
                  const SizedBox(height: 16),
                  _buildTextField(lastnameController, 'Last Name', Icons.person_outline),
                  const SizedBox(height: 16),
                  _buildTextField(usernameController, 'Username', Icons.person),
                  const SizedBox(height: 16),
                  _buildTextField(
                    phoneController,
                    'Phone Number',
                    Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    passwordController,
                    'Password',
                    Icons.lock_outline,
                    obscure: true,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    monthlySalaryController,
                    'Monthly Salary',
                    Icons.attach_money_outlined,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.admin_panel_settings, color: Colors.grey),
                      border: UnderlineInputBorder(),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                    hint: const Text('Select Role'),
                    value: selectedRole,
                    items: roles.map((role) {
                      return DropdownMenuItem<String>(
                        value: role,
                        child: Text(role),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedRole = value;
                        isAdmin = value == 'Admin Pharmacist';
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a role';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const CustomButton(
                    title: 'Cancel',
                    buttonColor: softGray,
                    titleColor: middleShadePurple,
                    height: 45,
                    width: 100,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 7),
                GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      final newPharmacist = PharmacistModel(
                        firstname: firstnameController.text.trim(),
                        lastname: lastnameController.text.trim(),
                        username: usernameController.text.trim(),
                        phone: phoneController.text.trim(),
                        password: passwordController.text.trim(),
                        salary: int.parse(monthlySalaryController.text.trim()),
                        isAdmin: isAdmin,
                      );

                      try {
                        await PharmacistController().pharmacistRegisterService(newPharmacist);
                        if (context.mounted) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Pharmacist registered successfully')),
                          );
                          Navigator.pop(context);
                        }
                      } catch (e) {
                        if (context.mounted) {
                          log(e.toString());
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Registration failed: $e')),
                          );
                        }
                      }
                    }
                  },
                  child: const CustomButton(
                    title: 'Done',
                    buttonColor: middleShadePurple,
                    titleColor: white,
                    height: 45,
                    width: 100,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller,
      String hint,
      IconData icon, {
        bool obscure = false,
        TextInputType keyboardType = TextInputType.text,
        List<TextInputFormatter>? inputFormatters,
      }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure ? _obscurePassword : false,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        suffixIcon: obscure
            ? IconButton(
          icon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey,
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
          return 'Please enter $hint';
        }

        if (hint == 'Password' && value.length < 8) {
          return 'Password must be at least 8 characters';
        }

        if (hint == 'Phone Number' && (!RegExp(r'^\d{10}$').hasMatch(value))) {
          return 'Enter a valid phone number';
        }

        if (hint == 'Monthly Salary') {
          final salary = double.tryParse(value);
          if (salary == null || salary <= 0) {
            return 'Enter a valid salary greater than 0';
          }
        }
        return null;
      },
    );
  }
}
