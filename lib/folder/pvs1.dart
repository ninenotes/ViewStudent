import 'package:flutter/material.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_text.dart';

class ScorePVS1 extends StatelessWidget {
  const ScorePVS1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(title:ShowText(text: 'ปวส 1',textStyle: Myconstant().h2whiteStyle(),),),);
  }
}