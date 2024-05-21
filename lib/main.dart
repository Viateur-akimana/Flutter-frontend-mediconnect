// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/first_page.dart';
// import 'package:flutter_application_1/pages/home_page.dart';
// import 'package:flutter_application_1/pages/setting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //variable
  int _count = 0;
  //method

  void _counterUpdate(){
    setState(() {
      _count++;
    });
  }
  //ui for updating
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: ToDoPage(),
      
    ); 
  }
}