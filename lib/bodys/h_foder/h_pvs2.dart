import 'package:flutter/material.dart';

import '../../utility/my_constant.dart';
import '../../widgets/show_text.dart';

class h_pvs2 extends StatelessWidget {
  const h_pvs2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShowText(
          text: 'ปวส 2',
          textStyle: Myconstant().h2whiteStyle(),
        ),
      ),

    );
  }
}