import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Model5np1 {
final String address;
  final String date;
  final String idStudent;
  final String image;
  final String name;
  final String nameparent;
  final String nationality;
  final String phone;
  final String phone2;
  Model5np1({
    required this.address,
    required this.date,
    required this.idStudent,
    required this.image,
    required this.name,
    required this.nameparent,
    required this.nationality,
    required this.phone,
    required this.phone2,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'date': date,
      'idStudent': idStudent,
      'image': image,
      'name': name,
      'nameparent': nameparent,
      'nationality': nationality,
      'phone': phone,
      'phone2': phone2,
    };
  }

  factory Model5np1.fromMap(Map<String, dynamic> map) {
    return Model5np1(
      address: (map['address'] ?? '') as String,
      date: (map['date'] ?? '') as String,
      idStudent: (map['idStudent'] ?? '') as String,
      image: (map['image'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      nameparent: (map['nameparent'] ?? '') as String,
      nationality: (map['nationality'] ?? '') as String,
      phone: (map['phone'] ?? '') as String,
      phone2: (map['phone2'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Model5np1.fromJson(String source) => Model5np1.fromMap(json.decode(source) as Map<String, dynamic>);
}
