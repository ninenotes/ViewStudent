import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viewstudent/models/user_model.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/utility/my_dialog.dart';
import 'package:viewstudent/widgets/show_button.dart';
import 'package:viewstudent/widgets/show_form.dart';
import 'package:viewstudent/widgets/show_text.dart';

class AppServiceWebsite extends StatefulWidget {
  const AppServiceWebsite({super.key});

  @override
  State<AppServiceWebsite> createState() => _AppServiceWebsiteState();
}

class _AppServiceWebsiteState extends State<AppServiceWebsite> {
  var idStudent;

  var name;

  var yearStudent;

  var divition;

  var teacher;

  var urlPfile;

  var typeuser;

  var grade;

  String? E30000_1204;

  String? E30000_2003;

  var E30001_1001;

  var E30901_2003;

  var E30901_2005;

  var E30901_2007;

  var E30901_2008;

  var E30901_2202;

  var E30901_8502;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShowText(
          text: 'Create New User',
          textStyle: Myconstant().h2Style(),
        ),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'E30000_1204',
                changeFunc: (p0) {
                  E30000_1204 = p0.trim();
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'E30000_2003',
                changeFunc: (p0) {
                  E30000_2003 = p0.trim();
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'E30001_1001',
                changeFunc: (p0) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'a',
                changeFunc: (p0) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'b',
                changeFunc: (p0) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'c',
                changeFunc: (p0) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'd',
                changeFunc: (p0) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'f',
                changeFunc: (p0) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'g',
                changeFunc: (p0) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'h',
                changeFunc: (p0) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'i',
                changeFunc: (p0) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'j',
                changeFunc: (p0) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'k',
                changeFunc: (p0) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'l',
                changeFunc: (p0) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'm',
                changeFunc: (p0) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'o',
                changeFunc: (p0) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'p',
                changeFunc: (p0) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'q',
                changeFunc: (p0) {},
              ),
            ],
          ),
          ShowButton(
            lable: 'Save',
            pressFunc: () async {
              if ((E30000_1204?.isEmpty ?? true) ||
                  (E30000_2003?.isEmpty ?? true)) {
                MyDialog(context: context)
                    .normalDialog(title: 'Have Space', subTitle: 'HaveSpace');
              } else {

                 UserModel userModel = UserModel(
                  idStudent: idStudent,
                  name: name,
                  yearStudent: yearStudent,
                  divition: divition,
                  teacher: teacher,
                  urlPfile: urlPfile,
                  typeuser: typeuser,
                  grade: grade,
                  E30000_1204: E30000_1204!,
                  E30000_2003: E30000_2003!,
                  E30001_1001: E30001_1001,
                  E30901_2003: E30901_2003,
                  E30901_2005: E30901_2005,
                  E30901_2007: E30901_2007,
                  E30901_2008: E30901_2008,
                  E30901_2202: E30901_2202,
                  E30901_8502: E30901_8502, avagrade: 0.0);



                 // await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)


              }
            },
          )
        ],
      ),
    );
  }
}
