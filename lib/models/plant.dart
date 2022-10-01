class Plant {
  int? id;
  String especie;
  String category;
  int humidity;
  int sun;
  String photoPath;
  bool rememberWater;
  List<String> daysWater;
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
      'rememberWater': rememberWater ? 1 : 0,
      'daysWater': daysWater.join(' '),
      'watered': watered ? 1 : 0,
    };
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
        daysWater: map['daysWater'].split(' '),
        watered: map['watered'] == 1 ? true : false);
  }
}
