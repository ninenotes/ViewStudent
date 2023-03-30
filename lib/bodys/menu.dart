import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viewstudent/bodys/COVID_19.dart';
import 'package:viewstudent/bodys/acadmic_results.dart';
import 'package:viewstudent/bodys/check_status.dart';

import 'package:viewstudent/folder/table5np1.dart';
import 'package:viewstudent/timetablelayer/tbpvc1.dart';
import 'package:viewstudent/timetablelayer/tbpvc2.dart';
import 'package:viewstudent/timetablelayer/tbpvc3.dart';
import 'package:viewstudent/timetablelayer/tbpvs1.dart';

import 'package:viewstudent/utility/app_controller.dart';

import 'package:viewstudent/widgets/show_text.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var titles = <String>[
   
    'ผลการเรียน',
    // 'สถานะตรวจสภาพ',
    'ตรางเรียน',
    'สถานะโควิด',
    'ออกจากระบบ',
  ];
  var iconDatas = <IconData>[

    Icons.school,
    // Icons.check_box,
    Icons.table_chart,
    Icons.vaccines,
    Icons.exit_to_app
  ];

  var titless = <String>[
    'ปวส 2',
    'ปวส 1',
    'ปวช 3',
    'ปวช 2',
    'ปวช 1',
  ];
  @override
  Widget build(BuildContext context) {
   
    return GetX(init: AppController(),
      builder: (AppController appController) {
         print('userModel ---> ${appController.userModels.length}');
        return ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              print('you click index ===> $index');

              switch (index) {
                case 3:
                  processSingOut();

                  break;
                case 2:
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
                        builder: (context) => const ResultsStuden(),
                      ));
                  break;
                // case 1:
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => const CheckStuden()));
                //   break;
                case 1:

                String yearsStudent = appController.userModels.last.yearStudent;

                print('yearStuden ---> $yearsStudent');


                switch (yearsStudent) {
              case 'ปวช.2':
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TbPVC2(),
                    ));

                break;
              case 'ปวช.1':
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TbPVC1(),
                    ));
                break;
              case 'ปวช.3':
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TbPVC3(),
                    ));

              break;

              case 'ปวส.1':
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TbPVS1(),
                    ));

              break;

               case 'ปวส.2':
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Table5np1(),
                    ));

              break;

              default:
            }














                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const TableSuten(),
                  //     ));
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
    );
  }

 Future<void> processSingOut() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('ต้องการออกจากระบบ ?'),
        content: const Text('กรุณายืนยัน'),
        actions: [
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut().then((value) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              });
            },
            child: const Text('ออกจากระบบ',style: TextStyle(color: Color(0xffF02E65))),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('ยกเลิก',
                ),
          ),
        ],
      ),
    );
  }
}
