// lib/screens/hospital_reservation_screen.dart
import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class HospitalReservationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Enter your date of birth'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter your gender'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Enter your reason for visit'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/paymentOptions');
              },
              child: Text('Make Reservation'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
