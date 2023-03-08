import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viewstudent/bodys/COVID_19.dart';
import 'package:viewstudent/bodys/acadmic_results.dart';
import 'package:viewstudent/bodys/check_status.dart';
import 'package:viewstudent/bodys/history.dart';
import 'package:viewstudent/bodys/time_table.dart';
import 'package:viewstudent/utility/my_dialog.dart';
import 'package:viewstudent/widgets/show_text.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var titles = <String>[
    'โพส',
    'ผลการเรียน',
    'สถานะตรวจสภาพ',
    'ตรางเรียน',
    'สถานะโควิด',
    'ออกจากระบบ',
  ];
  var iconDatas = <IconData>[
    Icons.history_edu,
    Icons.school,
    Icons.check_box,
    Icons.table_chart,
    Icons.vaccines,
    Icons.exit_to_app
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          print('you click index ===> $index');

          switch (index) {
            case 5:
              processSingOut();

              break;
            case 4:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const covid(),
                  ));

              break;

            case 0:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HistoryStuden(),
                  ));
              break;

            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResultsStuden(),
                  ));
              break;
            case 2:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const CheckStuden()));
              break;
            case 3:Navigator.push(context, MaterialPageRoute(builder: (context) => const TableSuten(),));
            break;
            default:
          }
        },
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    iconDatas[index],
                    size: 36,
                    color: Colors.grey.shade700,
                  ),
                ),
                ShowText(text: titles[index]),
              ],
            ),
            Divider(color: Colors.grey.shade700),
          ],
        ),
      ),
    );
  }

  Future<void> processSingOut() async {

    MyDialog(context: context).normalDialog(
      title: 'คุณต้องการออกจากระบบ ?',
      subTitle: 'Please Confirm SingOut',
      label: 'SingOut',
      pressFunc: () async {
        await FirebaseAuth.instance.signOut().then((value) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', (route) => false);
        });
      },
    );
  }
}
