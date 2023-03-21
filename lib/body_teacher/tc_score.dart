import 'package:flutter/material.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_text.dart';

class Teacher_Score extends StatefulWidget {
  const Teacher_Score({super.key});

  @override
  State<Teacher_Score> createState() => _Teacher_ScoreState();
}

class _Teacher_ScoreState extends State<Teacher_Score> {
  @override

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShowText(
          text: 'ประวัตินักเรียน',
          textStyle: Myconstant().h2whiteStyle(),
        ),
      ),
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
                      builder: (context) => const Teacher_Score(),
                    ));

                break;
              case 4:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Teacher_Score(),
                    ));
                break;
              case 2:
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Teacher_Score(),
                    ));

              break;

              case 1:
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Teacher_Score(),
                    ));

              break;

               case 0:
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Teacher_Score(),
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
