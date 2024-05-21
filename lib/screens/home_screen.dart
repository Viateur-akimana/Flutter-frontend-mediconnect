// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildHeader(),
          _buildSearchBar(),
          _buildIconsRow(context),
          _buildHydrationWidget(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: const Color(0xFFE6F1FF),
      child: Column(
        children: const [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/ellipse_78.png'),
          ),
          SizedBox(height: 6),
          Text(
            'Welcome !',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          Text(
            'Peace',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search doctor, hospitals...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildIconsRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIconButton(context, 'assets/icons/hospitals.svg', 'Hospitals'),
          _buildIconButton(context, 'assets/icons/medication.svg', 'Medication'),
          _buildIconButton(context, 'assets/icons/ambulance.svg', 'Ambulance'),
        ],
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, String iconUrl, String label) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.1,
          height: MediaQuery.of(context).size.width * 0.1,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF407CE2),
            boxShadow: [
              BoxShadow(
                color: Color(0x1A000000),
                offset: Offset(0, 17),
                blurRadius: 35,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.asset(
              iconUrl,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildHydrationWidget() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xA8FFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage('assets/images/ellipse_811.png'),
            ),
            SizedBox(height: 6),
            Text(
              'Stay hydrated',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Pure water is the world\'s first and foremost medicine.',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 8,
                color: Color(0xED221F1F),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.blue),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_run, color: Colors.grey),
          label: 'Activity',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications, color: Colors.grey),
          label: 'Notification',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.grey),
          label: 'Profile',
        ),
      ],
    );
  }
}
