import 'package:flutter/material.dart';
import 'package:viewstudent/bodys/h_foder/t_score_pvs2.dart';
import 'package:viewstudent/bodys/time_table.dart';
import 'package:viewstudent/folder/pvc1.dart';
import 'package:viewstudent/folder/pvc2.dart';
import 'package:viewstudent/folder/pvc3.dart';
import 'package:viewstudent/folder/pvs1.dart';
import 'package:viewstudent/folder/sumtable5np1.dart';
import 'package:viewstudent/folder/table5np1.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_text.dart';

class SumTable extends StatelessWidget {
  const SumTable({super.key});

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
        text: 'ตรางเรียน ',
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
                //       builder: (context) => const Table5np1(),
                //     ));

                break;
              case 4:
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const Table5np1(),
                //     ));
                break;
              case 2:
              // Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const Table5np1(),
              //       ));

              break;

              case 1:
              // Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const Table5np1(),
              //       ));

              break;

               case 0:
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SumTable5np1(),
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