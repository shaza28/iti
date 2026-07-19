import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_images.dart';
import '../core/theme/app_routes.dart';
import '../core/ui_utils.dart';
import '../firebase/firebase_service.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_form_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
    data: ThemeData.light(),
    child: Scaffold(
      backgroundColor: AppColors.whiteBlue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),

            child: Card(
              elevation: 2,
              color: AppColors.white,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),

              child: Padding(
                padding: const EdgeInsets.all(24),

                child: Column(
                  children: [
                    Image.asset(AppImages.loginLogo, height: 180),

                    const SizedBox(height: 20),

                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: AppColors.darkBlue,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Welcome back!\nSign in to continue reading.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.gray, fontSize: 14),
                    ),

                    const SizedBox(height: 25),

                    FormScreen(
                      formKey: _loginFormKey,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      confirmPasswordController: _confirmPasswordController,
                    ),

                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: "Login",
                        onPressed: login,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey.shade300)),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "OR CONTINUE WITH",
                            style: TextStyle(
                              color: AppColors.gray,
                              fontSize: 12,
                            ),
                          ),
                        ),

                        Expanded(child: Divider(color: Colors.grey.shade300)),
                      ],
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.grey.shade300),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},

                        icon: Image.asset(
                          AppImages.googleIcon,
                          width: 22,
                          height: 22,
                        ),

                        label: const Text(
                          "Continue with Google",
                          style: TextStyle(color: Colors.black87, fontSize: 16),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(color: AppColors.gray),
                        ),

                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.signUpScreen,
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: AppColors.darkBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),);
    }

  void login() async {
    if (_loginFormKey.currentState!.validate()) {
      try {
        UIUtils.showLoading(context, isDismissible: false);
        await FirebaseServices.login(
          _emailController.text.trim(),
          _passwordController.text,
        );
        UIUtils.hideDialog(context);
        UIUtils.showToastMessage("User Logged-In Successfully", Colors.green);
        Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
      } on FirebaseAuthException catch (e) {
        UIUtils.hideDialog(context);
        UIUtils.showToastMessage("Invalid Email or Password", Colors.red);
      } catch (e) {
        UIUtils.hideDialog(context);
        UIUtils.showToastMessage("Failed to login", Colors.red);
      }
    }
  }
}
