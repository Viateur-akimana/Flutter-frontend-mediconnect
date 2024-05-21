// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
// import 'chatbot_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MedPal'),
        ),
        body: Container(
          width: 430,
          height: 932,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 430,
                  height: 932,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Opacity(
                          opacity: 0.64,
                          child: Container(
                            width: 430,
                            height: 392,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://via.placeholder.com/430x392"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 146,
                        top: 100,
                        child: Container(
                          width: 147,
                          height: 149,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 129,
                                child: Text(
                                  'How is it going today ?',
                                  style: TextStyle(
                                    color: Color(0x7F221F1F),
                                    fontSize: 13,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 24,
                                top: 0,
                                child: Container(
                                  width: 98,
                                  height: 119,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 67,
                                        child: Text(
                                          'Welcome !',
                                          style: TextStyle(
                                            color: Color(0xFF221F1F),
                                            fontSize: 18,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 14,
                                        top: 101,
                                        child: SizedBox(
                                          width: 60,
                                          height: 18,
                                          child: Text(
                                            'Peace',
                                            style: TextStyle(
                                              color: Color(0xFF221F1F),
                                              fontSize: 16,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w300,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 14,
                                        top: 0,
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: ShapeDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  "https://via.placeholder.com/60x60"),
                                              fit: BoxFit.fill,
                                            ),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 299,
                        child: Container(
                          width: 430,
                          height: 633,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 39,
                                top: 30,
                                child: Container(
                                  width: 351,
                                  height: 177,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 337.50,
                                          height: 41.23,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: Container(
                                                  width: 337.50,
                                                  height: 41.23,
                                                  decoration: ShapeDecoration(
                                                    color: Color(0xFFFAFAFA),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: 1,
                                                          color: Color(
                                                              0xFFE4E4E5)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 61.87,
                                                top: 12.37,
                                                child: SizedBox(
                                                  width: 205.88,
                                                  height: 18.55,
                                                  child: Text(
                                                    'Search doctor, hospitals...',
                                                    style: TextStyle(
                                                      color: Color(0x66221F1F),
                                                      fontSize: 12,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 302,
                                                top: 24,
                                                child: Container(
                                                  width: 5.06,
                                                  height: 4.52,
                                                  child: Stack(),
                                                ),
                                              ),
                                              Positioned(
                                                left: 286,
                                                top: 9,
                                                child: Container(
                                                  width: 19.63,
                                                  height: 17.54,
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: -0,
                                                        top: 0,
                                                        child: Container(
                                                          width: 19.63,
                                                          height: 17.54,
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image: NetworkImage(
                                                                  "https://via.placeholder.com/20x18"),
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 1,
                                        top: 77,
                                        child: Container(
                                          width: 350,
                                          height: 100,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: Container(
                                                  width: 94.50,
                                                  height: 100,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 60.47,
                                                        height: 57.09,
                                                        child: Stack(
                                                          children: [
                                                            Positioned(
                                                              left: 0,
                                                              top: 0,
                                                              child: Container(
                                                                width: 60.47,
                                                                height: 57.09,
                                                                decoration:
                                                                    ShapeDecoration(
                                                                  color: Color(
                                                                      0xFF407CE2),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                  ),
                                                                  shadows: const [
                                                                    BoxShadow(
                                                                      color: Color(
                                                                          0x19000000),
                                                                      blurRadius:
                                                                          70,
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              17),
                                                                      spreadRadius:
                                                                          -11,
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 9.41,
                                                              top: 8.88,
                                                              child: Container(
                                                                width: 41.66,
                                                                height: 39.33,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    FlutterLogo(),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 94.50,
                                                        height: 21.78,
                                                        child: Text(
                                                          'Hospitals',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF221F1F),
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0.10,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 134.50,
                                                top: 0,
                                                child: Container(
                                                  width: 83.25,
                                                  height: 100,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 60.47,
                                                        height: 57.09,
                                                        child: Stack(
                                                          children: [
                                                            Positioned(
                                                              left: 0,
                                                              top: 0,
                                                              child: Container(
                                                                width: 60.47,
                                                                height: 57.09,
                                                                decoration:
                                                                    ShapeDecoration(
                                                                  color: Color(
                                                                      0xFF407CE2),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                  ),
                                                                  shadows: const [
                                                                    BoxShadow(
                                                                      color: Color(
                                                                          0x19000000),
                                                                      blurRadius:
                                                                          70,
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              17),
                                                                      spreadRadius:
                                                                          -11,
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 12,
                                                              top: 9.51,
                                                              child: Container(
                                                                width: 35,
                                                                height: 36.98,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    FlutterLogo(),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 83.25,
                                                        height: 21.78,
                                                        child: Text(
                                                          'Medication',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF221F1F),
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0.10,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 257.75,
                                                top: 0,
                                                child: Container(
                                                  width: 92.25,
                                                  height: 100,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: 60.47,
                                                        height: 57.09,
                                                        child: Stack(
                                                          children: [
                                                            Positioned(
                                                              left: 0,
                                                              top: 0,
                                                              child: Container(
                                                                width: 60.47,
                                                                height: 57.09,
                                                                decoration:
                                                                    ShapeDecoration(
                                                                  color: Color(
                                                                      0xFF407CE2),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                  ),
                                                                  shadows: const [
                                                                    BoxShadow(
                                                                      color: Color(
                                                                          0x19000000),
                                                                      blurRadius:
                                                                          70,
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              17),
                                                                      spreadRadius:
                                                                          -11,
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Positioned(
                                                              left: 9.41,
                                                              top: 8.88,
                                                              child: Container(
                                                                width: 41.66,
                                                                height: 39.33,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    FlutterLogo(),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 92.25,
                                                        height: 21.78,
                                                        child: Text(
                                                          'Ambulance',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF221F1F),
                                                            fontSize: 14,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 0.10,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 430,
                  height: 45,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 28,
                        top: 18,
                        child: Container(
                          width: 310,
                          height: 21,
                          padding: const EdgeInsets.only(right: 280),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 30,
                                height: double.infinity,
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    SizedBox(
                                      width: 30,
                                      child: Text(
                                        '9:40',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF221E1E),
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 333,
                        top: 15,
                        child: Container(
                          width: 69,
                          height: 11,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 16,
                                  height: 11,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://via.placeholder.com/16x11"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 25,
                                top: 0,
                                child: Container(
                                  width: 16,
                                  height: 11,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://via.placeholder.com/16x11"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 50,
                                top: 0,
                                child: Container(
                                  width: 19,
                                  height: 11,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Opacity(
                                          opacity: 0.35,
                                          child: Container(
                                            width: 17.18,
                                            height: 11,
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    width: 1,
                                                    color: Color(0xFF221F1F)),
                                                borderRadius:
                                                    BorderRadius.circular(2.67),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 1.56,
                                        top: 1.94,
                                        child: Container(
                                          width: 14.06,
                                          height: 7.12,
                                          decoration: ShapeDecoration(
                                            color: Color(0xFF221F1F),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(1.33),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 858.32,
                child: Container(
                  width: 430,
                  height: 73.48,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 430,
                          height: 73.48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x21000000),
                                blurRadius: 4,
                                offset: Offset(0, -3),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 49.39,
                        top: 11.68,
                        child: Container(
                          width: 43,
                          height: 46.92,
                          child: Stack(
                            children: const [
                              Positioned(
                                left: 0,
                                top: 30.17,
                                child: SizedBox(
                                  width: 43,
                                  height: 16.74,
                                  child: Text(
                                    'Home',
                                    style: TextStyle(
                                      color: Color(0xFF407CE2),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 339.22,
                        top: 15.68,
                        child: Container(
                          width: 45.39,
                          height: 42.92,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 8.78,
                                top: 0,
                                child: Container(
                                  width: 28.67,
                                  height: 22.32,
                                  padding: const EdgeInsets.only(
                                    top: 2.62,
                                    left: 5.75,
                                    right: 5.79,
                                    bottom: 2.59,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          child: Stack(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 26.17,
                                child: SizedBox(
                                  width: 45.39,
                                  height: 16.74,
                                  child: Text(
                                    'Profile',
                                    style: TextStyle(
                                      color: Color(0x99221F1F),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 218.58,
                        top: 14.88,
                        child: Container(
                          width: 83.61,
                          height: 43.72,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 27.47,
                                top: 0,
                                child: Container(
                                  width: 28.67,
                                  height: 22.32,
                                  padding: const EdgeInsets.only(
                                    top: 0.87,
                                    left: 2.24,
                                    right: 2.20,
                                    bottom: 0.88,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      SizedBox(height: 0.86),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 26.97,
                                child: SizedBox(
                                  width: 83.61,
                                  height: 16.74,
                                  child: Text(
                                    'Notification',
                                    style: TextStyle(
                                      color: Color(0x99221F1F),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 125.42,
                        top: 14.88,
                        child: Container(
                          width: 56.14,
                          height: 43.72,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 14.33,
                                top: 0,
                                child: Container(
                                  width: 28.67,
                                  height: 22.32,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(width: 24, height: 24),
                                      Container(
                                        width: 15,
                                        height: 20,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              left: 0,
                                              top: 1,
                                              child: Container(
                                                width: 15,
                                                height: 19,
                                                decoration: ShapeDecoration(
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        width: 1.20,
                                                        color:
                                                            Color(0x99221F1F)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 26.97,
                                child: SizedBox(
                                  width: 56.14,
                                  height: 16.74,
                                  child: Text(
                                    'Activity',
                                    style: TextStyle(
                                      color: Color(0x99221F1F),
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 357,
                top: 63,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/40x40"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 80,
                top: 559,
                child: Container(
                  width: 270,
                  height: 270,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 270,
                          height: 270,
                          decoration: ShapeDecoration(
                            color: Colors.white.withOpacity(0.6600000262260437),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 18,
                        top: 11,
                        child: Container(
                          width: 234.19,
                          height: 247.01,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 39,
                                top: 0,
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://via.placeholder.com/150x150"),
                                      fit: BoxFit.fill,
                                    ),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 151,
                                child: Container(
                                  width: 234.19,
                                  height: 96.01,
                                  child: Stack(
                                    children: const [
                                      Positioned(
                                        left: 2,
                                        top: 0,
                                        child: SizedBox(
                                          width: 201,
                                          height: 68,
                                          child: Text(
                                            'Stay hydrated',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 51,
                                        child: SizedBox(
                                          width: 234.19,
                                          height: 45.01,
                                          child: Text(
                                            'Pure water is the world first and foremost medicine.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xED221F1F),
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
