import 'package:flutter/material.dart';
import 'package:thompson_screening_test/page/book_confirmation_page.dart';
import 'package:thompson_screening_test/page/book_your_appointment_page.dart';
import 'package:thompson_screening_test/page/chat_appointment_page.dart';
import 'package:thompson_screening_test/page/home_screen_page.dart';
import 'package:thompson_screening_test/page/medication_page.dart';
import 'package:thompson_screening_test/page/my_medications_page.dart';
import 'package:thompson_screening_test/page/my_profile_page.dart';
import 'package:thompson_screening_test/page/start_page.dart';
import 'package:thompson_screening_test/page/video_appointment_page.dart';
import 'package:thompson_screening_test/page/your_appointments_page.dart';

void main() {
  runApp(const ThompsonScreenTest());
}

class ThompsonScreenTest extends StatelessWidget {
  const ThompsonScreenTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        body: StartPage(),
      ),
      routes: {
        '/home_screen': (context) => const HomeScreenPage(),
        '/my_profile': (context) => const MyProfilePage(),
        '/your_appointments': (context) => const YourAppointmentsPage(),
        '/your_appointments/video': (context) => const VideoAppointmentPage(),
        '/your_appointments/chat': (context) => const ChatAppointmentPage(),
        '/my_medications': (context) => const MyMedicationsPage(),
        '/my_medications/medication': (context) => const MedicationPage(),
        '/book_your_appointment': (context) => const BookYourAppointmentPage(),
        '/book_your_appointment/confirmation': (context) =>
            const BookConfirmationPage(),
      },
    );
  }
}
