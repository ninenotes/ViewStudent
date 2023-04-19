import 'package:flutter/material.dart';
import 'package:viewstudent/bodys/h_foder/h_5np1.dart';
import 'package:viewstudent/bodys/h_foder/score5np1.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_text.dart';

class TeacherScore_pvs2 extends StatelessWidget {
  const TeacherScore_pvs2({super.key});

  @override
  Widget build(BuildContext context) {
        var titless = <String>[
    'นักพัฒนาซอฟต์แวร์คอมพิวเตอร์ ',
    'เทคโนโลยีระบบโทรคมนาคม',
    'หุ่นยนต์และระบบอัตโนมัติ',
    'คอมพิวเตอร์ฮาร์ดแวร์',
    'อิเล็กทรอนิกส์อุตสาหกรรม',
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
        text: 'ผลการเรียน ปวส.2',
        textStyle: Myconstant().h2whiteStyle(),
      )),
      body: ListView.builder(
        itemCount: titless.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            print('you click index ===> $index');

            switch (index) {
              case 3:
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const History5np1(),
                //     ));

                break;
              case 4:
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const History5np1(),
                //     ));
                break;
              case 2:
              // Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const History5np1(),
              //       ));

              break;

              case 1:
              // Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const History5np1(),
              //       ));

              break;

               case 0:
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Score5np1(),
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