import 'dart:convert';

class Geo {
  final String? lat;
  final String? lng;

  Geo(this.lat, this.lng);

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }

  factory Geo.fromMap(Map<String, dynamic> map) {
    return Geo(
      map['lat'],
      map['lng'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Geo.fromJson(String source) => Geo.fromMap(json.decode(source));
}
