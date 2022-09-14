import 'package:flutter/material.dart';

import '../../models/PlantWater.dart';

import 'package:myplants/themes/FontThemes.dart';
import '../../themes/ColorThemes.dart';

import 'PlantWaterCard.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);

    List<dynamic> plantsWater = [
      PlantWater(
        watered: false,
        id: 0,
        especie: 'rosa azul',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png',
      ),
      PlantWater(
          watered: false,
          id: 1,
          especie: 'rosa azul',
          category: 'rosas',
          photoPath: 'assets/images/defaultPlantImage.png'),
      PlantWater(
          watered: false,
          id: 2,
          especie: 'rosa azul',
          category: 'rosas',
          photoPath: 'assets/images/defaultPlantImage.png'),
      PlantWater(
          watered: true,
          id: 3,
          especie: 'rosa azul',
          category: 'rosas',
          photoPath: 'assets/images/defaultPlantImage.png'),
    ];

    return Scaffold(
        appBar: AppBar(
            backgroundColor: ColorThemes.darkGreen,
            elevation: 0,
            title: const Icon(Icons.abc, color: ColorThemes.light, size: 30),
            actions: [
              Padding(
                padding: const EdgeInsets.all(14),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: ColorThemes.grey),
                    onPressed: myPlants,
                    child: const Text('Minhas Plantas',
                        style: TextStyle(
                            color: ColorThemes.dark,
                            fontFamily: FontThemes.primary,
                            fontWeight: FontWeight.w400))),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: ColorThemes.grey),
                    onPressed: newPlant,
                    child: const Icon(
                      Icons.add,
                      color: ColorThemes.dark,
                      size: 12,
                    )),
              )
            ]),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    width: media.size.width,
                    decoration: const BoxDecoration(
                        color: ColorThemes.lightGreen,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: const Text('Regar Hoje',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorThemes.dark,
                            fontWeight: FontWeight.w400,
                            fontSize: 16)),
                  );
                },
                childCount: 1,
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              return PlantWaterCard(plant: plantsWater[index]);
            }, childCount: plantsWater.length))
          ],
        ));
  }
}

void newPlant() {}

void myPlants() {}
