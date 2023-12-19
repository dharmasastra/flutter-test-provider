class Person {
  String name;
  int cityId;
  int point;

  Person({required this.name, required this.cityId, required this.point});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'city_id': cityId,
      'point': point
    };
  }
}

class TopPerson {
  int id;
  String name;
  String cityName;
  String point;

  TopPerson({required this.name, required this.cityName, required this.point, required this.id});

  factory TopPerson.fromJson(Map<String, dynamic> json) {
    return TopPerson(
      id: json['city_id'],
      name: json['person_name'],
      cityName: json['city_name'],
      point: json['point'],
    );
  }
}