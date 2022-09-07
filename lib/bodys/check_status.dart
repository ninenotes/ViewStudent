import 'package:flutter/material.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_text.dart';

class CheckStuden extends StatelessWidget {
  const CheckStuden({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: ShowText(text: 'สถานะตรวจสะภาพ',textStyle: Myconstant().h2whiteStyle(),),),);
  }
}