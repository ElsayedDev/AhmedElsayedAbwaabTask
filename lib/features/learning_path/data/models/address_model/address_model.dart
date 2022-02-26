import 'dart:convert';

import '../models.dart';

class Address {
  final String? street;
  final String? suite;
  final String? city;
  final String? zipcode;
  final Geo? geo;

  Address(this.street, this.suite, this.city, this.zipcode, this.geo);

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo?.toMap(),
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      map['street'],
      map['suite'],
      map['city'],
      map['zipcode'],
      map['geo'] != null ? Geo.fromMap(map['geo']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source));
}
