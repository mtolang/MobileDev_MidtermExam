import 'package:flutter/material.dart';

class AddPatientScreen extends StatefulWidget {
  const AddPatientScreen({super.key});

  @override
  State<AddPatientScreen> createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  String? selectedGender;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _feetController = TextEditingController();
  final TextEditingController _inchesController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _feetController.dispose();
    _inchesController.dispose();
    super.dispose();
  }

  double calculateHeightInMeters(int feet, int inches) {
    return (feet * 0.3048) + (inches * 0.0254);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Patient',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[600],
      ),
      body: Container(
        color: Colors.lightBlue[100],
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calendar_today),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.transgender),
              ),
              value: selectedGender,
              items: <String>['Male', 'Female', 'Other']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedGender = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _weightController,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.monitor_weight),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _feetController,
                    decoration: const InputDecoration(
                      labelText: 'Height (ft)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: _inchesController,
                    decoration: const InputDecoration(
                      labelText: 'Height (in)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final age = int.tryParse(_ageController.text) ?? 0;
                final gender = selectedGender ?? '';
                final weight = double.tryParse(_weightController.text) ?? 0;
                final feet = int.tryParse(_feetController.text) ?? 0;
                final inches = int.tryParse(_inchesController.text) ?? 0;
                final height = calculateHeightInMeters(feet, inches);

                if (name.isNotEmpty &&
                    gender.isNotEmpty &&
                    weight > 0 &&
                    height > 0) {
                  final bmi = weight / (height * height);
                  final category = bmi < 18.5
                      ? 'Underweight'
                      : bmi < 24.9
                          ? 'Normal weight'
                          : bmi < 29.9
                              ? 'Overweight'
                              : 'Obesity';

                  Navigator.of(context).pop({
                    'name': name,
                    'gender': gender,
                    'age': age,
                    'weight': weight,
                    'height': height,
                    'bmi': bmi,
                    'category': category,
                  });
                }
              },
              child: const Text('Add Patient'),
            ),
          ],
        ),
      ),
    );
  }
}
