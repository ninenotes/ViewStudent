import 'package:flutter/material.dart';
import 'package:viewstudent/bodys/check_foder/ch_pvc1.dart';
import 'package:viewstudent/bodys/check_foder/ch_pvs1.dart';
import 'package:viewstudent/bodys/check_foder/ch_pvs2.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../timetablelayer/tbpvc1.dart';
import '../timetablelayer/tbpvc2.dart';
import '../timetablelayer/tbpvc3.dart';
import '../timetablelayer/tbpvs1.dart';
import '../timetablelayer/tbpvs2.dart';
import 'check_foder/ch_pvc3.dart';

class CheckStuden extends StatelessWidget {
  const CheckStuden({super.key});

  @override
  Widget build(BuildContext context) {
   
     var titless = <String>[
    'ปวส 2',
    'ปวส 1',
    'ปวช 3',
    'ปวช 2',
    'ปวช 1',
  ];
  var iconDatass = <IconData>[
    Icons.folder_open,
    Icons.folder_open,
    Icons.folder_open,
    Icons.folder_open,
    Icons.folder_open,
  ];

    
    return Scaffold(
      appBar: AppBar(
          title: ShowText(
        text: 'สถานะตรวจสภาพc',
        textStyle: Myconstant().h2whiteStyle(),
      )),
      body: ListView.builder(
        itemCount: titless.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            print('you click index ===> $index');

            switch (index) {
              case 3:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ch_pvs2(),
                    ));

                break;
              case 4:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ch_pvc1(),
                    ));
                break;
              case 2:
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ch_pvc3(),
                    ));

              break;

              case 1:
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ch_pvs1(),
                    ));

              break;

               case 0:
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ch_pvs2(),
                    ));

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
                      iconDatass[index],
                      size: 36,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  ShowText(
                    text: titless[index],
                    textStyle: Myconstant().h2Style(),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey.shade700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
