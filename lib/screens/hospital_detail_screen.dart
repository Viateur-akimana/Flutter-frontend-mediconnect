// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class HospitalDetailScreen extends StatelessWidget {
  const HospitalDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image.network('https://via.placeholder.com/300'),
            SizedBox(height: 16),
            Text(
              'King Faisal Hospital',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Description about the hospital...'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/hospitalReservation');
              },
              child: Text('Make Appointment'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
