// lib/screens/hospital_detail_screen.dart
import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class HospitalDetailScreen extends StatelessWidget {
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
              'King Fahad Hospital',
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
