import 'package:flutter/material.dart';

class ShowIconButton extends StatelessWidget {
  final IconData iconData;
  final Function() pressFunc;
  const ShowIconButton({
    super.key,
    required this.iconData,
    required this.pressFunc,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: pressFunc, icon: Icon(iconData));
  }
}
