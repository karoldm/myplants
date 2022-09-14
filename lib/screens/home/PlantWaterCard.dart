import 'package:flutter/material.dart';

import '../../themes/ColorThemes.dart';

import '../../models/PlantWater.dart';

class PlantWaterCard extends StatefulWidget {
  PlantWater plant;

  PlantWaterCard({super.key, required this.plant});

  @override
  State<StatefulWidget> createState() => PlantWaterCardState(plant: plant);
}

class PlantWaterCardState extends State<PlantWaterCard> {
  PlantWater plant;

  PlantWaterCardState({required this.plant});

  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: plant.watered
            ? const BoxDecoration(
                color: ColorThemes.mediumGreen,
                borderRadius: BorderRadius.all(Radius.circular(8)))
            : const BoxDecoration(
                color: ColorThemes.gray,
                borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Row(
          children: [
            Image.asset(
              plant.photoPath,
              width: 60,
            ),
            Column(
              children: [
                Text(plant.especie,
                    style: const TextStyle(
                        color: ColorThemes.dark,
                        fontWeight: FontWeight.w400,
                        fontSize: 14)),
                Text(plant.category,
                    style: const TextStyle(
                        color: ColorThemes.dark,
                        fontWeight: FontWeight.w200,
                        fontSize: 8))
              ],
            ),
            Checkbox(
                value: plant.watered,
                onChanged: (bool? value) {
                  setState(() {
                    plant.setWatered(value!);
                  });
                  //mudar lista de plantas regadas no banco
                }),
          ],
        ));
  }
}
