import 'package:flutter/material.dart';
import 'package:viewstudent/timetablelayer/tbpvc1.dart';
import 'package:viewstudent/timetablelayer/tbpvc2.dart';
import 'package:viewstudent/timetablelayer/tbpvc3.dart';
import 'package:viewstudent/timetablelayer/tbpvs1.dart';
import 'package:viewstudent/timetablelayer/tbpvs2.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_image.dart';
import 'package:viewstudent/widgets/show_table2TK1K1.dart';
import 'package:viewstudent/widgets/show_text.dart';

import '../folder/pcs2.dart';
import '../folder/pvc1.dart';
import '../folder/pvc2.dart';
import '../folder/pvc3.dart';
import '../folder/pvs1.dart';

class TableSuten extends StatelessWidget {
  
  const TableSuten({super.key});
  

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
        text: 'ตรางเรียน',
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
                      builder: (context) => const TbPVC1(),
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
                      builder: (context) => const TbPVS1(),
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

