import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_images.dart';

class FormScreen extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController? nameController;
  final bool isSignup;

  const FormScreen({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    this.nameController,
    this.isSignup = false,
  });

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  bool isObscure = true;

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your name";
    }

    RegExp nameRegex = RegExp(r'^[a-zA-Z ]+$');

    if (!nameRegex.hasMatch(value.trim())) {
      return "Enter a valid name";
    }

    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your email";
    }

    RegExp emailRegex =
    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value.trim())) {
      return "Enter a valid email";
    }

    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }

    RegExp passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$',
    );

    if (!passwordRegex.hasMatch(value)) {
      return "Weak Password";
    }

    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please confirm password";
    }

    if (value != widget.passwordController.text) {
      return "Passwords do not match";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          if (widget.isSignup) ...[
            TextFormField(
              controller: widget.nameController,
              validator: _validateName,
              decoration:
              _buildInputDecoration("Full Name", Icons.person_outline),
            ),
            const SizedBox(height: 16),
          ],

          TextFormField(
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            validator: _validateEmail,
            decoration: _buildInputDecoration(
                "Email Address", Icons.email_outlined),
          ),

          const SizedBox(height: 16),

          TextFormField(
            controller: widget.passwordController,
            obscureText: isObscure,
            validator: _validatePassword,
            decoration: _buildInputDecoration(
              "Password",
              Icons.lock_outline,
              isPassword: true,
            ),
          ),

          if (widget.isSignup) ...[
            const SizedBox(height: 16),

            TextFormField(
              controller: widget.confirmPasswordController,
              obscureText: isObscure,
              validator: _validateConfirmPassword,
              decoration: _buildInputDecoration(
                "Confirm Password",
                Icons.lock_reset_outlined,
                isPassword: true,
              ),
            ),
          ]
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(
      String label,
      IconData icon, {
        bool isPassword = false,
      }) {
    return InputDecoration(
      labelText: label,

      labelStyle: const TextStyle(
        color: Colors.grey,
      ),

      filled: true,

      fillColor: const Color(0xffF8F9FC),

      prefixIcon: Icon(
        icon,
        color: AppColors.darkBlue,
      ),

      suffixIcon: isPassword
          ? IconButton(
        onPressed: () {
          setState(() {
            isObscure = !isObscure;
          });
        },
        icon: Icon(
          isObscure
              ? Icons.visibility_off
              : Icons.visibility,
          color: AppColors.darkBlue,
        ),
      )
          : null,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 18,
      ),

      enabledBorder: _buildBorder(Colors.grey.shade300),

      focusedBorder: _buildBorder(AppColors.darkBlue),

      errorBorder: _buildBorder(Colors.red),

      focusedErrorBorder: _buildBorder(Colors.red),
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: color,
        width: 1.3,
      ),
    );
  }
}

