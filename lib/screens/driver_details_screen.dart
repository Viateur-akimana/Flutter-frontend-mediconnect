// lib/screens/driver_details_screen.dart
import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';

class DriverDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              ),
              title: Text('Patrick'),
              subtitle: Text('King Fahad Hospital'),
            ),
            Divider(),
            ListTile(
              title: Text('Member since'),
              subtitle: Text('10-01-2017'),
            ),
            ListTile(
              title: Text('Plate number'),
              subtitle: Text('HS7SK6'),
            ),
            ListTile(
              title: Text('Phone number'),
              subtitle: Text('+326-798-893-127'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
