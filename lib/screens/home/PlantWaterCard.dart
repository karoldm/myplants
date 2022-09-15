import 'package:flutter/material.dart';

import '../../themes/ColorThemes.dart';

import '../../models/PlantWater.dart';

class PlantWaterCard extends StatefulWidget {
  PlantWater plant;
  final void Function(int, bool) callback;

  PlantWaterCard({super.key, required this.plant, required this.callback});

  @override
  State<StatefulWidget> createState() =>
      _PlantWaterCardState(plant: plant, callback: callback);
}

class _PlantWaterCardState extends State<PlantWaterCard> {
  PlantWater plant;
  final void Function(int, bool) callback;

  _PlantWaterCardState({required this.plant, required this.callback});

  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
            color: plant.watered ? ColorThemes.mediumGreen : ColorThemes.grey,
            boxShadow: [
              BoxShadow(
                color: ColorThemes.dark.withOpacity(0.5),
                blurRadius: 6,
                offset: const Offset(4, 4),
              )
            ],
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Row(
          children: [
            Image.asset(
              plant.photoPath,
              width: 60,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(plant.especie,
                      style: const TextStyle(
                          color: ColorThemes.dark,
                          fontWeight: FontWeight.w400,
                          fontSize: 16)),
                  Text(plant.category,
                      style: const TextStyle(
                          color: ColorThemes.dark,
                          fontWeight: FontWeight.w200,
                          fontSize: 12))
                ],
              ),
            ),
            Transform.scale(
              scale: 1.25,
              child: Checkbox(
                  shape: const CircleBorder(),
                  checkColor: ColorThemes.light,
                  activeColor: ColorThemes.darkGreen,
                  value: plant.watered,
                  onChanged: (bool? value) {
                    plant.setWatered(value!);
                    callback(plant.id!, value);
                  }),
            )
          ],
        ));
  }
}
