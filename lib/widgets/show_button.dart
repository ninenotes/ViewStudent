// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:viewstudent/utility/my_constant.dart';

import 'package:viewstudent/widgets/show_text.dart';

class ShowButton extends StatelessWidget {
  final String lable;
  final Function() pressFunc;
  final Color? colorPriamry;
  const ShowButton({
    Key? key,
    required this.lable,
    required this.pressFunc,
    this.colorPriamry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          ElevatedButton.styleFrom(primary: colorPriamry ?? Myconstant.primary),
      onPressed: pressFunc,
      child: ShowText(
        text: lable,
        textStyle: colorPriamry == null
            ? Myconstant().h2whiteStyle()
            : Myconstant().h2redStyle(),
      ),
    );
  }
}
