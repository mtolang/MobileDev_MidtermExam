import 'package:flutter/material.dart';
import 'package:sample_project/screens/extend_record.dart';
import '../functions/records_function.dart'; 

class RecordsScreen extends StatelessWidget {
  final Map<String, dynamic> patient; 

  RecordsScreen({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    final String formattedDate = RecordUtils.getFormattedDate();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Patient Records',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExtendRecordScreen(patient: patient),
                  ),
                );
              },
              child: Card(
                color: Colors.lightBlue.shade50,
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text(
                    patient['name'],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue.shade800,
                    ),
                  ),
                ),
              ),
            ),

            Text(
              "Date: $formattedDate",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
