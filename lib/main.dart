// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mental_app/models/login.dart';
import 'package:mental_app/pages/action_page.dart';
import 'package:mental_app/pages/fantasy_page.dart';
import 'package:mental_app/pages/game_page.dart';
import 'package:mental_app/pages/home_page.dart';
import 'package:mental_app/pages/isekai_page.dart';
import 'package:firebase_core/firebase_core.dart';

late FirebaseApp app;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBE0RDrSfbOVL26jiRy45TPC1NRKs0gZok",
          appId: "1:992045068058:android:606c43388bc0acf0cb06a3",
          messagingSenderId: "992045068058",
          projectId: "coba1-43e7c"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        '/action': (context) => ActionPage(),
        '/isekai': (context) => IsekaiPage(),
        '/fantasy': (context) => FantasyPage(),
        '/game': (context) => GamePage(),
        '/home': (context) => HomePage(),
      },
      // other configurations...
    );
  }
}
