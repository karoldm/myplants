import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'package:myplants/services/db_plants.dart';

import '../../models/Plant.dart';

import '../../themes/ColorThemes.dart';

void showEditPlantDialog(
    BuildContext context, Plant plant, VoidCallback callback) {
  TextEditingController especieController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  String image = plant.photoPath;

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
                    title: Text('Editar ${plant.especie}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
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
                                          fit: BoxFit.cover,
                                          opacity: 0.2)
                                      : DecorationImage(
                                          image: FileImage(File(image)),
                                          fit: BoxFit.cover,
                                          opacity: 0.2)),
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
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                hintText: plant.especie,
                                hintStyle: const TextStyle(fontSize: 16),
                                border: const OutlineInputBorder(),
                                focusColor: ColorThemes.dark),
                            controller: especieController,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            style: const TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                hintText: plant.category,
                                hintStyle: const TextStyle(fontSize: 16),
                                border: const OutlineInputBorder(),
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
                                  onPressed: () {
                                    setState(() {
                                      plant.especie =
                                          especieController.text.isEmpty
                                              ? plant.especie
                                              : especieController.text;
                                      plant.category =
                                          categoryController.text.isEmpty
                                              ? plant.category
                                              : categoryController.text;
                                      plant.photoPath = image;
                                    });
                                    callback();
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
