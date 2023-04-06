// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {


final String idStudent;
final String name;
final String yearStudent;
final String divition;
final String  teacher;
final String  urlPfile;
final String typeuser;
final double grade;
final String E30000_1204;
final String E30000_2003;
final String E30001_1001;
final String E30901_2003;
final String E30901_2005;
final String E30901_2007;
final String E30901_2008;
final String E30901_2202;
final String E30901_8502;
final String? email;
final String? phone;
final String? advisor;
final double avagrade;
  UserModel({
    required this.idStudent,
    required this.name,
    required this.yearStudent,
    required this.divition,
    required this.teacher,
    required this.urlPfile,
    required this.typeuser,
    required this.grade,
    required this.E30000_1204,
    required this.E30000_2003,
    required this.E30001_1001,
    required this.E30901_2003,
    required this.E30901_2005,
    required this.E30901_2007,
    required this.E30901_2008,
    required this.E30901_2202,
    required this.E30901_8502,
    this.email,
    this.phone,
    this.advisor,
      required  this.avagrade,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idStudent': idStudent,
      'name': name,
      'yearStudent': yearStudent,
      'divition': divition,
      'teacher': teacher,
      'urlPfile': urlPfile,
      'typeuser': typeuser,
      'grade': grade,
      'E30000_1204': E30000_1204,
      'E30000_2003': E30000_2003,
      'E30001_1001': E30001_1001,
      'E30901_2003': E30901_2003,
      'E30901_2005': E30901_2005,
      'E30901_2007': E30901_2007,
      'E30901_2008': E30901_2008,
      'E30901_2202': E30901_2202,
      'E30901_8502': E30901_8502,
      'email': email,
      'phone': phone,
      'advisor': advisor,
      'avagrade': avagrade,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      idStudent: (map['idStudent'] ?? '') as String,
      name: (map['name'] ?? '') as String,
      yearStudent: (map['yearStudent'] ?? '') as String,
      divition: (map['divition'] ?? '') as String,
      teacher: (map['teacher'] ?? '') as String,
      urlPfile: (map['urlPfile'] ?? '') as String,
      typeuser: (map['typeuser'] ?? '') as String,
      grade: (map['grade'] ?? 0.0) as double,
      E30000_1204: (map['E30000_1204'] ?? '') as String,
      E30000_2003: (map['E30000_2003'] ?? '') as String,
      E30001_1001: (map['E30001_1001'] ?? '') as String,
      E30901_2003: (map['E30901_2003'] ?? '') as String,
      E30901_2005: (map['E30901_2005'] ?? '') as String,
      E30901_2007: (map['E30901_2007'] ?? '') as String,
      E30901_2008: (map['E30901_2008'] ?? '') as String,
      E30901_2202: (map['E30901_2202'] ?? '') as String,
      E30901_8502: (map['E30901_8502'] ?? '') as String,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      advisor: map['advisor'] != null ? map['advisor'] as String : null,
      avagrade: (map['avagrade'] ?? 0.0) as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
