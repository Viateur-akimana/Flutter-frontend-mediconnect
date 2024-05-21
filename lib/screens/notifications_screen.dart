// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: ListView(
        children: const <Widget>[
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
