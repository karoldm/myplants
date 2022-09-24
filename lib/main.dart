import 'package:flutter/material.dart';
import 'package:myplants/models/Plant.dart';
import 'package:myplants/screens/plant/PlantScreen.dart';

import 'package:myplants/themes/ColorThemes.dart';

import 'package:myplants/screens/home/HomeScreen.dart';
import 'package:myplants/screens/myplants/MyPlantsScreen.dart';
import 'package:myplants/screens/splash/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final Plant plant = const Plant(
      id: 0,
      especie: 'rosa azul',
      category: 'rosas',
      humidity: 2,
      sun: 3,
      photoPath: 'assets/images/defaultPlantImage.png',
      rememberWater: false,
      daysWater: []);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: //PlantScreen(plant: plant)
          //const MyPlantsScreen(),
          HomeScreen(),
      //const SplashScreen(),
    );
  }
}
