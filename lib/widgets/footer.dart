

import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
   const Footer({super.key});
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chatbot',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'Activity',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: 0,
      selectedItemColor: Colors.blue,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/chatbot');
            break;
          case 2:
            Navigator.pushNamed(context, '/activity');  
            break;
          case 3:
            Navigator.pushNamed(context, '/notifications');
            break;
          case 4:
            Navigator.pushNamed(context, '/profile');
            break;
        }
      },
    );
  }
}
