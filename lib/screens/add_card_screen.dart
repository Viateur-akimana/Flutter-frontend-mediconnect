// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Card Number'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Expiration Date'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addCardScan');
              },
              child: Text('Scan Card'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
