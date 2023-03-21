import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final Widget content;
  final String title;
  final void Function()? onPressed;
  const ConfirmDialog({
    super.key,
    required this.content,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('ยกเลิก'),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text('ตกลง'),
        ),
      ],
    );
  }
}
