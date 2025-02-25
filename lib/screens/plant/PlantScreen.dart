import 'dart:io';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:myplants/services/db_plants.dart';

import 'package:myplants/themes/ColorThemes.dart';

import 'package:myplants/models/Plant.dart';

import 'WeekDayButton.dart';
import 'DeletePlantDialog.dart';
import 'EditPlantDialog.dart';

class PlantScreen extends StatefulWidget {
  final Plant plant;

  const PlantScreen({super.key, required this.plant});

  @override
  State<PlantScreen> createState() => _PlantScreenState(plant: plant);
}

class _PlantScreenState extends State<PlantScreen> {
  Plant plant;
  bool rememberWater = false;

  _PlantScreenState({required this.plant});

  void updateDays(String day) {
    if (plant.daysWater.contains(day)) {
      plant.daysWater.removeWhere((element) => element == day);
    } else {
      plant.daysWater.add(day);
    }

    DB_plants.edit(Plant(
        id: plant.id,
        especie: plant.especie,
        category: plant.category,
        humidity: plant.humidity,
        sun: plant.sun,
        photoPath: plant.photoPath,
        rememberWater: plant.rememberWater,
        daysWater: plant.daysWater,
        watered: plant.watered));
  }

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
                padding: const EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: ColorThemes.grey),
                        onPressed: () => Navigator.pushReplacementNamed(
                            context, '/myPlants'),
                        child: const Icon(Icons.arrow_back,
                            color: ColorThemes.dark, size: 25)),
                    const Text(
                      'Informações da planta',
                      style: TextStyle(
                          color: ColorThemes.light,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () =>
                          showDeletePlantDialog(context, plant, () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/home', (route) => false);
                        setState(() => {});
                      }),
                      icon: const Icon(Icons.delete,
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
                    image:
                        plant.photoPath == 'assets/images/defaultPlantImage.png'
                            ? DecorationImage(
                                image: AssetImage(plant.photoPath),
                                fit: BoxFit.cover)
                            : DecorationImage(
                                image: FileImage(File(plant.photoPath)),
                                fit: BoxFit.cover),
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
                    child: IconButton(
                        onPressed: () =>
                            showEditPlantDialog(context, plant, () {
                              Navigator.pop(context);
                              DB_plants.edit(plant);
                              setState(() {});
                            }),
                        icon: const Icon(
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
                        RatingBar.builder(
                          initialRating: plant.humidity / 1.0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 3,
                          itemSize: 25,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, __) => const Icon(
                            Icons.water_drop,
                            color: Colors.blue,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              plant.humidity = rating.toInt();
                            });
                            DB_plants.edit(Plant(
                                id: plant.id,
                                especie: plant.especie,
                                category: plant.category,
                                humidity: plant.humidity,
                                sun: plant.sun,
                                photoPath: plant.photoPath,
                                rememberWater: plant.rememberWater,
                                daysWater: plant.daysWater,
                                watered: plant.watered));
                          },
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
                        RatingBar.builder(
                          initialRating: plant.sun / 1.0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 3,
                          itemSize: 25,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.sunny,
                            color: Colors.yellow,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              plant.sun = rating.toInt();
                            });
                            DB_plants.edit(Plant(
                                id: plant.id,
                                especie: plant.especie,
                                category: plant.category,
                                humidity: plant.humidity,
                                sun: plant.sun,
                                photoPath: plant.photoPath,
                                rememberWater: plant.rememberWater,
                                daysWater: plant.daysWater,
                                watered: plant.watered));
                          },
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
                          'Lembrar de regar',
                          style: TextStyle(
                              color: ColorThemes.light,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Switch(
                            value: plant.rememberWater,
                            activeColor: ColorThemes.lightGreen,
                            onChanged: (bool value) {
                              setState(() {
                                plant.rememberWater = value;
                              });

                              DB_plants.edit(Plant(
                                  id: plant.id,
                                  especie: plant.especie,
                                  category: plant.category,
                                  humidity: plant.humidity,
                                  sun: plant.sun,
                                  photoPath: plant.photoPath,
                                  rememberWater: plant.rememberWater,
                                  daysWater: plant.daysWater,
                                  watered: plant.watered));
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
                          children: [
                            WeekDayButton(
                              day: 'S',
                              callback: () => updateDays('segunda'),
                              initialValue: plant.daysWater.contains('segunda'),
                            ),
                            WeekDayButton(
                              day: 'T',
                              callback: () => updateDays('terca'),
                              initialValue: plant.daysWater.contains('terca'),
                            ),
                            WeekDayButton(
                              day: 'Q',
                              callback: () => updateDays('quarta'),
                              initialValue: plant.daysWater.contains('quarta'),
                            ),
                            WeekDayButton(
                              day: 'Q',
                              callback: () => updateDays('quinta'),
                              initialValue: plant.daysWater.contains('quinta'),
                            ),
                            WeekDayButton(
                              day: 'S',
                              callback: () => updateDays('sexta'),
                              initialValue: plant.daysWater.contains('sexta'),
                            ),
                            WeekDayButton(
                              day: 'S',
                              callback: () => updateDays('sabado'),
                              initialValue: plant.daysWater.contains('sabado'),
                            ),
                            WeekDayButton(
                              day: 'D',
                              callback: () => updateDays('domingo'),
                              initialValue: plant.daysWater.contains('domingo'),
                            ),
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
