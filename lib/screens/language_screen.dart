// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Language')),
      body: ListView(
        children: [
          ListTile(
            title: Text('English'),
            onTap: () {
              // Implement language change logic
            },
          ),
          ListTile(
            title: Text('French'),
            onTap: () {
              // Implement language change logic
            },
          ),
          // Add more languages here
        ],
      ),
    );
  }
}