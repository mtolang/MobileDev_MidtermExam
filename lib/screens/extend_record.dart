import 'package:flutter/material.dart';
import 'package:sample_project/functions/record_extension_function.dart';

class ExtendRecordScreen extends StatelessWidget {
  final Map<String, dynamic> patient; 

  const ExtendRecordScreen({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          ' Patients Details ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.lightBlue[600],
        elevation: 4.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildPatientInfo("Patient Name", patient['name']),
              buildPatientInfo("Age", patient['age'].toString()),
              buildPatientInfo("Gender", patient['gender']),
              buildPatientInfo("BMI", patient['bmi'].toStringAsFixed(2)),
              buildPatientInfo("Category", patient['category']),
              const SizedBox(height: 20),
              Divider(color: Colors.grey.shade300, thickness: 1),
              const SizedBox(height: 20),
              const Text(
                'Additional Records or Medical History:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              buildAdditionalInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
