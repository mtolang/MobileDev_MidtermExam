import 'package:flutter/material.dart';

class RegisterFunctions {
  static String? validateUsername(String username) {
    if (username.isEmpty) {
      return 'Please enter a username';
    }
    return null;
  }

  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please enter a password';
    }
    if (password.length < 6) {
      return 'Password should be at least 6 characters';
    }
    return null;
  }

  static void handleRegister(
    BuildContext context,
    String username,
    String email,
    String password,
  ) {
    if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registration Successful!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
    }
  }
}
