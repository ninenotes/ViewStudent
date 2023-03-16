import 'package:flutter/material.dart';
import 'package:viewstudent/bodys/search.dart';
import 'package:viewstudent/widgets/show_text.dart';

class SearchTeacher extends StatelessWidget {
  const SearchTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Search(),
    );
  }
}
