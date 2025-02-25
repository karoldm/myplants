import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:myplants/models/Plant.dart';
import 'package:myplants/services/db_plants.dart';

import '../../themes/ColorThemes.dart';

Future<void> showNewPlantDialog(
    BuildContext context, VoidCallback callback) async {
  TextEditingController especieController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  String image = 'assets/images/defaultPlantImage.png';

  ImagePicker picker = ImagePicker();

  MediaQueryData media = MediaQuery.of(context);

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (context, setState) => SingleChildScrollView(
                  child: AlertDialog(
                    titlePadding:
                        const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
                    actionsPadding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
                    actionsAlignment: MainAxisAlignment.center,
                    title: const Text('Adicione uma nova planta à sua coleção',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorThemes.dark,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                    actions: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                              height: media.size.width * 0.5,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  color: ColorThemes.grey,
                                  image: image ==
                                          'assets/images/defaultPlantImage.png'
                                      ? DecorationImage(
                                          image: AssetImage(image),
                                          opacity: 0.2,
                                          fit: BoxFit.cover)
                                      : DecorationImage(
                                          image: FileImage(File(image)),
                                          opacity: 0.2,
                                          fit: BoxFit.cover)),
                              child: IconButton(
                                  onPressed: () async {
                                    XFile? imagePicked = await picker.pickImage(
                                        source: ImageSource.gallery,
                                        imageQuality: 50,
                                        preferredCameraDevice:
                                            CameraDevice.front);
                                    setState(() {
                                      image = imagePicked!.path;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add_rounded,
                                    color:
                                        ColorThemes.darkGrey.withOpacity(0.8),
                                    size: media.size.width * 0.5,
                                  ))),
                          const SizedBox(
                            height: 25,
                          ),
                          TextField(
                            style: const TextStyle(fontSize: 16),
                            decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 10, 0),
                                hintText: 'especie',
                                hintStyle: TextStyle(fontSize: 16),
                                border: OutlineInputBorder(),
                                focusColor: ColorThemes.dark),
                            controller: especieController,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: const TextStyle(fontSize: 16),
                            decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 10, 0),
                                hintText: 'categoria',
                                hintStyle: TextStyle(fontSize: 16),
                                border: OutlineInputBorder(),
                                focusColor: ColorThemes.dark),
                            controller: categoryController,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
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
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (especieController.text.isEmpty ||
                                        categoryController.text.isEmpty) {
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          title: const Text('Campos vazios'),
                                          content: const Text(
                                              'Por favor preencha todos os campos para continuar!'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      Plant plant = Plant(
                                          especie: especieController.text,
                                          category: categoryController.text,
                                          humidity: 1,
                                          sun: 1,
                                          photoPath: image,
                                          rememberWater: false,
                                          daysWater: [],
                                          watered: false);
                                      int id = await DB_plants.insert(plant);
                                      plant.id = id;
                                      callback();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: ColorThemes.mediumGreen,
                                      elevation: 0,
                                      shape: const StadiumBorder()),
                                  child: const Text(
                                    'Salvar',
                                    style: TextStyle(
                                        color: ColorThemes.light,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ));
      });
}
