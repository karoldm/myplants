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

  const Plant({
    required this.id,
    required this.especie,
    required this.category,
    required this.humidity,
    required this.sun,
    required this.photoPath,
    required this.rememberWater,
    required this.daysWater,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};

    map['id'] = id;
    map['especie'] = especie;
    map['category'] = especie;
    map['humidity'] = especie;
    map['sun'] = especie;
    map['photoPath'] = especie;
    map['rememberWater'] = especie;
    map['daysWater'] = daysWater.toString();

    return map;
  }
}
