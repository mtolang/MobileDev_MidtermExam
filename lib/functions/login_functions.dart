import 'package:flutter/material.dart';
import 'package:sample_project/body.dart';
import 'package:sample_project/screens/forgotpass_screen.dart';
import 'package:sample_project/screens/register_screen.dart';

const String adminEmail = "admin";
const String adminPassword = "admin";

void handleLogin(
  BuildContext context,
  GlobalKey<FormState> formKey,
  TextEditingController emailController,
  TextEditingController passwordController,
) {
  if (formKey.currentState?.validate() ?? false) {
    final email = emailController.text;
    final password = passwordController.text;

    if (email == adminEmail && password == adminPassword) {

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Body()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("try admin on email and password"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

void navigateToForgotPassword(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
  );
}

void navigateToRegister(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const RegisterScreen()),
  );
}
