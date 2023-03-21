import 'package:flutter/material.dart';
import 'package:viewstudent/bodys/h_foder/h_5np1.dart';

import '../../utility/my_constant.dart';
import '../../widgets/show_text.dart';

class h_pvc2 extends StatelessWidget {
  const h_pvc2({super.key});

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
                      builder: (context) => const History5np1(),
                    ));

                break;
              case 4:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const History5np1(),
                    ));
                break;
              case 2:
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const History5np1(),
                    ));

              break;

              case 1:
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const History5np1(),
                    ));

              break;

               case 0:
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const History5np1(),
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