import 'package:flutter/material.dart';
import 'package:viewstudent/bodys/menu.dart';
import 'package:viewstudent/bodys/profile.dart';
import 'package:viewstudent/bodys/search.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_text.dart';

class AppServiceStudent extends StatefulWidget {
  const AppServiceStudent({super.key});

  @override
  State<AppServiceStudent> createState() => _AppServiceStudentState();
}

class _AppServiceStudentState extends State<AppServiceStudent> {
  int indexBody = 1;
  var titles = <String>[
    'Porfile',
    'Menu',
    'Search',
  ];
  var widgets = <Widget>[
    const Profile(),
    const Menu(),
    const Search(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle:  true,
        title: ShowText(
          text: titles[indexBody],
          textStyle: Myconstant().h2whiteStyle(),
        ),
      ),
    );
  }
}
