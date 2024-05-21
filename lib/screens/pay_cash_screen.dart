// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class PayCashScreen extends StatelessWidget {
  const PayCashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/reservationSuccess');
              },
              child: Text('Pay'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
