import 'package:flutter/material.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_button.dart';
import 'package:viewstudent/widgets/show_form.dart';
import 'package:viewstudent/widgets/show_image.dart';
import 'package:viewstudent/widgets/show_text.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: Myconstant().bgBOX(),
        child: ListView(
          children: [
            makeCenter(widget: newLogo()),
            makeCenter(
                widget: ShowText(
              text: 'วิทยาลัยเทคนิคสมุทรสงคราม',
              textStyle: Myconstant().h2whiteStyle(),
            )),
            makeCenter(
                widget: ShowForm(
              hint: 'ชื่อผู้ใช้งาน',
              iconData: Icons.person,
              changeFunc: (String string) {},
            )),
            makeCenter(
                widget: ShowForm(
              hint: 'รหัสผ่าน',
              iconData: Icons.lock,
              changeFunc: (p0) {},
            )),
            makeCenter(
                widget: Container(margin:  const EdgeInsets.only(top:16),
              width: 250,
              child: ShowButton(
                colorPriamry: Colors.white,
                lable: 'เข้าสู่ระบบ',
                pressFunc: () {},
              ),
            ))
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
}
