// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';

import 'package:viewstudent/body_teacher/list_covid.dart';
import 'package:viewstudent/models/covid_model.dart';
import 'package:viewstudent/utility/app_controller.dart';
import 'package:viewstudent/utility/app_service.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/utility/my_dialog.dart';
import 'package:viewstudent/widgets/show_button.dart';
import 'package:viewstudent/widgets/show_form.dart';
import 'package:viewstudent/widgets/show_icon_button.dart';
import 'package:viewstudent/widgets/show_text.dart';

class Updatacovid extends StatefulWidget {
  // const Updatacovid({super.key,required Map this.data});
  const Updatacovid({
    Key? key,
    required this.covidModel,
    required this.docIdCovid,
  }) : super(key: key);
  //  final Map data;
  final CovidModel covidModel;
  final String docIdCovid;

  @override
  State<Updatacovid> createState() => _UpdatacovidState();
}

class _UpdatacovidState extends State<Updatacovid> {
  String? name, id, date;

  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
  
    super.initState();
    nameController.text = widget.covidModel.name;
    idController.text = widget.covidModel.id;
    dateController.text= widget.covidModel.date;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShowText(
          text: 'แก้ไขรายชื่อคนติดโควิด',
          textStyle: Myconstant().h2whiteStyle(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if ((nameController.text.isEmpty)||(idController.text.isEmail)||(dateController.text.isEmpty)) {
            MyDialog(context: context).normalDialog(
                title: 'มีพื้นที่ว่าง ?', subTitle: 'กรุณาเติมทุกช่องว่าง');
          } else {
            CovidModel covidModel =
                CovidModel(name: nameController.text, id: idController.text, date: dateController.text);
                print('covidModel --->${covidModel.toMap()}');

            await FirebaseFirestore.instance
                .collection('covid')
                .doc(widget.docIdCovid)
                .update(covidModel.toMap())
                .then((value) {
                  Navigator.pop(context);
              // nameController.text = '';
              // idController.text = '';
              // dateController.text = '';
            });
          
          }
        },
        icon: Icon(Icons.save),
        label: Text("Save"),
      ),
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
               

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShowIconButton(
                      iconData: Icons.person,
                      pressFunc: () {},
                    ),
                    ShowForm(
                      hint: 'Name : ',
                      changeFunc: (p0) {
                        name = p0.trim();
                      },
                      textEditingController: nameController,
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShowIconButton(
                      iconData: Icons.fingerprint_outlined,
                      pressFunc: () {},
                    ),
                    ShowForm(
                      hint: 'id : ',
                      changeFunc: (p0) {
                        id = p0.trim();
                      },
                      textEditingController: idController,
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShowIconButton(
                      iconData: Icons.calendar_today_rounded,
                      pressFunc: () async {
                        DateTime? pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );

                        if (pickeddate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickeddate);

                          setState(() {
                            dateController.text = formattedDate.toString();
                          });
                        } else {
                          print('flail');
                        }
                      },
                    ),
                    ShowForm(
                      //iconData: Icons.calendar_today_rounded,

                      hint: 'Date : ',

                      changeFunc: (p0) async {
                        date = dateController.text;
                      },

                      textEditingController: dateController,
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // ShowButton(

                    //   lable: 'บันทึก',

                    //   pressFunc: () async {

                    //     if ((name?.isEmpty ?? true) ||

                    //         (id?.isEmpty ?? true) ||

                    //         (date?.isEmpty ?? true)) {

                    //       MyDialog(context: context).normalDialog(

                    //           title: 'มีพื้นที่ว่าง ?',

                    //           subTitle: 'กรุณาเติมทุกช่องว่าง');

                    //     } else {

                    //       CovidModel covidModel = CovidModel(

                    //           name: name!, id: id!, date: date!);

                    //       await FirebaseFirestore.instance

                    //           .collection('covid')

                    //           .doc()

                    //           .set(covidModel.toMap())

                    //           .then((value) {

                    //         nameController.text = '';

                    //         idController.text = '';

                    //         dateController.text = '';

                    //       });

                    //     }

                    //   },

                    // ),

                    // ShowButton(

                    //   lable: 'อัพเดท',

                    //   pressFunc: () async {

                    //     if ((nameController.text.isEmpty) ||

                    //         (idController.text.isEmpty) ||

                    //         (dateController.text.isEmpty)) {

                    //       MyDialog(context: context).normalDialog(

                    //           title: 'มีพื้นที่ว่าง ?',

                    //           subTitle: 'กรุณาเติมทุกช่องว่าง');

                    //     } else {

                    //       var appController;

                    //       String docId = appController.docIdCovids[

                    //           appController.indexUpdates.last];

                    //       print('docId Updata---> $docId');

                    //       CovidModel covidModel = CovidModel(

                    //           name: nameController.text,

                    //           id: idController.text,

                    //           date: dateController.text);

                    //       print(

                    //           'covidModel Update ---> ${covidModel.toMap()}');

                    //       await FirebaseFirestore.instance

                    //           .collection('covid')

                    //           .doc(docId)

                    //           .update(covidModel.toMap())

                    //           .then((value) {

                    //         nameController.text = '';

                    //         idController.text = '';

                    //         dateController.text = '';

                    //       });

                    //     }

                    //   },

                    // ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
