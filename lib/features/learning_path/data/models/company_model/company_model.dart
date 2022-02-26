import 'dart:convert';

class Company {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  Company(this.name, this.catchPhrase, this.bs);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      map['name'],
      map['catchPhrase'],
      map['bs'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source));
}
