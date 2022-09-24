import 'package:flutter/material.dart';

import '../../themes/FontThemes.dart';
import '../../themes/ColorThemes.dart';

import '../../models/PlantWater.dart';

import 'NewPlantDialog.dart';
import 'PlantWaterCard.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> plantsWater = [
    PlantWater(
      watered: false,
      id: 0,
      especie: 'rosa branca',
      category: 'rosas',
      photoPath: 'assets/images/defaultPlantImage.png',
    ),
    PlantWater(
        watered: true,
        id: 1,
        especie: 'rosa vermelha',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png'),
    PlantWater(
        watered: false,
        id: 2,
        especie: 'rosa azul',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png'),
    PlantWater(
        watered: false,
        id: 3,
        especie: 'rosa amarela',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png'),
    PlantWater(
        watered: false,
        id: 4,
        especie: 'rosa amarela',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png'),
    PlantWater(
        watered: false,
        id: 5,
        especie: 'rosa amarela',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png'),
    PlantWater(
        watered: false,
        id: 6,
        especie: 'rosa amarela',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png'),
    PlantWater(
        watered: false,
        id: 7,
        especie: 'rosa amarela',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png'),
    PlantWater(
        watered: false,
        id: 8,
        especie: 'rosa amarela',
        category: 'rosas',
        photoPath: 'assets/images/defaultPlantImage.png'),
  ];

  List<PlantWater> plantsWaterToDisplay = [];
  List<PlantWater> plantsWateredToDisplay = [];

  @override
  void initState() {
    //plantas ainda nao regadas
    for (PlantWater p in plantsWater) {
      if (!p.watered) {
        plantsWaterToDisplay.add(p);
      }
    }
    //plantas ja regadas
    for (PlantWater p in plantsWater) {
      if (p.watered) {
        plantsWateredToDisplay.add(p);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);

    void reorderList(int id, bool checked) {
      setState(() {
        PlantWater pChecked;

        //inserindo planta regada no final
        if (checked) {
          pChecked = plantsWaterToDisplay.firstWhere((p) => p.id == id);
          plantsWaterToDisplay.removeWhere((p) => p.id == id);
          plantsWateredToDisplay.add(pChecked);
        }

        //inserindo planta não regada no inicio
        else {
          pChecked = plantsWateredToDisplay.firstWhere((p) => p.id == id);
          plantsWateredToDisplay.removeWhere((p) => p.id == id);
          plantsWaterToDisplay.add(pChecked);
        }
      });
    }

    return Scaffold(
        appBar: AppBar(
            backgroundColor: ColorThemes.darkGreen,
            elevation: 0,
            title: Image.asset(
              'assets/images/logo.png',
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(14),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: ColorThemes.grey),
                    onPressed: myPlants,
                    child: const Text('Minhas Plantas',
                        style: TextStyle(
                            color: ColorThemes.dark,
                            fontFamily: FontThemes.primary,
                            fontWeight: FontWeight.w400))),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: ColorThemes.grey),
                    onPressed: () => showNewPlantDialog(context),
                    child: const Icon(
                      Icons.add,
                      color: ColorThemes.dark,
                      size: 20,
                    )),
              )
            ]),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    width: media.size.width,
                    decoration: const BoxDecoration(
                        color: ColorThemes.lightGreen,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: const Text('Regar Hoje',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: ColorThemes.dark,
                            fontWeight: FontWeight.w400,
                            fontSize: 16)),
                  );
                },
                childCount: 1,
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              return PlantWaterCard(
                  plant: plantsWaterToDisplay[index],
                  callback: reorderList,
                  key: UniqueKey());
            }, childCount: plantsWaterToDisplay.length)),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              if (index == 0) return const SizedBox(height: 50);
              return PlantWaterCard(
                  plant: plantsWateredToDisplay[index - 1],
                  callback: reorderList,
                  key: UniqueKey());
            }, childCount: plantsWateredToDisplay.length + 1))
          ],
        ));
  }
}

void myPlants() {}
