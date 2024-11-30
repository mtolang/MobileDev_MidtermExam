import 'package:flutter/material.dart';
import 'package:sample_project/screens/add_patient_screen.dart';
import 'package:sample_project/screens/records_screen.dart';

double calculateBMI(double weight, double height) {
  return weight / (height * height);
}

String getBMICategory(double bmi) {
  if (bmi < 18.5) {
    return 'Underweight';
  } else if (bmi < 24.9) {
    return 'Normal weight';
  } else if (bmi < 29.9) {
    return 'Overweight';
  } else {
    return 'Obesity';
  }
}

Future<void> addPatient(
    BuildContext context, List<Map<String, dynamic>> patients) async {
  final newPatient = await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const AddPatientScreen(),
    ),
  );

  if (newPatient != null) {
    patients.add(newPatient);
  }
}

Future<void> editPatient(
  BuildContext context,
  int index,
  List<Map<String, dynamic>> patients,
  Function updatePatients,
) async {
  final patient = patients[index];
  final TextEditingController nameController =
      TextEditingController(text: patient['name']);
  final TextEditingController ageController =
      TextEditingController(text: patient['age'].toString());
  final TextEditingController weightController =
      TextEditingController(text: patient['weight'].toString());
  String selectedGender = patient['gender'];

  // Height in feet and inches
  int heightFeet = (patient['height'] ~/ 0.3048).toInt();
  int heightInches = (((patient['height'] % 0.3048) / 0.0254).round()).toInt();

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Edit Patient',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            DropdownButtonFormField<String>(
              value: selectedGender,
              items: ['Male', 'Female']
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              onChanged: (value) {
                selectedGender = value!;
              },
              decoration: const InputDecoration(labelText: 'Gender'),
            ),
            TextField(
              controller: weightController,
              decoration: const InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.number,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Height (ft)'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      heightFeet = int.tryParse(value) ?? 0;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Height (in)'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      heightInches = int.tryParse(value) ?? 0;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedHeight = (heightFeet * 0.3048) +
                    (heightInches * 0.0254); 
                final updatedWeight =
                    double.tryParse(weightController.text) ?? patient['weight'];
                final updatedBMI = calculateBMI(updatedWeight, updatedHeight);

                patients[index] = {
                  'name': nameController.text,
                  'age': int.tryParse(ageController.text) ?? patient['age'],
                  'gender': selectedGender,
                  'weight': updatedWeight,
                  'height': updatedHeight,
                  'bmi': updatedBMI,
                  'category': getBMICategory(updatedBMI),
                };

                updatePatients();
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: const Text('Save Changes'),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    ),
  );
}

void navigateToRecordsScreen(
    BuildContext context, Map<String, dynamic> patient) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => RecordsScreen(patient: patient),
    ),
  );
}
