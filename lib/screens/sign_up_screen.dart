import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_images.dart';
import '../core/theme/app_routes.dart';
import '../core/ui_utils.dart';
import '../firebase/firebase_service.dart';
import '../models/user_models.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_form_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();

late TextEditingController _emailController;
late TextEditingController _passwordController;
late TextEditingController _confirmPasswordController;
late TextEditingController _nameController;

@override
void initState() {
super.initState();

_emailController = TextEditingController();
_passwordController = TextEditingController();
_confirmPasswordController = TextEditingController();
_nameController = TextEditingController();
}

@override
void dispose() {
_emailController.dispose();
_passwordController.dispose();
_confirmPasswordController.dispose();
_nameController.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: AppColors.whiteBlue,

body: SafeArea(
child: SingleChildScrollView(
child: Padding(
padding: const EdgeInsets.symmetric(
horizontal: 20,
vertical: 20,
),

child: Card(
color: AppColors.white,
elevation: 2,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(18),
),

child: Padding(
padding: const EdgeInsets.all(24),

child: Column(
crossAxisAlignment: CrossAxisAlignment.center,

children: [

ClipRRect(
borderRadius: BorderRadius.circular(12),

child: Image.asset(
AppImages.signUpBackground,
width: double.infinity,
height: 180,
fit: BoxFit.cover,
),
),

const SizedBox(height: 25),

Text(
"Lumina Books",
style: TextStyle(
color: AppColors.darkBlue,
fontSize: 26,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 8),

const Text(
"Start your literary journey\nwith Lumina Books today.",
textAlign: TextAlign.center,
style: TextStyle(
color: AppColors.gray,
fontSize: 14,
),
),

const SizedBox(height: 25),

FormScreen(
formKey: _registerKey,
emailController: _emailController,
passwordController: _passwordController,
confirmPasswordController:
_confirmPasswordController,
nameController: _nameController,
isSignup: true,
),

const SizedBox(height: 25),
  Container(
    width: double.infinity,
    height: 52,
    child: CustomButton(
      text: "Create Account",
      onPressed: createAccount,
    ),
  ),

  const SizedBox(height: 20),

  Row(
    children: [
      const Expanded(child: Divider()),

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

      const Expanded(child: Divider()),
    ],
  ),

  const SizedBox(height: 20),

  SizedBox(
    width: double.infinity,
    height: 52,
    child: OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: Colors.grey.shade300,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {},

      icon: Image.asset(
        AppImages.googleIcon,
        width: 22,
      ),

      label: const Text(
        "Google",
        style: TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
      ),
    ),
  ),

  const SizedBox(height: 20),

  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Already have an account?",
        style: TextStyle(
          color: AppColors.gray,
        ),
      ),

      TextButton(
        onPressed: () {
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.loginScreen,
          );
        },
        child: Text(
          "Login",
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
);
}

void createAccount() async {
  if (_registerKey.currentState?.validate() ?? false) {
    try {
      if (!mounted) return;

      UIUtils.showLoading(context, isDismissible: false); // [cite: 36]

      UserCredential userCredential = await FirebaseServices.register(
        _emailController.text.trim(),
        _passwordController.text,
      );

      UserModel user = UserModel(
          id: userCredential.user!.uid,
          name: _nameController.text.trim(),
          email: _emailController.text.trim()
      );

      await FirebaseServices.addUserToFireStore(user); // [cite: 96]

      if (!mounted) return;
      UIUtils.hideDialog(context);
      UIUtils.showToastMessage("Successful Registration", Colors.green);

      Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
    } on FirebaseAuthException catch (exception) {
      if (!mounted) return;
      UIUtils.hideDialog(context);

      String message = "Registration Failed";
      if (exception.code == 'email-already-in-use') {
        message = "This email is already registered";
      } else if (exception.code == 'weak-password') {
        message = "The password is too weak";
      }

      UIUtils.showToastMessage(message, Colors.red);
    } catch (exception) {
      if (!mounted) return;
      UIUtils.hideDialog(context);
      UIUtils.showToastMessage("An error occurred", Colors.red);
    }
  }
}
}





