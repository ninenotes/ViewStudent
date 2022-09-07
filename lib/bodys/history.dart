import 'package:flutter/material.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_text.dart';

class HistoryStuden extends StatelessWidget {
  const HistoryStuden({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShowText(
          text: 'ประวัตินักศึกษา',
          textStyle: Myconstant().h2whiteStyle(),
        ),
      ),
    );
  }
}
