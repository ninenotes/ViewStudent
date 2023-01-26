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

final String email;
  UserModel({
    required this.idStudent,
    required this.name,
    required this.yearStudent,
    required this.divition,
    required this.teacher,
    required this.urlPfile,
    required this.typeuser,
    required this.email
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
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      idStudent: map['idStudent'] as String,
      name: map['name'] as String,
      yearStudent: map['yearStudent'] as String,
      divition: map['divition'] as String,
      teacher: map['teacher'] as String,
      urlPfile: map['urlPfile'] as String,
      typeuser: map['typeuser'] as String,
      email: map['meail']as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
