class PlantWater {
  bool watered;
  final int? id;
  final String especie;
  final String category;
  final String photoPath;

  PlantWater(
      {required this.watered,
      required this.id,
      required this.especie,
      required this.category,
      required this.photoPath});

  void setWatered(bool watered) {
    this.watered = watered;
  }
}
