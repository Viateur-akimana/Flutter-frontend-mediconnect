// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class MedicationAddScreen extends StatelessWidget {
  const MedicationAddScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/medicationAddManually');
              },
              child: Text('Add Manually'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/medicationAddScan');
              },
              child: Text('Scan Medicine'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
