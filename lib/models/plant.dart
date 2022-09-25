enum Days { sunday, monday, tuesday, wednesday, thursday, friday, saturday }

class Plant {
  int? id;
  String especie;
  String category;
  int humidity;
  int sun;
  String photoPath;
  bool rememberWater;
  List<Days> daysWater;
  bool watered;

  Plant(
      {this.id,
      required this.especie,
      required this.category,
      required this.humidity,
      required this.sun,
      required this.photoPath,
      required this.rememberWater,
      required this.daysWater,
      required this.watered});

  Map<String, dynamic> toMap() {
    return {
      'especie': especie,
      'category': category,
      'humidity': humidity,
      'sun': sun,
      'photoPath': photoPath,
      'rememberWater': rememberWater,
      'daysWater': daysWater,
      'waterded': watered
    };
  }

  void setWatered(bool watered) {
    this.watered = watered;
  }

  static Plant fromMap(Map<String, dynamic> map) {
    return Plant(
        id: map['id'],
        especie: map['especie'],
        category: map['category'],
        humidity: map['humidity'],
        sun: map['sun'],
        photoPath: map['photoPath'],
        rememberWater: map['rememberWater'] == 1 ? true : false,
        daysWater: map['daysWater'],
        watered: map['watered'] == 1 ? true : false);
  }
}
