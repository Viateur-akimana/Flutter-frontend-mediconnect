// lib/screens/activity_screen.dart
import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class ActivityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Center(
        child: Text(
          'Activity Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
