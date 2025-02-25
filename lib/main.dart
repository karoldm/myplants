import 'package:flutter/material.dart';
import 'package:myplants/screens/home/HomeScreen.dart';
import 'package:myplants/screens/myplants/MyPlantsScreen.dart';
import 'package:myplants/screens/splash/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My plants',
      theme: ThemeData(primarySwatch: Colors.grey),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/splash': (context) => const SplashScreen(),
        '/myPlants': (context) => const MyPlantsScreen(),
      },
      initialRoute: '/splash',
    );
  }
}
