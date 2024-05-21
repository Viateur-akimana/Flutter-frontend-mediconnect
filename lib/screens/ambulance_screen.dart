// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class AmbulanceScreen extends StatelessWidget {
  const AmbulanceScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                'Map Placeholder',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ambulanceSuccess');
              },
              child: Text('Confirm Location'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
