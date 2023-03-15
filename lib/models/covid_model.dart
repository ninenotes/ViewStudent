import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CovidModel {
  final String name;
  final String id;
  final String date;
  CovidModel({
    required this.name,
    required this.id,
    required this.date,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'date': date,
    };
  }

  factory CovidModel.fromMap(Map<String, dynamic> map) {
    return CovidModel(
      name: (map['name'] ?? '') as String,
      id: (map['id'] ?? '') as String,
      date: (map['date'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CovidModel.fromJson(String source) => CovidModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
