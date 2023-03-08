import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viewstudent/states/add_covid19.dart';

import '../utility/my_constant.dart';
import '../widgets/show_text.dart';

class covid extends StatefulWidget {
  const covid({super.key});

  @override
  State<covid> createState() => _covidState();
}

class _covidState extends State<covid> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: ShowText(
          text: 'COVID_19!',
          textStyle: Myconstant().h2whiteStyle(),
        ),
      ),
     floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>{
            Navigator.push(context, MaterialPageRoute(builder: (context) =>const add_datacovid19(),),)

          },
          child: Icon(Icons.add),
          backgroundColor: Colors.green,
    ),
     );
  }
}
