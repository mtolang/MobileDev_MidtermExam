import 'package:flutter/material.dart';

void resetPassword(
    BuildContext context, TextEditingController emailController) {
  final email = emailController.text;

  if (email.isEmpty) {
   
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please enter your email."),
        backgroundColor: Colors.red,
      ),
    );
  } else {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Password reset link sent to $email"),
        backgroundColor: Colors.green,
      ),
    );

  }
}
