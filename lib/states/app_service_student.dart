import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viewstudent/bodys/menu.dart';
import 'package:viewstudent/bodys/menu2.dart';
import 'package:viewstudent/bodys/profile.dart';
import 'package:viewstudent/bodys/search.dart';
import 'package:viewstudent/states/add_profile_student.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/utility/my_dialog.dart';
import 'package:viewstudent/widgets/show_button.dart';
import 'package:viewstudent/widgets/show_image.dart';
import 'package:viewstudent/widgets/show_text.dart';

class AppServiceStudent extends StatefulWidget {
  const AppServiceStudent({super.key});

  @override
  State<AppServiceStudent> createState() => _AppServiceStudentState();
}

class _AppServiceStudentState extends State<AppServiceStudent> {
  int indexBody = 1;
  var titles = <String>[
    'โปรไฟล',
    'เมนู',                                                                  
    'ค้นหา',
  ];
  var widgets = <Widget>[
    const Profile(),
    const Menu(),
      Search(),
      
  ];

  var iconDatas = <IconData>[
    Icons.account_circle,
    Icons.apps,
    Icons.search,
  ];

  var bottomNavItemBars = <BottomNavigationBarItem>[];

  String typeUser = 'student';

  @override
  void initState() {
    super.initState();

    createBottonItemBar();
    findUserLogin();
  }

  Future<void> findUserLogin() async {
    var user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .get()
        .then((value) {
      print('value ==> ${value.data()}');

      if (value.data() == null) {
        processRequireProfileDiglog();
      }
    });
  }

  void createBottonItemBar() {
    for (var i = 0; i < titles.length; i++) {
      BottomNavigationBarItem bottomNavigationBarItem = BottomNavigationBarItem(
        label: titles[i],
        icon: Icon(iconDatas[i]),
      );
      bottomNavItemBars.add(bottomNavigationBarItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ShowText(
          text: titles[indexBody],
          textStyle: Myconstant().h2whiteStyle(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: Myconstant.primaryColorLight,
        //สีแอปบาร
        currentIndex: indexBody,
        items: bottomNavItemBars,
        onTap: (value) {
          setState(() {
            indexBody = value;
          });
        },
      ),
      body: widgets[indexBody],
    );
  }

  void processRequireProfileDiglog() {
    showDialog(
      context: context,
      builder: (contex) => StatefulBuilder(builder: (context, mySetState) {
        return AlertDialog(
          title: ListTile(
            leading: const SizedBox(
              width: 80,
              child: ShowImage(),
            ),
            title: ShowText(
              text: 'ยังไม่มี Profile ?',
              textStyle: Myconstant().h2redStyle(),
            ),
            subtitle: const ShowText(
                text:
                    'ถ้าเป็น นักศึกษา ต้อง add Profile แต่ถ้าเป็น อาจารย์ กรุณาเลือก Type User เป็รอาจารย์ และ Add Profile คะ'),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ShowText(
                text: 'Tyoe User:',
                textStyle: Myconstant().h2Style(),
              ),
              RadioListTile(
                title: ShowText(text: 'นักศึกษา'),
                value: 'student',
                groupValue: typeUser,
                onChanged: (value) {
                  mySetState(() {
                    typeUser = value.toString();
                  });
                },
              ),
              RadioListTile(                    
                title: ShowText(text: 'อาจารย์'),
                value: 'teacher',
                groupValue: typeUser,
                onChanged: (value) {
                  mySetState(() {
                    typeUser = value.toString();
                  });
                },
              ),
            ],
          ),
          actions: [
            ShowButton(
              lable: 'Add Profile',
              pressFunc: () {
                if (typeUser == 'teacher') {
                  processAddTeacher();
                  Navigator.pop(context);
                } else {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddProfileStudent(),
                    ),
                  );
                }

                print('type user ===> $typeUser');
              },
            ),
            ShowButton(
              lable: 'Cancel',
              pressFunc: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      }),
    );
  }

  Future<void> processAddTeacher() async {
    var user = FirebaseAuth.instance.currentUser;
    Map<String, dynamic> map = {};
    map['typeuser'] = 'teacher';
    await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .set(map)
        .then((value) {
      MyDialog(context: context).normalDialog(
          title: 'Add Profile Success', subTitle: 'ขอบคุณ อาจารย์ครับ ครับ');
    });
  }
}