// lib/screens/medication_screen.dart
import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class MedicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text('Omeprazole'),
              subtitle: Text('Dosage: 20mg'),
              trailing: Text('Daily'),
            ),
            ListTile(
              title: Text('Ibuprofen'),
              subtitle: Text('Dosage: 200mg'),
              trailing: Text('Twice a day'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/medicationAdd');
              },
              child: Text('Add Medicine'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
