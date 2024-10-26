import 'package:flutter/material.dart';
import 'add_patient_screen.dart';

class PatientsScreen extends StatefulWidget {
  const PatientsScreen({super.key});

  @override
  _PatientsScreenState createState() => _PatientsScreenState();
}

class _PatientsScreenState extends State<PatientsScreen> {
  List<Map<String, dynamic>> patients = [
    {
      'name': 'John Doe',
      'age': 30,
      'gender': 'Male',
      'weight': 70.0,
      'height': 1.75,
      'bmi': 22.86,
      'category': 'Normal weight',
    },
  ];

  double calculateBMI(double weight, double height) {
    return weight / (height * height);
  }

  void _addPatient() async {
    final newPatient = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AddPatientScreen(),
      ),
    );

    if (newPatient != null) {
      setState(() {
        patients.add(newPatient);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'View Patients',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.lightBlue[600],
      ),
      body: Container(
        color: Colors.lightBlue[100],
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: patients.length,
          itemBuilder: (context, index) {
            final patient = patients[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                title: Text(patient['name']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Age: ${patient['age']}'),
                    Text('Gender: ${patient['gender']}'),
                    Text('Weight: ${patient['weight']} kg'),
                    Text('Height: ${patient['height']} m'),
                    Text('BMI: ${patient['bmi'].toStringAsFixed(2)}'),
                    Text('Category: ${patient['category']}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {}, // Add edit functionality if needed
                    ),
                    IconButton(
                      icon: const Icon(Icons.check,
                          color: Colors.green), // Changed to check icon
                      onPressed: () {
                        // Add functionality for the check icon if needed
                        print('Check icon pressed for ${patient['name']}');
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addPatient,
        backgroundColor: Colors.lightBlue[900],
        child: const Icon(Icons.add),
      ),
    );
  }
}
