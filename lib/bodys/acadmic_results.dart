
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_text.dart';

import '../models/user_model.dart';

class ResultsStuden extends StatefulWidget {
  const ResultsStuden({super.key});
  

  @override
  State<ResultsStuden> createState() => _ResultsStudenState();
}

class _ResultsStudenState extends State<ResultsStuden> {
    bool load = true;
  bool? haveData;
  UserModel? userModel;
  List<UserModel> userModel1 = [];
   
  @override
  void initState() {
    super.initState();
    findProfile();
  }
Future findProfile() async {
    var user = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .get()
        .then((value) {
              print(value);
      if (value.data() == null) {
        haveData = false;
      } else {
        haveData = true;

        userModel = UserModel.fromMap(value.data()!);
      }

      load = false;
      setState(() {});
    });
  }

  
  @override
  Widget build(BuildContext context) {
    
   return Scaffold(
    appBar: AppBar(
        title: ShowText(
          text: 'ผลการเรียน',
          textStyle: Myconstant().h2whiteStyle(),
        ),
      ),
    backgroundColor: Colors.white,
    body:  
    
    Column(
      children: [
      
        load == true ?  ShowText(text: "no",textStyle: Myconstant().h2redStyle())
            : haveData == true
            ?  Expanded(
               child: ListView(
                
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                   
                     children: [
                      ShowText(text: 'ภาคเรียนที่ 1 ปีการศึกษา 2565\n\n\n\n',textStyle: Myconstant().h2Style(),),
                     
                      newContent(head: '30000-1204 \nภาษาอังกฤษโครงงาน:', value: userModel!.E30000_1204),
                      newContent(head: '30000-2003 \nกิจกรรมองค์การวิชาชีพ 3 :', value: userModel!.E30000_2003),
                      newContent(head: '30001-1001 \nการบริหารงานคุณภาพในองค์การ:', value: userModel!.E30001_1001),
                      newContent(head: '30901-2003 \nการพัฒนาระบบฐานข้อมูล:', value: userModel!.E30901_2003),
                      newContent(head: '30901-2005 \nการโปรแกรมชิงวัตถุด้วยเทคโนโลยี:', value: userModel!.E30901_2005),
                      newContent(head: '30901-2007 \nการพัฒนาโปรแกรมบนคอมพิวเตอร์พกพา:', value: userModel!.E30901_2007),
                      newContent(head: '30901_2202 \nการพัฒนาเว็บด้วยภาษาPHP:', value: userModel!.E30901_2202),
                      newContent(head: '30901_8502 \nการวิเคราะห์และออกแบบระบบเครื่อข่าย:', value: userModel!.E30901_8502),
                       newContent(head: 'คะแนนเฉลียในภาคนี้:', value:  userModel!.avagrade.toString()),
                       newContent(head: 'คะแนนเฉลียสม:', value:  userModel!.grade.toString()),
                     
                        
                        
                     ],
                   
                    
                  
                ),
             ) :   ShowText(text: "HELLO WORLD",textStyle: Myconstant().h2redStyle()),
      ],
    )
        
         );
   

                  
        
        
            
          

      
  }
  Column newContent({required String head, required String value}) {
    return Column(
      children: [
        
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: ShowText(
                text: head,
                textStyle: Myconstant().h2Style(),
              ),
            ),
            Expanded(
              flex: 0,
              child: ShowText(text: value),
            ),
          ],
        ),
        Divider(
          color: Myconstant.primaryColorLight,
          thickness: 1,
          indent: 2,
          endIndent: 1,
          height: 25,
        ),
        //เส้นบรรทีด// Divider(color: Myconstant.dark,thickness: 1,),
      ],
    );
  }
}
