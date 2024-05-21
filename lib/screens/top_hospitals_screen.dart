// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class TopHospitalsScreen extends StatelessWidget {
  const TopHospitalsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Image.network('https://via.placeholder.com/100'),
            title: Text('King Faisal Hospital'),
            subtitle: Text('Details about the hospital'),
            onTap: () {
              Navigator.pushNamed(context, '/hospitalDetail');
            },
          ),
          ListTile(
            leading: Image.network('https://via.placeholder.com/100'),
            title: Text('Legacy Clinics'),
            subtitle: Text('Details about the hospital'),
            onTap: () {
              Navigator.pushNamed(context, '/hospitalDetail');
            },
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
