// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:viewstudent/models/model_5np1.dart';
import 'package:viewstudent/widgets/widget_image_network.dart';

class DisplayDetailStudent extends StatelessWidget {
  const DisplayDetailStudent({
    Key? key,
    required this.model5np1,
  }) : super(key: key);
  final Model5np1 model5np1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(15),
            height: 450,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SizedBox(
                    width: 200,
                    height: 150,
                    child: WidgetImageNetwork(urlImage: model5np1.image),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  model5np1.idStudent,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 233, 14, 14),
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  model5np1.name,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'วันเดือนปีเกิด: ${model5np1.date}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                  
                ),
                            Text(
                  'สัญชาติ${model5np1.nationality}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 Text(
                  'เบอร์โทร: ${model5np1.phone}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 Text(
                  'ที่อยู้:${model5np1.address}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 Text(
                  'ผู้ปกครอง:${model5np1.nameparent}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
     
                 Text(
                  'เบอรฺผู้ปกครอง:${model5np1.phone2}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
