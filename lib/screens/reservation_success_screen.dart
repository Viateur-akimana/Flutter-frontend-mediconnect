// lib/screens/reservation_success_screen.dart
import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class ReservationSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Reservation made successfully!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/reservationQueue');
              },
              child: Text('View Queue'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
