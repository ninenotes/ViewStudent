// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {

  final String uidPost;
  final String namePost;
  final String urlPost;
  final String post;
  final Timestamp timestamp;
  final String? urlImage;
  PostModel({
    required this.uidPost,
    required this.namePost,
    required this.urlPost,
    required this.post,
    required this.timestamp,
    this.urlImage,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uidPost': uidPost,
      'namePost': namePost,
      'urlPost': urlPost,
      'post': post,
      'timestamp': timestamp,
      'urlImage': urlImage,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      uidPost: (map['uidPost'] ?? '') as String,
      namePost: (map['namePost'] ?? '') as String,
      urlPost: (map['urlPost'] ?? '') as String,
      post: (map['post'] ?? '') as String,
      timestamp: (map['timestamp']),
      urlImage: map['urlImage'] ?? '',
    );
  }

  //  timestamp: (map['timestamp']),

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) => PostModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
