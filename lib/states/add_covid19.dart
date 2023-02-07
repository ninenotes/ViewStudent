import 'package:flutter/material.dart';

import '../utility/my_constant.dart';
import '../widgets/show_button.dart';
import '../widgets/show_form.dart';
import '../widgets/show_text.dart';

class add_datacovid19 extends StatefulWidget {
  const add_datacovid19({super.key});

  @override
  State<add_datacovid19> createState() => _adddatacovid19State();
}

class _adddatacovid19State extends State<add_datacovid19> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: ShowText(
          text: 'ADD_COVID_19!',
          textStyle: Myconstant().h2whiteStyle(),
        ),
      ),
body: ListView(
        children: [
        
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                textInputType: TextInputType.number,
                hint: 'รหัสนักศึกษา :',
                iconData: Icons.fingerprint,
                changeFunc: (p0) {
              
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'ชื่อ-สกุล :',
                iconData: Icons.face,
                changeFunc: (p0) {
                 
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'ชั้นปี :',
                iconData: Icons.lock_clock,
                changeFunc: (p0) {
                
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'แผนก :',
                iconData: Icons.house,
                changeFunc: (p0) {
                  
                },
              ),
            ],
          ),
       
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: ShowButton(
              lable: 'เพิ่มข้อมูล',
              pressFunc: () {
              
              },
            ),
          )
        ],
      ),
    
    );
  }
}