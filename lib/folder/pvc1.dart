import 'package:flutter/material.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_text.dart';

class ScorePCV1 extends StatelessWidget {
  const ScorePCV1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShowText(text: 'ปวช 1',textStyle:Myconstant().h2whiteStyle() ,),
      ),
    );
  }
}
