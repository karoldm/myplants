import 'package:flutter/material.dart';
import 'package:myplants/themes/FontThemes.dart';

import '../../themes/ColorThemes.dart';

class WaterPlants {
  bool watered;
  final int? id;
  final String especie;
  final String cateogry;
  final String photoPath;

  WaterPlants(
      {required this.watered,
      required this.id,
      required this.especie,
      required this.cateogry,
      required this.photoPath});

  void setWatered(bool watered) {
    this.watered = watered;
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);

    List<dynamic> plantsWater = [
      WaterPlants(
          watered: false,
          id: 0,
          especie: 'rosa azul',
          cateogry: 'rosas',
          photoPath: 'assets/images/defaultPlantImage.png'),
      WaterPlants(
          watered: false,
          id: 1,
          especie: 'rosa azul',
          cateogry: 'rosas',
          photoPath: 'assets/images/defaultPlantImage.png'),
      WaterPlants(
          watered: false,
          id: 2,
          especie: 'rosa azul',
          cateogry: 'rosas',
          photoPath: 'assets/images/defaultPlantImage.png'),
      WaterPlants(
          watered: false,
          id: 3,
          especie: 'rosa azul',
          cateogry: 'rosas',
          photoPath: 'assets/images/defaultPlantImage.png'),
    ];

    List<dynamic> plantsWatered = [
      WaterPlants(
          watered: true,
          id: 0,
          especie: 'rosa azul',
          cateogry: 'rosas',
          photoPath: 'assets/images/defaultPlantImage.png'),
      WaterPlants(
          watered: true,
          id: 1,
          especie: 'rosa azul',
          cateogry: 'rosas',
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
                        backgroundColor: ColorThemes.gray),
                    onPressed: myPlants,
                    child: const Text('Minahs Plantas',
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
                        backgroundColor: ColorThemes.gray),
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
                childCount: 1, // 1000 list items
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const PlantWaterCard(
                      id: 0,
                      especie: 'especie',
                      category: 'category',
                      photoPath: 'assets/images/defaultPlantImage.png');
                },
                childCount: 4, // 1000 list items
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const PlantWateredCard(
                      id: 0,
                      especie: 'especie',
                      category: 'category',
                      photoPath: 'assets/images/defaultPlantImage.png');
                },
                childCount: 2, // 1000 list items
              ),
            ),
          ],
        ));
  }
}

class PlantWaterCard extends StatelessWidget {
  final int? id;
  final String especie;
  final String category;
  final String photoPath;

  const PlantWaterCard(
      {super.key,
      required this.id,
      required this.especie,
      required this.category,
      required this.photoPath});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: const BoxDecoration(
            color: ColorThemes.gray,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          children: [
            Image.asset(
              photoPath,
              width: 60,
            ),
            Column(
              children: [
                Text(especie,
                    style: const TextStyle(
                        color: ColorThemes.dark,
                        fontWeight: FontWeight.w400,
                        fontSize: 14)),
                Text(category,
                    style: const TextStyle(
                        color: ColorThemes.dark,
                        fontWeight: FontWeight.w200,
                        fontSize: 8))
              ],
            ),
            TextButton(onPressed: () {}, child: const Text('')),
          ],
        ));
  }
}

class PlantWateredCard extends StatelessWidget {
  final int? id;
  final String especie;
  final String category;
  final String photoPath;

  const PlantWateredCard(
      {super.key,
      required this.id,
      required this.especie,
      required this.category,
      required this.photoPath});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: const BoxDecoration(
            color: ColorThemes.mediumGreen,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          children: [
            Image.asset(
              photoPath,
              width: 60,
            ),
            Column(
              children: [
                Text(especie,
                    style: const TextStyle(
                        color: ColorThemes.dark,
                        fontWeight: FontWeight.w400,
                        fontSize: 14)),
                Text(category,
                    style: const TextStyle(
                        color: ColorThemes.dark,
                        fontWeight: FontWeight.w200,
                        fontSize: 8))
              ],
            ),
            TextButton(onPressed: () {}, child: const Text('')),
          ],
        ));
  }
}

void newPlant() {}

void myPlants() {}
