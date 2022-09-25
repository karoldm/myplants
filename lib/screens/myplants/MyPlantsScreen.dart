import 'package:flutter/material.dart';

import '../../models/Plant.dart';

import '../../themes/ColorThemes.dart';
import 'PlantCard.dart';

class MyPlantsScreen extends StatefulWidget {
  const MyPlantsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MyPlantsScreenState();
}

class _MyPlantsScreenState extends State<MyPlantsScreen> {
  late TextEditingController _searchTextController = TextEditingController();
  late MediaQueryData media = MediaQuery.of(context);

  List<Plant> plants = [
    Plant(
        id: 0,
        especie: 'rosa vermelha',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png',
        sun: 3,
        humidity: 2,
        rememberWater: false,
        daysWater: [],
        watered: false),
    Plant(
        id: 2,
        especie: 'rosa azul',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png',
        sun: 3,
        humidity: 2,
        rememberWater: false,
        daysWater: [],
        watered: false),
    Plant(
        id: 3,
        especie: 'rosa azul',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png',
        sun: 3,
        humidity: 2,
        rememberWater: false,
        daysWater: [],
        watered: false),
    Plant(
        id: 4,
        especie: 'rosa azul',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png',
        sun: 3,
        humidity: 2,
        rememberWater: false,
        daysWater: [],
        watered: false),
    Plant(
        id: 5,
        especie: 'rosa azul',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png',
        sun: 3,
        humidity: 2,
        rememberWater: false,
        daysWater: [],
        watered: false),
    Plant(
        id: 6,
        especie: 'rosa azul',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png',
        sun: 3,
        humidity: 2,
        rememberWater: false,
        daysWater: [],
        watered: false),
  ];

  List<Plant> plantsToDisplay = [];

  final Map<String, dynamic> themeRecentes = {
    'background': ColorThemes.darkGreen,
    'fontColor': ColorThemes.light
  };

  final Map<String, dynamic> themeAZ = {
    'background': ColorThemes.lightGreen,
    'fontColor': ColorThemes.dark
  };

  @override
  void initState() {
    for (var p in plants) {
      plantsToDisplay.add(p);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorThemes.darkGreen,
          elevation: 0,
          title: const Text(''),
          actions: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: ColorThemes.grey),
                        onPressed: () =>
                            Navigator.of(context).pushReplacementNamed('/home'),
                        child: const Icon(Icons.home_outlined,
                            color: ColorThemes.dark, size: 25)),
                    Container(
                      padding: const EdgeInsets.only(left: 2),
                      decoration: const BoxDecoration(
                          color: ColorThemes.grey,
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      width: media.size.width * 0.55,
                      child: TextField(
                        style: const TextStyle(fontSize: 14),
                        decoration: const InputDecoration(
                            hintText: 'Procurar Planta',
                            hintStyle: TextStyle(fontSize: 12),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            border: OutlineInputBorder(),
                            focusColor: ColorThemes.dark),
                        controller: _searchTextController,
                        onChanged: (value) {
                          setState(() {
                            plantsToDisplay.clear();
                            for (var p in plants) {
                              plantsToDisplay.add(p);
                            }
                            if (value != '') {
                              plantsToDisplay.removeWhere((plant) =>
                                  !(plant.especie.contains(value) ||
                                      plant.category.contains(value)));
                            }
                          });
                        },
                      ),
                    ),
                    const Icon(Icons.search,
                        color: ColorThemes.light, size: 25),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        themeRecentes['background'] = ColorThemes.darkGreen;
                        themeRecentes['fontColor'] = ColorThemes.light;
                        themeAZ['background'] = ColorThemes.lightGreen;
                        themeAZ['fontColor'] = ColorThemes.dark;
                        plantsToDisplay.clear();
                        for (var p in plants) {
                          plantsToDisplay.add(p);
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 16),
                      backgroundColor: themeRecentes['background'],
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      'Recentes',
                      style: TextStyle(
                          color: themeRecentes['fontColor'],
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        themeRecentes['background'] = ColorThemes.lightGreen;
                        themeRecentes['fontColor'] = ColorThemes.dark;
                        themeAZ['background'] = ColorThemes.darkGreen;
                        themeAZ['fontColor'] = ColorThemes.light;

                        plantsToDisplay.clear();
                        for (var p in plants) {
                          plantsToDisplay.add(p);
                        }

                        plantsToDisplay
                            .sort((p1, p2) => p1.especie.compareTo(p2.especie));
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 16),
                      backgroundColor: themeAZ['background'],
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      'A-Z',
                      style: TextStyle(
                          color: themeAZ['fontColor'],
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
                child: GridView.count(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              crossAxisCount: 2,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              childAspectRatio: 0.7,
              children: List.generate(plantsToDisplay.length, (index) {
                return PlantCard(plant: plantsToDisplay[index]);
              }),
            ))
          ],
        ));
  }
}

void back() {}
