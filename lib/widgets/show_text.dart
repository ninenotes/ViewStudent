// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:viewstudent/utility/my_constant.dart';

class ShowText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  const ShowText({
    Key? key,
    required this.text,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: textStyle ?? Myconstant().h3Style(),);
  }
}

class ShowTexttitle extends StatelessWidget {
  final String text2;
  final TextStyle? textStyle;
  const ShowTexttitle({
    Key? key,
    required this.text2,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text2,style: textStyle ?? Myconstant().h44Style(),);
  }
}