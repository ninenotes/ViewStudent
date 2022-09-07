import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:viewstudent/states/app_service_student.dart';
import 'package:viewstudent/states/login.dart';
import 'package:viewstudent/utility/my_constant.dart';

final Map<String, WidgetBuilder> map = {
  '/login': (context) => const Login(),
  '/appService': (context) => const AppServiceStudent(),
};
String? keyState;

Future<void> main() async {

WidgetsFlutterBinding.ensureInitialized(); 
await Firebase.initializeApp().then((value) {// เช็คไฟลถ้าผ่านเงือนไขถึงทำงาน
    FirebaseAuth.instance.authStateChanges().listen((event) { // evnt คือค่าที่ มีการเปลียนให้ทำงาน

    if (event == null) {
      // SigOut Status ถ้าค่าเท่ากับnull คิอยังไม่ได้ลิอคอิน
      keyState = '/login';
      runApp(const MyApp());
    } else {
      // SigIn Status ท่าไม่ตรงเงือนไขไปแอปเซฺอวิส
      keyState ='/appService';
      runApp(const MyApp());
    }

    });
});


  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      routes: map,
      initialRoute: keyState,
      theme: ThemeData(
        appBarTheme:  AppBarTheme(backgroundColor: Myconstant.primary,),
      ),
    );
  }
}
