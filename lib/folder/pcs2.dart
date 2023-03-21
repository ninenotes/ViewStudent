import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:viewstudent/models/score_model.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_pdf_view.dart';
import 'package:viewstudent/widgets/show_text.dart';

//ปวช2
class ScorePVS2 extends StatefulWidget {
  const ScorePVS2({super.key});

  @override
  State<ScorePVS2> createState() => _ScorePVC2State();
}

class _ScorePVC2State extends State<ScorePVS2> {
  List<Widget> widgets = [];
  List<ScoreModel> scoreModels = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) async {
      print('initialize Success');
      await FirebaseFirestore.instance
          .collection('5np1')
          .orderBy('name')
          .snapshots()
          .listen((event) {
        print('snapshot = ${event.docs}');
        int index = 0;
        for (var snapshot in event.docs) {
          Map<String, dynamic> map = snapshot.data();
          print('map = $map');
          ScoreModel model = ScoreModel.fromMap(map);
          scoreModels.add(model);
          print('name = ${model.name}');
          setState(() {
            widgets.add(createwidget(model, index));
          });
          index++;
        }
      });
    });
  }

  Widget createwidget(ScoreModel model, int index) => GestureDetector(
        onTap: () {
          // print('You Click from index =$index');
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) =>
          //           ShowPdfView(scoreModel: scoreModels[index]),
          //     ));
        },
        child: Card(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 100,
                  child: Image.network(model.cover),
                ),
                SizedBox(
                  height: 16,
                ),
                Myconstant().titleHx1(model.name),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShowText(
          text: 'ปวส 2',
          textStyle: Myconstant().h2whiteStyle(),
        ),
      ),
      body: widgets.length == 0
          ? Center(child: CircularProgressIndicator())
          : GridView.extent(maxCrossAxisExtent: 200, children: widgets),
    );
  }
}