import 'package:flutter/material.dart';
import 'dart:async';

import 'package:myplants/screens/home/HomeScreen.dart';
import 'package:myplants/services/db_plants.dart';

import 'package:myplants/themes/ColorThemes.dart';
import 'package:myplants/themes/FontThemes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    DB_plants.openDB();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);

    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover)),
            child: Container(
              alignment: Alignment.center,
              height: media.size.height * 0.2,
              width: media.size.width * 0.7,
              decoration: const BoxDecoration(
                  color: ColorThemes.darkGreen,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                        color: ColorThemes.dark,
                        offset: Offset(4, 4),
                        blurRadius: 6)
                  ]),
              child: const Text(
                'My Plants',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorThemes.light,
                    fontFamily: FontThemes.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            )));
  }
}
