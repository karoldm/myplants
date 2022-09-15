import 'package:flutter/material.dart';

import 'package:myplants/models/Plant.dart';
import 'package:myplants/screens/plant/WeekDayButton.dart';
import 'package:myplants/themes/ColorThemes.dart';

class PlantScreen extends StatefulWidget {
  final Plant plant;

  const PlantScreen({super.key, required this.plant});

  @override
  State<PlantScreen> createState() => _PlantScreenState(plant: plant);
}

class _PlantScreenState extends State<PlantScreen> {
  final Plant plant;
  bool rememberWater = false;

  _PlantScreenState({required this.plant});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);

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
                        child: const Icon(Icons.home_outlined,
                            color: ColorThemes.dark, size: 25)),
                    Text(
                      'Informações de ${plant.especie}',
                      style: const TextStyle(
                          color: ColorThemes.light,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    const IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: deletePlant,
                      icon: Icon(Icons.delete,
                          color: ColorThemes.darkGrey, size: 25),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: media.size.width * 0.5,
                width: media.size.width * 0.5,
                margin: const EdgeInsets.only(top: 30, bottom: 15),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                        image: AssetImage(plant.photoPath), fit: BoxFit.cover),
                    color: ColorThemes.grey),
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(6),
                    margin: const EdgeInsets.only(left: 16),
                    decoration: const BoxDecoration(
                        color: ColorThemes.lightGreen,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Text(
                      plant.especie,
                      style: const TextStyle(
                          color: ColorThemes.dark,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  )),
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: const IconButton(
                        onPressed: editPlant,
                        icon: Icon(
                          Icons.edit_note_outlined,
                          color: ColorThemes.dark,
                        )),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 6, 0, 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  plant.category,
                  style: const TextStyle(
                      fontSize: 16,
                      color: ColorThemes.dark,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(30),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: ColorThemes.darkGreen,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Quantidade de água',
                          style: TextStyle(
                              color: ColorThemes.light,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.water_drop,
                              color: Colors.lightBlue,
                            ),
                            Icon(
                              Icons.water_drop,
                              color: Colors.lightBlue,
                            ),
                            Icon(
                              Icons.water_drop,
                              color: ColorThemes.grey,
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Quantidade de sol',
                          style: TextStyle(
                              color: ColorThemes.light,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.sunny,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.sunny,
                              color: Colors.yellow,
                            ),
                            Icon(
                              Icons.sunny,
                              color: Colors.yellow,
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Lmebrar de regar',
                          style: TextStyle(
                              color: ColorThemes.light,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Switch(
                            value: rememberWater,
                            activeColor: ColorThemes.lightGreen,
                            onChanged: (bool value) {
                              setState(() {
                                rememberWater = value;
                              });
                            })
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: ColorThemes.grey,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            WeekDayButton(day: 'S'),
                            WeekDayButton(day: 'T'),
                            WeekDayButton(day: 'Q'),
                            WeekDayButton(day: 'Q'),
                            WeekDayButton(day: 'S'),
                            WeekDayButton(day: 'S'),
                            WeekDayButton(day: 'D'),
                          ]),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

void editPlant() {}

void back() {}

void deletePlant() {}
