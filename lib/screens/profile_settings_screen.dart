// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfileSettingsScreen extends StatelessWidget {
  const ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Language'),
            trailing: Icon(Icons.language),
            onTap: () {
              Navigator.pushNamed(context, '/language');
            },
          ),
          ListTile(
            title: Text('Notifications'),
            trailing: Icon(Icons.notifications),
            onTap: () {
              // Implement notification settings logic
            },
          ),
          // Add more settings here
        ],
      ),
    );
  }
}