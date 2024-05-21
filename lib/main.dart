// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/activity_screen.dart';
import 'screens/chatbot_screen.dart';
import 'screens/top_hospitals_screen.dart';
import 'screens/hospital_detail_screen.dart';
import 'screens/hospital_reservation_screen.dart';
import 'screens/payment_options_screen.dart';
import 'screens/add_card_screen.dart';
import 'screens/add_card_scan_screen.dart';
import 'screens/pay_cash_screen.dart';
import 'screens/reservation_success_screen.dart';
import 'screens/reservation_queue_screen.dart';
import 'screens/medication_screen.dart';
import 'screens/medication_add_screen.dart';
import 'screens/medication_add_scan_screen.dart';
import 'screens/medication_add_manually_screen.dart';
import 'screens/ambulance_screen.dart';
import 'screens/ambulance_success_screen.dart';
import 'screens/driver_details_screen.dart';

void main() {
  runApp(MediConnectApp());
}

class MediConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediConnect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/profile': (context) => ProfileScreen(),
        '/notifications': (context) => NotificationsScreen(),
        '/activity': (context) => ActivityScreen(),
        '/chatbot': (context) => ChatbotScreen(),
        '/topHospitals': (context) => TopHospitalsScreen(),
        '/hospitalDetail': (context) => HospitalDetailScreen(),
        '/hospitalReservation': (context) => HospitalReservationScreen(),
        '/paymentOptions': (context) => PaymentOptionsScreen(),
        '/addCard': (context) => AddCardScreen(),
        '/addCardScan': (context) => AddCardScanScreen(),
        '/payCash': (context) => PayCashScreen(),
        '/reservationSuccess': (context) => ReservationSuccessScreen(),
        '/reservationQueue': (context) => ReservationQueueScreen(),
        '/medication': (context) => MedicationScreen(),
        '/medicationAdd': (context) => MedicationAddScreen(),
        '/medicationAddScan': (context) => MedicationAddScanScreen(),
        '/medicationAddManually': (context) => MedicationAddManuallyScreen(),
        '/ambulance': (context) => AmbulanceScreen(),
        '/ambulanceSuccess': (context) => AmbulanceSuccessScreen(),
        '/driverDetails': (context) => DriverDetailsScreen(),
      },
    );
  }
}
