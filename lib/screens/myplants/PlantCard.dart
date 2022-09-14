import 'package:flutter/material.dart';

import '../../models/Plant.dart';
import '../../themes/ColorThemes.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;

  const PlantCard({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => toPlant(plant),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: ColorThemes.darkGreen,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: ColorThemes.dark.withOpacity(0.5),
                blurRadius: 6,
                offset: const Offset(4, 4), // changes position of shadow
              ),
            ],
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorThemes.grey, width: 3),
                      image: DecorationImage(
                          image: AssetImage(plant.photoPath),
                          fit: BoxFit.cover),
                      color: ColorThemes.grey,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100))),
                )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 8),
                    child: Text(
                      plant.especie,
                      style: const TextStyle(
                          fontSize: 16,
                          color: ColorThemes.light,
                          fontWeight: FontWeight.w400),
                    )),
                Text(
                  plant.category,
                  style: const TextStyle(
                      fontSize: 12,
                      color: ColorThemes.light,
                      fontWeight: FontWeight.w400),
                )
              ]),
        ));
  }
}

void toPlant(Plant plant) {
  print(plant.id.toString());
}
