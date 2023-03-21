import 'package:flutter/material.dart';
import 'package:viewstudent/bodys/h_foder/t_score_pvs2.dart';
import 'package:viewstudent/folder/pvc1.dart';
import 'package:viewstudent/folder/pvc2.dart';
import 'package:viewstudent/folder/pvc3.dart';
import 'package:viewstudent/folder/pvs1.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_text.dart';

class SumScore extends StatelessWidget {
  const SumScore({super.key});

  @override
  Widget build(BuildContext context) {
     var titless = <String>[
   'ปวส.2',
    'ปวส.1',
    'ปวช.3',
    'ปวช.2',
    'ปวช.1',
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
        text: 'ผลการเรียน ',
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
                      builder: (context) => const ScorePVC2(),
                    ));

                break;
              case 4:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScorePCV1(),
                    ));
                break;
              case 2:
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScorePVC3(),
                    ));

              break;

              case 1:
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScorePVS1(),
                    ));

              break;

               case 0:
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TeacherScore_pvs2(),
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