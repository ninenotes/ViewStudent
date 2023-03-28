import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_text.dart';

class Showscore7 extends StatefulWidget {
  const Showscore7({super.key});

  @override
  State<Showscore7> createState() => _Showscore7State();
  
}

class _Showscore7State extends State<Showscore7> {
  @override
  Widget build(BuildContext context) {
     CollectionReference users = FirebaseFirestore.instance.collection('user');

    return Scaffold(
        appBar: AppBar(
          title: const Text('64309010007'),
        ),
        body: FutureBuilder<DocumentSnapshot>(
          future: users.doc('23Vvi1YuyPOxzpJ4aQyJiw9rzl92').get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return const Text("does not exist");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic>data = 
              snapshot.data!.data() as Map<String,dynamic>;
               // return Text("Full Name: ${data['id']} ${data['name']}");
return
              ListView(
                
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                   
                     children: [
                      ShowText(text: 'ภาคเรียนที่ 1 ปีการศึกษา 2565\n\n\n\n',textStyle: Myconstant().h2Style(),),
                     
                      newContent(head: '30000-1204 \nภาษาอังกฤษโครงงาน:', value: '${data['E30000_1204']}'),
                      newContent(head: '30000-2003 \nกิจกรรมองค์การวิชาชีพ 3 :', value: '${data['E30000_2003']}'),
                      newContent(head: '30001-1001 \nการบริหารงานคุณภาพในองค์การ:', value: '${data['E30001_1001']}'),
                      newContent(head: '30901-2003 \nการพัฒนาระบบฐานข้อมูล:', value: '${data['E30901_2003']}'),
                      newContent(head: '30901-2005 \nการโปรแกรมชิงวัตถุด้วยเทคโนโลยี:', value: '${data['E30901_2005']}'),
                      newContent(head: '30901-2007 \nการพัฒนาโปรแกรมบนคอมพิวเตอร์พกพา:', value: '${data['E30901_2007']}'),
                      newContent(head: '30901_2202 \nการพัฒนาเว็บด้วยภาษาPHP:', value: '${data['E30901_2202']}'),
                      newContent(head: '30901_8502 \nการวิเคราะห์และออกแบบระบบเครื่อข่าย:', value: '${data['E30901_8502']}'),
                       newContent(head: 'เกรดรวม:', value: '${data['grade']}'),
                     
                        
                        
                     ],
                   
                    
                  
                );
            }

           
      return Text("loading");
      },
     ) );
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