// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class ReservationQueueScreen extends StatelessWidget {
  const ReservationQueueScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You are currently number',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 8),
            Text(
              '54',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text('Go to Home'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
