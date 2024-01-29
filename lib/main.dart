import 'package:astralbooking/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


import 'package:flutter/material.dart';
import 'package:astralbooking/themes/light_mode.dart';

import 'pages/intro_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

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
        '/login_page':(context) => const LoginPage(),
      },

    );
  }
}