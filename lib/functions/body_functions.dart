import 'package:flutter/material.dart';
import 'package:sample_project/body.dart';
import 'package:sample_project/screens/chat_screen.dart';

class BottomNavigationHandler {
  static void onItemTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Body()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ChatScreen()),
      );
    }
  }
}

class ProfileData {
  static String weight = "70 kg";
  static String height = "1.75 m";

  static String getWeight() => weight;

  static String getHeight() => height;

  static void updateWeight(String newWeight) {
    weight = newWeight;
  }

  static void updateHeight(String newHeight) {
    height = newHeight;
  }
}

class RecordLogic {

  static List<Map<String, dynamic>> getPatients() {
    return [
      {
        'name': 'John Doe',
        'age': 30,
        'gender': 'Male',
        'weight': 70.0,
        'height': 1.75,
        'bmi': 22.86,
        'category': 'Normal weight',
      },
      {
        'name': 'Jane Smith',
        'age': 28,
        'gender': 'Female',
        'weight': 60.0,
        'height': 1.65,
        'bmi': 22.04,
        'category': 'Normal weight',
      },
    ];
  }
}
