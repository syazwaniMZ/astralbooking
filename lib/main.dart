import 'package:flutter/material.dart';
import 'package:astralbooking/themes/light_mode.dart';

import 'pages/intro_page.dart';
import 'pages/train_search_page.dart';
import 'pages/confirm_booking_page.dart';
import 'pages/booking_train_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astral Train',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const IntroPage(),
      routes: {
        '/intro_page':(context) => const IntroPage(),
        '/train_search_page': (context) => const TrainSearchPage(),
        '/booking_train_page': (context) => const BookingTrain(),
        '/confirm_booking_page': (context) => const ConfirmBooking(),
      },

    );
  }
}