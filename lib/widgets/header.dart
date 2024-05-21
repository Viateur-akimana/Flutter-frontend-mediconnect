// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('MediConnect'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            Navigator.pushNamed(context, '/notifications');
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
