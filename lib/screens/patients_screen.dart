import 'package:flutter/material.dart';
import 'package:sample_project/functions/patients_functions.dart';

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

  void updatePatients() {
    setState(() {});
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
                      onPressed: () =>
                          editPatient(context, index, patients, updatePatients),
                    ),
                    IconButton(
                      icon: const Icon(Icons.check, color: Colors.green),
                      onPressed: () =>
                          navigateToRecordsScreen(context, patient),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            addPatient(context, patients).then((_) => updatePatients()),
        backgroundColor: Colors.lightBlue[900],
        child: const Icon(Icons.add),
      ),
    );
  }
}
