import 'package:flutter/material.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_image.dart';
import 'package:viewstudent/widgets/show_table2TK1K1.dart';
import 'package:viewstudent/widgets/show_text.dart';

class TableSuten extends StatelessWidget {
  const TableSuten({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: ShowText(
        text: 'ตรางเรียน',
        textStyle: Myconstant().h2whiteStyle(),
      )),
      body: Column(
        children: [
          Card(
            margin:  EdgeInsets.all(8),
            elevation: 10,
            child: Column(
              children: [
                Container(
                  height: 300.0,
              
                  child: const ShowTable2TK(),
                ),
                Text(
                    'ภาคเรียนที่ 1/2565  ครูที่ปรึกษา นายชนะรัตน์ สุมาลัย รหัสกลุ่มเรียน ุ 6429012801 2ทค1ก1 '),
                Text('ตัวอย่าง'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
