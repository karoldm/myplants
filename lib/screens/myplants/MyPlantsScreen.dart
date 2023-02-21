import 'package:flutter/material.dart';

import '../../models/Plant.dart';

import '../../services/db_plants.dart';
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

  List<Plant> plantsToDisplay = [];
  List<Plant> plants = [];

  Future<List<Plant>> getPlants() async {
    List<Plant> dbPlants = await DB_plants.getAll();

    plants.clear();

    for (Plant p in dbPlants) {
      plants.add(p);
    }

    //iniciano lista que será exibida
    if (plantsToDisplay.isEmpty) {
      plantsToDisplay = List.from(plants.reversed);
    }

    return dbPlants;
  }

  final Map<String, dynamic> themeRecentes = {
    'background': ColorThemes.darkGreen,
    'fontColor': ColorThemes.light
  };

  final Map<String, dynamic> themeAZ = {
    'background': ColorThemes.lightGreen,
    'fontColor': ColorThemes.dark
  };

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPlants(),
        builder: (context, snapshot) => Scaffold(
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
                            onPressed: () => Navigator.of(context)
                                .pushReplacementNamed('/home'),
                            child: const Icon(Icons.home_outlined,
                                color: ColorThemes.dark, size: 25)),
                        Container(
                          padding: const EdgeInsets.only(left: 2),
                          decoration: const BoxDecoration(
                              color: ColorThemes.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
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
                            plantsToDisplay = List.from(plants.reversed);
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
                            themeRecentes['background'] =
                                ColorThemes.lightGreen;
                            themeRecentes['fontColor'] = ColorThemes.dark;
                            themeAZ['background'] = ColorThemes.darkGreen;
                            themeAZ['fontColor'] = ColorThemes.light;

                            plantsToDisplay.clear();
                            plantsToDisplay = List.from(plants.reversed);

                            plantsToDisplay.sort(
                                (p1, p2) => p1.especie.compareTo(p2.especie));
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  crossAxisCount: 2,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                  childAspectRatio: 0.7,
                  children: List.generate(plantsToDisplay.length, (index) {
                    return PlantCard(plant: plantsToDisplay[index]);
                  }),
                ))
              ],
            )));
  }
}

void back() {}
