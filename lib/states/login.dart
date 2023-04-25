import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viewstudent/models/user_model.dart';
import 'package:viewstudent/utility/app_controller.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/utility/my_dialog.dart';
import 'package:viewstudent/widgets/show_button.dart';
import 'package:viewstudent/widgets/show_form.dart';
import 'package:viewstudent/widgets/show_icon_button.dart';
import 'package:viewstudent/widgets/show_image.dart';
import 'package:viewstudent/widgets/show_text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Myconstant().bgBOX(),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ShowIconButton(
                  iconData: Icons.help,
                  pressFunc: () {
                    MyDialog(context: context).normalDialog(
                        title: 'วิธีเข้าใช้งาน',
                        subTitle:
                            '\n\nนักเรียน-นักศึกษา : เข้าสู่ระบบโดยใช้ของรหัสนักศึกษา ตามด้วย@sstc.com  \n\n อาจารย์: เข้าสู่ระบบโดยใช้เบอร์โทรตามด้วย @sstc.com');
                  },
                ),
              ],
            ),
            makeCenter(widget: newLogo()),
            // makeCenter(
            //     widget: ShowText(
            //   text: 'Student SEA',
            //   textStyle: Myconstant().h2whiteStyle(),
            // )),
            makeCenter(
                widget: ShowForm(
              hint: 'ชื่อผู้ใช้งาน',
              iconData: Icons.person,
              changeFunc: (String string) {
                user = string.trim();
              },
            )),
            makeCenter(
                widget: ShowForm(
              obsecu: true,
              hint: 'รหัสผ่าน',
              iconData: Icons.lock,
              changeFunc: (p0) {
                password = p0.trim();
              },
            )),
            makeCenter(
                widget: Container(
              margin: const EdgeInsets.only(top: 16),
              width: 250,
              child: ShowButton(
                colorPriamry: Color.fromARGB(255, 219, 20, 20),
                lable: 'เข้าสู่ระบบ',
                pressFunc: () {
                  if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
                    MyDialog(context: context).normalDialog(
                        title: 'Have Space', subTitle: 'Please Fill Blank');
                  } else {
                    proccesssCheckLogin();
                  }
                },
              ),
            )),
          ],
        ),
      ),
    );
  }

  Row makeCenter({required Widget widget}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget,
      ],
    );
  }

  Container newLogo() {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 32),
      width: 150,
      child: const ShowImage(),
    );
  }

  Future<void> proccesssCheckLogin() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: user!, password: password!)
        .then((value) async {
      AppController appController = Get.put(AppController());
      appController.uidLogins.add(value.user!.uid);

      await FirebaseFirestore.instance
            .collection('user')
            .doc(appController.uidLogins.last)
            .get()
            .then((value) {
              

              UserModel userModel = UserModel.fromMap(value.data()!);
              appController.userModels.add(userModel);

              String keyState = '/${userModel.typeuser}';
              print('#15 mar keyState ----> $keyState');


              Get.offAllNamed(keyState);
           


            });










    }).catchError((error) {
      MyDialog(context: context)
          .normalDialog(title: error.code, subTitle: error.message);
    });
  }
}
