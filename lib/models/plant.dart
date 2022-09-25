enum Days { sunday, monday, tuesday, wednesday, thursday, friday, saturday }

class Plant {
  final int? id;
  final String especie;
  final String category;
  final int humidity;
  final int sun;
  final String photoPath;
  final bool rememberWater;
  final List<Days> daysWater;
  bool watered;

  Plant(
      {required this.id,
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
      'id': id,
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
