import 'package:flutter/material.dart';
import 'package:myplants/services/db_plants.dart';

import '../../models/Plant.dart';

import '../../themes/ColorThemes.dart';

void showDeletePlantDialog(
    BuildContext context, Plant plant, VoidCallback callback) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
          actionsAlignment: MainAxisAlignment.center,
          title: Text('Tem certeza que deseja deletar ${plant.especie}?',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: ColorThemes.dark,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    DB_plants.delete(plant.id!);
                    callback();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorThemes.red,
                      elevation: 0,
                      shape: const StadiumBorder()),
                  child: const Text(
                    'Deletar',
                    style: TextStyle(
                        color: ColorThemes.light,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorThemes.darkGrey,
                      elevation: 0,
                      shape: const StadiumBorder()),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(
                        color: ColorThemes.light,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )
          ],
        );
      });
}
