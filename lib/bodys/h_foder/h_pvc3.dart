import 'package:flutter/material.dart';

import '../../utility/my_constant.dart';
import '../../widgets/show_text.dart';

class h_pvc3 extends StatelessWidget {
  const h_pvc3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShowText(
          text: 'ปวช 3',
          textStyle: Myconstant().h2whiteStyle(),
        ),
      ),

    );
  }
}