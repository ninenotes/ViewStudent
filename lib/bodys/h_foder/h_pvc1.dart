import 'package:flutter/material.dart';

import '../../utility/my_constant.dart';
import '../../widgets/show_text.dart';

class h_pvc1 extends StatelessWidget {
  const h_pvc1({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: ShowText(
          text: 'ปว ช 1',
          textStyle: Myconstant().h2whiteStyle(),
        ),
      ),

    );
  }
}