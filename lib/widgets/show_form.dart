// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:viewstudent/utility/my_constant.dart';

class ShowForm extends StatelessWidget {
  final String hint;
  final IconData? iconData;
  final Function(String) changeFunc;
  final bool? obsecu;
  final TextInputType? textInputType;

final TextEditingController? textEditingController;

  const ShowForm({
    Key? key,
    required this.hint,
    this.iconData,
    required this.changeFunc,
    this.obsecu,
    this.textInputType,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 47,
      width: 260,
      child: TextFormField(controller: textEditingController,
        keyboardType: textInputType ?? TextInputType.text,
        obscureText: obsecu ?? false,
        onChanged: changeFunc,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon:  iconData == null ?  null : Icon(
            iconData,
            color: Myconstant.dark,
          ),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
