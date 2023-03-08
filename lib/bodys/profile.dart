import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viewstudent/bodys/tc_profile.dart';
import 'package:viewstudent/models/user_model.dart';
import 'package:viewstudent/states/add_profile_student.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_button.dart';
import 'package:viewstudent/widgets/show_progree.dart';
import 'package:viewstudent/widgets/show_text.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool load = true;
  bool? haveData;
  UserModel? userModel;

  @override
  void initState() {
    super.initState();
    findProfile();
  }

  Future<void> findProfile() async {
    var user = FirebaseAuth.instance.currentUser;

    await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .get()
        .then((value) {
          
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
    
    return load
        ?   
              const tc_profile()
                  
        
        //ShowProgress()
        : haveData!
            ? ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  
                  Container(
                    //decoration:BoxDecoration(boxShadow: [BoxShadow(blurRadius: 22,color:Myconstant.primary )]) ,
                    margin: const EdgeInsets.symmetric(vertical: 18),
                    width: 150,
                    height: 250,
                    child: Image.network(userModel!.urlPfile),
                    // child: Image.network(userModel!.urlPfile,fit:BoxFit.cover,),
                  ),
                  newContent(head: 'รหัส: ', value: userModel!.idStudent),
                  newContent(head: 'ชื่อ:', value: userModel!.name),
                  newContent(head: 'ชั้นปี:', value: userModel!.yearStudent),
                  newContent(head: 'แผนก:', value: userModel!.divition),
                  newContent(head: 'อาจารย์:', value: userModel!.teacher),
                  newContent(head: 'อาจารย์:', value: userModel!.teacher),
                ],
              )
            : newNoProfile(context);
          

      
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
              flex: 1,
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

  Center newNoProfile(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ShowText(
            text: 'No Profile',
            textStyle: Myconstant().h1Style(),
          ),
          ShowButton(
            lable: 'Create Profile',
            pressFunc: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddProfileStudent(),
                ),
              ).then((value) {
                load = true;
                findProfile();
                setState(() {});
              });
            },
          )
        ],
      ),
    );
  }
}
