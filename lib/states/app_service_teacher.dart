import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viewstudent/body_teacher/list_covid.dart';
import 'package:viewstudent/body_teacher/list_post.dart';
import 'package:viewstudent/bodys/menu2.dart';
import 'package:viewstudent/bodys/tc_profile.dart';
import 'package:viewstudent/states/search_teacher.dart';
import 'package:viewstudent/utility/app_controller.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_icon_button.dart';
import 'package:viewstudent/widgets/show_text.dart';

class AppServiceTeacher extends StatefulWidget {
  const AppServiceTeacher({super.key});

  @override
  State<AppServiceTeacher> createState() => _AppServiceTeacherState();
}

class _AppServiceTeacherState extends State<AppServiceTeacher> {
  var title = <String>[
    'Post News',
    'Menu',
    'Covid 19',
  ];
  var iconDatas = <IconData>[
    Icons.newspaper,
    Icons.menu_book,
    Icons.coronavirus_rounded,
  ];
  var bodys = <Widget>[
    const ListPost(),
    const Menu2(),
    const ListCovid(),
  ];
  var bottomNavBarItems = <BottomNavigationBarItem>[];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < title.length; i++) {
      bottomNavBarItems.add(
        BottomNavigationBarItem(
          icon: Icon(iconDatas[i]),
          label: title[i],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: AppController(),
        builder: (AppController appController) {
          print('##15mar indexBody --> ${appController.indexBody}');
          return Scaffold(
            appBar: AppBar(
              title: ShowText(
                text: title[appController.indexBody.value],
                textStyle: Myconstant().h2Style(),
              ),
              actions: [
                // ShowIconButton(
                //   iconData: Icons.exit_to_app,
                //   pressFunc: () async {
                //     await FirebaseAuth.instance.signOut().then((value) {
                //       Get.offAllNamed('/login');
                //     });
                //   },
                // ),
                ShowIconButton(
                  iconData: Icons.person,
                  pressFunc: () {
                    Get.to(const tc_profile());
                  },
                  color: Colors.black,
                ),
                ShowIconButton(
                  iconData: Icons.search,
                  pressFunc: () {
                    Get.to(const SearchTeacher());
                  },
                  color: Colors.black,
                ),
              ],
            ),
            body: bodys[appController.indexBody.value],
            bottomNavigationBar: BottomNavigationBar(
              items: bottomNavBarItems,
              currentIndex: appController.indexBody.value,
              onTap: (value) {
                appController.indexBody.value = value;
              },
            ),
          );
        });
  }
}
