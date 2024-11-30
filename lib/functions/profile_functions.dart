import 'package:flutter/material.dart';

class ProfileFunctions {

  static void editProfileDialog(
    BuildContext context,
    String name,
    String email,
    String phone,
    String biography,
    String weight,
    String height,
    Function(
      String updatedName,
      String updatedEmail,
      String updatedPhone,
      String updatedBio,
      String updatedWeight,
      String updatedHeight,
    ) onSave,
  ) {

    TextEditingController nameController = TextEditingController(text: name);
    TextEditingController emailController = TextEditingController(text: email);
    TextEditingController phoneController = TextEditingController(text: phone);
    TextEditingController bioController =
        TextEditingController(text: biography);
    TextEditingController weightController =
        TextEditingController(text: weight);
    TextEditingController heightController =
        TextEditingController(text: height);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Profile'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                TextField(
                  controller: bioController,
                  decoration: const InputDecoration(
                    labelText: 'Biography',
                    prefixIcon: Icon(Icons.edit),
                  ),
                  maxLines: 3,
                ),
                TextField(
                  controller: weightController,
                  decoration: const InputDecoration(
                    labelText: 'Weight',
                    prefixIcon: Icon(Icons.monitor_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: heightController,
                  decoration: const InputDecoration(
                    labelText: 'Height',
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onSave(
                  nameController.text,
                  emailController.text,
                  phoneController.text,
                  bioController.text,
                  weightController.text,
                  heightController.text,
                );
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
