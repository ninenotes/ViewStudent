import 'package:flutter/material.dart';
import 'package:viewstudent/timetablelayer/tbpvc1.dart';
import 'package:viewstudent/timetablelayer/tbpvc2.dart';
import 'package:viewstudent/timetablelayer/tbpvc3.dart';
import 'package:viewstudent/timetablelayer/tbpvs2.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_text.dart';

class TeacherTable_pvs2 extends StatelessWidget {
  const TeacherTable_pvs2({super.key});

  @override
  Widget build(BuildContext context) {
      var titless = <String>[
    '5นพ1',
    '5ทท1',
    '5มค1',
    '5ฮว1',
    '5ออ1',
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
        text: 'ประวัติ ปวส 2',
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
                      builder: (context) => const TbPVC2(),
                    ));

                break;
              case 4:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TbPVC2(),
                    ));
                break;
              case 2:
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TbPVC3(),
                    ));

              break;

              case 1:
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TbPVC1(),
                    ));

              break;

               case 0:
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TbPVS2(),
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