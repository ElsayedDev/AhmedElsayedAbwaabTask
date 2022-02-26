import 'dart:convert';

import '../models.dart';

class UserModel {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final Address? address;
  final String? phone;
  final String? website;
  final Company? company;

  UserModel(this.id, this.name, this.username, this.email, this.address,
      this.phone, this.website, this.company);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'address': address?.toMap(),
      'phone': phone,
      'website': website,
      'company': company?.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['id']?.toInt(),
      map['name'],
      map['username'],
      map['email'],
      map['address'] != null ? Address.fromMap(map['address']) : null,
      map['phone'],
      map['website'],
      map['company'] != null ? Company.fromMap(map['company']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
