import 'package:flutter/material.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_text.dart';

class TbPVC2 extends StatelessWidget {
  const TbPVC2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShowText(text: 'ปวช 2',textStyle:Myconstant().h2whiteStyle() ,),
      ),
    );
  }
}
