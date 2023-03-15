import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viewstudent/models/user_model.dart';
import 'package:viewstudent/widgets/show_progree.dart';
import 'package:viewstudent/widgets/show_text.dart';

import '../utility/my_constant.dart';

class tc_profile extends StatefulWidget {
  const tc_profile({super.key});

  @override
  State<tc_profile> createState() => _ProfileState();
}

class _ProfileState extends State<tc_profile> {
  bool load = true;
  bool? haveData;
  UserModel? userModel;

  @override
  void initState() {
    super.initState();
    Profile();
  }

  Future<void> Profile() async {
    var user = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .get()
        .then((value) {
      setState(() {
        load = false;
        if (value.exists) {
          haveData = true;
          userModel = UserModel.fromFirestore(value);
        } else {
          haveData = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return load
        ? ShowProgress()
        : haveData == true
            ? ListView( 
              
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  
                  Column(
                    
                    children: [
                      Row(
                        children: [
                          Container(
                            
                            //decoration:BoxDecoration(boxShadow: [BoxShadow(blurRadius: 22,color:Myconstant.primary )]) ,
                            margin: const EdgeInsets.symmetric(vertical: 18),
                            width: 125,
                            height: 200,
                            child: Image.network('https://scontent.fbkk17-1.fna.fbcdn.net/v/t1.15752-9/327609021_1263683527911860_2686195865612552266_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=ae9488&_nc_eui2=AeGbM2LlJ4FP-73FAAO0VyQ0llt1r6qZcFKWW3WvqplwUt4LlNy3BV3d1PFyDwgV-UplZbbyPBOFubmYt6mpZCWt&_nc_ohc=2BmxrKcPjpkAX8moXlu&tn=o0XRcOHc23t_LLv5&_nc_ht=scontent.fbkk17-1.fna&oh=03_AdQdPt25y1RoB9RPTMJ1Y1uJ-uAYTpAjhyxU96e_dS752Q&oe=63FF8E45')
                            
                            // child: Image.network(userModel!.urlPfile,fit:BoxFit.cover,),
                          ),
                        ],
                      ),
                      Divider(color:Myconstant.dark,)
                    ],
                  ),
              
            
                 
                  Row(
                    children: [
                      ShowText(text: 'name : นางสาวสุพิญา เผ่าจินดา',textStyle: Myconstant().h2Style(),),
                    ],
                  ), Divider(color:Myconstant.dark,thickness: 1,),
                  Row(
                    children: [
                      ShowText(text: 'email : supichaya.phao@ovec.moe.got.hh',textStyle: Myconstant().h2Style(),),
                    ],
                  ), Divider(color:Myconstant.dark,thickness: 1,),
                  Row(
                    children: [
                      ShowText(text: 'phone : 0877693432',textStyle: Myconstant().h2Style(),),
                    ],
                  ), Divider(color:Myconstant.dark,thickness: 1,)
                  
                ],
                
              )
              
            : Text('not data');
  }
}