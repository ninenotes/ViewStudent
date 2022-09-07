import 'package:flutter/material.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_text.dart';

class ResultsStuden extends StatelessWidget {
  const ResultsStuden({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShowText(
          text: 'ผลการเรียน',
          textStyle: Myconstant().h2whiteStyle(),
        ),
      ),
    );
  }
}
