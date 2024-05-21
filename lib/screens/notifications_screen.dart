// lib/screens/notifications_screen.dart
import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Appointment Confirmation'),
            subtitle: Text('Your appointment has been confirmed for tomorrow at 10 AM.'),
          ),
          ListTile(
            title: Text('Prescription Update'),
            subtitle: Text('Your prescription has been updated.'),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
