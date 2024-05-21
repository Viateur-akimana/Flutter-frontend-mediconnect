// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class PaymentOptionsScreen extends StatelessWidget {
  const PaymentOptionsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Credit Card'),
            onTap: () {
              Navigator.pushNamed(context, '/addCard');
            },
          ),
          ListTile(
            title: Text('Cash'),
            onTap: () {
              Navigator.pushNamed(context, '/payCash');
            },
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
