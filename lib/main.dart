import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/SplashScreen/View/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBiWPF92fok9Kd0FZ29zTl2eShh9k5ykw0',
          appId: '1:1039742666367:android:98b8178c43da5e21cee14a',
          messagingSenderId: '1039742666367',
          projectId: 'dominos-app-4e8a6'));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
