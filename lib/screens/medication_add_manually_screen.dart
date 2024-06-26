// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class MedicationAddManuallyScreen extends StatelessWidget {
  const MedicationAddManuallyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Medicine Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Dosage'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Frequency'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Start Date'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Add Medication'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
