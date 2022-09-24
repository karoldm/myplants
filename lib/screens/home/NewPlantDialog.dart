import 'package:flutter/material.dart';

import '../../themes/ColorThemes.dart';

void showNewPlantDialog(BuildContext context) {
  TextEditingController _especieController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();

  MediaQueryData media = MediaQuery.of(context);

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
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
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: ColorThemes.grey,
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/defaultPlantImage.png'),
                              opacity: 0.2,
                              fit: BoxFit.cover)),
                      child: IconButton(
                          onPressed: () {
                            print('image pressed');
                          },
                          icon: Icon(
                            Icons.add_rounded,
                            color: ColorThemes.darkGrey.withOpacity(0.8),
                            size: media.size.width * 0.5,
                          ))),
                  const SizedBox(
                    height: 25,
                  ),
                  TextField(
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          hintText: 'espécie',
                          hintStyle: TextStyle(fontSize: 16),
                          border: OutlineInputBorder(),
                          focusColor: ColorThemes.dark),
                      controller: _especieController,
                      onChanged: (value) {
                        print(value);
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                      style: const TextStyle(fontSize: 16),
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          hintText: 'categoria',
                          hintStyle: TextStyle(fontSize: 16),
                          border: OutlineInputBorder(),
                          focusColor: ColorThemes.dark),
                      controller: _categoryController,
                      onChanged: (value) {
                        print(value);
                      }),
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
                          onPressed: () {},
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
        );
      });
}
