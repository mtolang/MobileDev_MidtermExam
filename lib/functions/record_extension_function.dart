import 'package:flutter/material.dart';

Widget buildPatientInfo(String label, String value) {
  return Card(
    color: Colors.white,
    elevation: 2,
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: ListTile(
      contentPadding: const EdgeInsets.all(16.0),
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black54,
        ),
      ),
    ),
  );
}

Widget buildAdditionalInfo() {
  return const Card(
    color: Colors.white,
    elevation: 2,
    margin: EdgeInsets.symmetric(vertical: 10),
    child: ListTile(
      contentPadding: EdgeInsets.all(16.0),
      title: Text(
        'No additional records available.',
        style: TextStyle(
          fontSize: 16,
          fontStyle: FontStyle.italic,
          color: Colors.black45,
        ),
      ),
    ),
  );
}
