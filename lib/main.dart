import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viewstudent/models/user_model.dart';
import 'package:viewstudent/states/app_service_student.dart';
import 'package:viewstudent/states/app_service_teacher.dart';
import 'package:viewstudent/states/app_service_wibsite.dart';
import 'package:viewstudent/states/login.dart';
import 'package:viewstudent/utility/app_controller.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

final Map<String, WidgetBuilder> map = {
  '/login': (context) => const Login(),
  '/appService': (context) => const AppServiceStudent(),
};

var getPages = <GetPage<dynamic>>[
  GetPage(
    name: '/login',
    page: () => const Login(),
  ),
  GetPage(
    name: '/student',
    page: () => const AppServiceStudent(),
  ),
  GetPage(
    name: '/teacher',
    page: () => const AppServiceTeacher(),
  ),
  GetPage(
    name: '/web',
    page: () => const AppServiceWebsite(),
  ),
];

String? keyState;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // web
    keyState = '/web';
    runApp(const MyApp());
  } else {
    //mobile

    await Firebase.initializeApp().then((value) {
      // เช็คไฟลถ้าผ่านเงือนไขถึงทำงาน
      FirebaseAuth.instance.authStateChanges().listen((event) async {
        // evnt คือค่าที่ มีการเปลียนให้ทำงาน

        if (event == null) {
          // SigOut Status ถ้าค่าเท่ากับnull คิอยังไม่ได้ลิอคอิน
          keyState = '/login';
          runApp(const MyApp());
        } else {
          // SigIn Status ท่าไม่ตรงเงือนไขไปแอปเซฺอวิส
          AppController appController = Get.put(AppController());
          appController.uidLogins.add(event.uid);

          await FirebaseFirestore.instance
              .collection('user')
              .doc(appController.uidLogins.last)
              .get()
              .then((value) {
            UserModel userModel = UserModel.fromMap(value.data()!);
            appController.userModels.add(userModel);

            keyState = '/${userModel.typeuser}';
            print('##15mar keyState ----> $keyState');
            runApp(const MyApp());
          });
        }
      });
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: getPages,
      initialRoute: keyState,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Myconstant.primary,
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}
