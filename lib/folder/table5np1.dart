import 'package:flutter/material.dart';
import 'package:viewstudent/widgets/show_text.dart';

import '../utility/my_constant.dart';

class Table5np1 extends StatelessWidget {
  const Table5np1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShowText(
          text: 'ตรางสอน 5นพ1',
          textStyle: Myconstant().h2whiteStyle(),
        ),
      ),
      body: ListView(
        children: [
          ShowText(
            text:
                '643090101\nเทคโนโลยีสารสนเทศ\tนักพัฒนาซอฟต์แวร์\n/1 ปวส.2 |2564',
            textStyle: Myconstant().h2Style(),
          ),
          Divider(
            color: Myconstant.dark,
            thickness: 1,
            indent: 2,
            endIndent: 1,
            height: 25,
          ),
          newContent(
              head: 'วัน',
              value1: 'เวลา',
              value2: 'รหัส\nชื่อวิชา',
              value3: 'ขื่อครูผู้สอน'),
          newContent(
              head: 'จันทร์',
              value1: '08.10\n10.10',
              value2: '30000-1609\nลีลาศเพื่อสุขภาพ',
              value3: 'นายปรเมษฐ์\nลูกเสือ'),
          newContent(
              head: 'จันทร์',
              value1: '10.10\n12.10',
              value2: '30901-2408\nการพัฒนาเว็บบนคอมพิวเตอร์พกพา',
              value3: 'นายบุญยรัตน์\nโทธนะ'),
          newContent(
              head: 'จันทร์',
              value1: '13.10\n18.10',
              value2: '30901-2108\nการพัฒนาเว็บแอปพิเคชันนคอมพิวเตอร์พกพา',
              value3: 'นายชนะรัตน์\nมาลัย'),
          Divider(
            color: Myconstant.pink,
            thickness: 1,
            indent: 2,
            endIndent: 1,
            height: 25,
          ),
          newContent2(
              head: 'อังคาร',
              value1: '08.10\n10.10',
              value2: '30901-2004\nระบบปฏิบัติการเครื่องแม่ข่าย',
              value3: 'นายสิทธิกร\nนาเจริญ'),
          newContent2(
              head: 'อังคาร',
              value1: '10.10\n12.10',
              value2: '30000-1404\nแคลคูลัส 1',
              value3: 'นางสาวปวารี\nหวลระลึก'),
          newContent2(
              head: 'อังคาร',
              value1: '13.10\n14.10',
              value2: '30001-1051\nกฏหมายทั่วไปเกี่ยวกัยงานอาชีพ',
              value3: 'นางสาวนงลักษณ์\nศรีเสวตร์'),
          newContent2(
              head: 'อังคาร',
              value1: '14.10\n17.10',
              value2: '30901-2408\nการพัฒนาเว็บบนคอมพิวเตอร์พกพา',
              value3: 'นายบุญยรัตน์\nโทธนะ'),
          Divider(
            color: Myconstant.green,
            thickness: 1,
            indent: 2,
            endIndent: 1,
            height: 25,
          ),
          newContent3(
              head: 'พุธ',
              value1: '08.10\n10.10',
              value2: '30000-2004\nกิจกรรมองค์การวิชาชีพ4',
              value3: 'นางสาวสุพิชญา\nเผ่าจินดา'),
          newContent3(
              head: 'พุธ',
              value1: '10.10\n13.10',
              value2: '30901-2004\nระบบปฏิบัตการเครื่องแม่ข่าย',
              value3: 'นายสิทธิกร\nนาเจริญ'),
          newContent3(
              head: 'พุธ',
              value1: '14.10\n16.10',
              value2: '30901-2104\nการพัฒนาโปรแกรมด้วยเทคโนโลยีดอตเน็ต',
              value3: 'นายบุญยรัตน์\nโทธนะ'),
               Divider(
            color: Myconstant.orange,
            thickness: 1,
            indent: 2,
            endIndent: 1,
            height: 25,
          ),
          newContent4(
              head: 'พฤหัส',
              value1: '08.10\n09.10',
              value2: '30000-1404\nแคลคูลัส 1',
              value3: 'นางสาวปวารี\nหวลระลึก'),
          newContent4(
              head: 'พฤหัส',
              value1: '09.10\n12.10',
              value2: '30901-2104\nการพัฒนาโปรแกรมด้วยเทคโนโลยีดอตเน็ต',
              value3: 'นายบุญยรัตน์\nโทธนะ'),
               Divider(
            color: Myconstant.skyblue,
            thickness: 1,
            indent: 2,
            endIndent: 1,
            height: 25,
          ),
              newContent5(head: 'ศุกร์', value1: '08.10\n10.10', value2: '30901-8503\nโครงงาน 2', value3: 'นางสาวสุพิชญา\nเผ่าจินดา'),
              newContent5(head: 'ศุกร์', value1: '10.10\n12.10', value2: '30901-2122\nการเขียนโปรแกรมด้วย ภาษา Python', value3: 'นางสาวธัญญ\nธร ผิวผ่อง'),
              newContent5(head: 'ศุกร์', value1: '13.10\n16.10', value2: '30901-2122\nการเขียนโปรแกรมด้วย ภาษา Python', value3: 'นางสาวธัญญ\nธร ผิวผ่อง'),

        ],
      ),
    );
  }

  Column newContent(
      {required String head,
      required String value1,
      required String value2,
      required String value3}) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: ShowText(
                text: head,
                textStyle: Myconstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowText(
                text: value1,
                textStyle: Myconstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowText(
                text: value2,
                textStyle: Myconstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowText(
                text: value3,
                textStyle: Myconstant().h2Style(),
              ),
            ),
          ],
        ),
        Divider(
          color: Myconstant.yellOW,
          thickness: 1,
          indent: 2,
          endIndent: 1,
          height: 25,
        ),
        //เส้นบรรทีด// Divider(color: Myconstant.dark,thickness: 1,),
      ],
    );
  }

  Column newContent2(
      {required String head,
      required String value1,
      required String value2,
      required String value3}) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: ShowText(
                text: head,
                textStyle: Myconstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowText(
                text: value1,
                textStyle: Myconstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowText(
                text: value2,
                textStyle: Myconstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowText(
                text: value3,
                textStyle: Myconstant().h2Style(),
              ),
            ),
          ],
        ),
        Divider(
          color: Myconstant.pink,
          thickness: 1,
          indent: 2,
          endIndent: 1,
          height: 25,
        ),
        //เส้นบรรทีด// Divider(color: Myconstant.dark,thickness: 1,),
      ],
    );
  }

  Column newContent3(
      {required String head,
      required String value1,
      required String value2,
      required String value3}) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: ShowText(
                text: head,
                textStyle: Myconstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowText(
                text: value1,
                textStyle: Myconstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowText(
                text: value2,
                textStyle: Myconstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowText(
                text: value3,
                textStyle: Myconstant().h2Style(),
              ),
            ),
          ],
        ),
        Divider(
          color: Myconstant.green,
          thickness: 1,
          indent: 2,
          endIndent: 1,
          height: 25,
        ),
        //เส้นบรรทีด// Divider(color: Myconstant.dark,thickness: 1,),
      ],
    );
  }

  Column newContent4(
      {required String head,
      required String value1,
      required String value2,
      required String value3}) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: ShowText(
                text: head,
                textStyle: Myconstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowText(
                text: value1,
                textStyle: Myconstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowText(
                text: value2,
                textStyle: Myconstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowText(
                text: value3,
                textStyle: Myconstant().h2Style(),
              ),
            ),
          ],
        ),
        Divider(
          color: Myconstant.orange,
          thickness: 1,
          indent: 2,
          endIndent: 1,
          height: 25,
        ),
        //เส้นบรรทีด// Divider(color: Myconstant.dark,thickness: 1,),
      ],
    );
  }
   Column newContent5(
      {required String head,
      required String value1,
      required String value2,
      required String value3}) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: ShowText(
                text: head,
                textStyle: Myconstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowText(
                text: value1,
                textStyle: Myconstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowText(
                text: value2,
                textStyle: Myconstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 1,
              child: ShowText(
                text: value3,
                textStyle: Myconstant().h2Style(),
              ),
            ),
          ],
        ),
        Divider(
          color: Myconstant.skyblue,
          thickness: 1,
          indent: 2,
          endIndent: 1,
          height: 25,
        ),
        //เส้นบรรทีด// Divider(color: Myconstant.dark,thickness: 1,),
      ],
    );
}
}