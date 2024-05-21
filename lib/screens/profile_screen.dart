// ignore_for_file: prefer_const_constructors, 

import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                'John Doe',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'johndoe@example.com',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              ListTile(
                title: Text('Notification: Enabled'),
              ),
              ListTile(
                title: Text('Language: English'),
              ),
              ListTile(
                title: Text('Password: ********'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
