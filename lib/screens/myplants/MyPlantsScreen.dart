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
    const Plant(
        id: 0,
        especie: 'rosa azul',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png',
        sun: 3,
        humidity: 2,
        rememberWater: false,
        daysWater: []),
    const Plant(
        id: 2,
        especie: 'rosa azul',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png',
        sun: 3,
        humidity: 2,
        rememberWater: false,
        daysWater: []),
    const Plant(
        id: 3,
        especie: 'rosa azul',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png',
        sun: 3,
        humidity: 2,
        rememberWater: false,
        daysWater: []),
    const Plant(
        id: 4,
        especie: 'rosa azul',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png',
        sun: 3,
        humidity: 2,
        rememberWater: false,
        daysWater: []),
    const Plant(
        id: 5,
        especie: 'rosa azul',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png',
        sun: 3,
        humidity: 2,
        rememberWater: false,
        daysWater: []),
    const Plant(
        id: 6,
        especie: 'rosa vermelha',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png',
        sun: 3,
        humidity: 2,
        rememberWater: false,
        daysWater: []),
  ];

  List<Plant> plantsToDisplay = [];

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
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: ColorThemes.grey),
                        onPressed: back,
                        child: const Icon(Icons.arrow_back,
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 16),
                      backgroundColor: ColorThemes.darkGreen,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      'Recentes',
                      style: TextStyle(
                          color: ColorThemes.light,
                          fontSize: 16,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 16),
                      backgroundColor: ColorThemes.lightGreen,
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      'A-Z',
                      style: TextStyle(
                          color: ColorThemes.dark,
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
