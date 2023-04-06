import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viewstudent/body_teacher/updatacovid.dart';

import 'package:viewstudent/models/covid_model.dart';
import 'package:viewstudent/states/add_covid19.dart';

import 'package:viewstudent/utility/app_controller.dart';
import 'package:viewstudent/utility/app_service.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/utility/my_dialog.dart';
import 'package:viewstudent/widgets/show_button.dart';
import 'package:viewstudent/widgets/show_form.dart';
import 'package:viewstudent/widgets/show_icon_button.dart';
import 'package:viewstudent/widgets/show_text.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl_standalone.dart';

class ListCovid extends StatefulWidget {
  const ListCovid({
    super.key,
  });
  // final Map data;

  @override
  State<ListCovid> createState() => _ListCovidState();
}

class _ListCovidState extends State<ListCovid> {
  String? name, id, date;

  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();

    AppService().redCovid();
  }

  @override
  // Widget showdata({required Map userMap}){
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
      return GetX(
          init: AppController(),
          builder: (AppController appController) {
            print('covidModel ---> ${appController.covidModels.length}');
            return SizedBox(
              width: boxConstraints.maxWidth,
              height: boxConstraints.maxHeight,
              child: Stack(
                children: [
                  // Column(
                  //   children: [
                  //     ShowText(
                  //       text: 'เพิ่มรายชื่อคนติดโควิด',
                  //       textStyle: Myconstant().h2Style(),
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         ShowIconButton(iconData: Icons.person, pressFunc: () {

                  //         },),
                  //         ShowForm(
                  //           hint: 'Name : ',
                  //           changeFunc: (p0) {
                  //             name = p0.trim();
                  //           },
                  //           textEditingController: nameController,
                  //         ),
                  //       ],
                  //     ),
                  //     Row(
                  //       mainAxisAlignment:MainAxisAlignment.center ,
                  //       children: [
                  //         ShowIconButton(iconData: Icons.fingerprint_outlined, pressFunc: () {

                  //         },),
                  //         ShowForm(
                  //           hint: 'id : ',
                  //           changeFunc: (p0) {
                  //             id = p0.trim();
                  //           },
                  //           textEditingController: idController,
                  //         ),
                  //       ],
                  //     ),
                  //     Row(mainAxisAlignment:MainAxisAlignment.center ,
                  //       children: [
                  //            ShowIconButton(
                  //           iconData: Icons.calendar_today_rounded,
                  //           pressFunc: () async{
                  //               DateTime? pickeddate = await showDatePicker(
                  //           context: context,
                  //           initialDate: DateTime.now(),
                  //           firstDate: DateTime(2000),
                  //           lastDate: DateTime(2101),
                  //         );
                  //         if (pickeddate != null) {
                  //           String formattedDate=  DateFormat('yyyy-MM-dd').format(pickeddate);

                  //           setState(() {

                  //           dateController.text = formattedDate.toString();
                  //           });
                  //           } else {
                  //             print('flail');
                  //         }
                  //           },
                  //         ),

                  //         ShowForm(
                  //           //iconData: Icons.calendar_today_rounded,

                  //           hint: 'Date : ',
                  //           changeFunc: (p0) async {
                  //             date = dateController.text;
                  //           },
                  //           textEditingController: dateController,
                  //         ),

                  //       ],
                  //     ),
                  //     Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         ShowButton(
                  //           lable: 'บันทึก',
                  //           pressFunc: () async {
                  //             if ((name?.isEmpty ?? true) ||
                  //                 (id?.isEmpty ?? true) ||
                  //                 (date?.isEmpty ?? true)) {
                  //               MyDialog(context: context).normalDialog(
                  //                   title: 'มีพื้นที่ว่าง ?',
                  //                   subTitle: 'กรุณาเติมทุกช่องว่าง');
                  //             } else {
                  //               CovidModel covidModel = CovidModel(
                  //                   name: name!, id: id!, date: date!);
                  //               await FirebaseFirestore.instance
                  //                   .collection('covid')
                  //                   .doc()
                  //                   .set(covidModel.toMap())
                  //                   .then((value) {
                  //                 nameController.text = '';
                  //                 idController.text = '';
                  //                 dateController.text = '';
                  //               });
                  //             }
                  //           },
                  //         ),
                  //         ShowButton(
                  //           lable: 'อัพเดท',
                  //           pressFunc: () async {
                  //             if ((nameController.text.isEmpty) ||
                  //                 (idController.text.isEmpty) ||
                  //                 (dateController.text.isEmpty)) {
                  //               MyDialog(context: context).normalDialog(
                  //                   title: 'มีพื้นที่ว่าง ?',
                  //                   subTitle: 'กรุณาเติมทุกช่องว่าง');
                  //             } else {
                  //               String docId = appController.docIdCovids[
                  //                   appController.indexUpdates.last];
                  //               print('docId Updata---> $docId');

                  //               CovidModel covidModel = CovidModel(
                  //                   name: nameController.text,
                  //                   id: idController.text,
                  //                   date: dateController.text);
                  //               print(
                  //                   'covidModel Update ---> ${covidModel.toMap()}');

                  //               await FirebaseFirestore.instance
                  //                   .collection('covid')
                  //                   .doc(docId)
                  //                   .update(covidModel.toMap())
                  //                   .then((value) {
                  //                 nameController.text = '';
                  //                 idController.text = '';
                  //                 dateController.text = '';
                  //               });
                  //             }
                  //           },
                  //         ),
                  //       ],
                  //     )
                  //   ],
                  // ),
                  Scaffold(
                    floatingActionButtonLocation:
                        FloatingActionButtonLocation.endFloat,
                    floatingActionButton: FloatingActionButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const add_datacovid19(),
                          ),
                        )
                      },
                      child: Icon(Icons.add),
                      backgroundColor: Colors.green,
                    ),
                  ),
                  ShowText(
                    text: 'รายชื่อคนเป็น Covid19',
                    textStyle: Myconstant().h2Style(),
                  ),
                  Positioned(
                      top: 30,
                      child: SizedBox(
                        width: boxConstraints.maxWidth,
                        height: boxConstraints.maxHeight - 100,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    appController.covidModels.isEmpty
                                        ? const SizedBox()
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            physics: const ScrollPhysics(),
                                            itemCount: appController
                                                .covidModels.length,
                                            itemBuilder: (context, index) =>
                                                InkWell(
                                              onTap: () {
                                                appController.indexUpdates
                                                    .add(index);

                                                nameController.text =
                                                    appController
                                                        .covidModels[index]
                                                        .name;
                                                idController.text =
                                                    appController
                                                        .covidModels[index].id;
                                                dateController.text =
                                                    appController
                                                        .covidModels[index]
                                                        .date;
                                              },
                                              child: Card(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          ShowText(
                                                              text: appController
                                                                  .covidModels[
                                                                      index]
                                                                  .name),
                                                          ShowText(
                                                              text: appController
                                                                  .covidModels[
                                                                      index]
                                                                  .id),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          ShowText(
                                                              text: appController
                                                                  .covidModels[
                                                                      index]
                                                                  .date),
                                                          Row(
                                                            children: [
                                                              ShowIconButton(
                                                                iconData:
                                                                    Icons.edit,
                                                                pressFunc: () {
                                                                  appController
                                                                      .indexUpdates
                                                                      .add(
                                                                          index);

                                                                  nameController
                                                                          .text =
                                                                      appController
                                                                          .covidModels[
                                                                              index]
                                                                          .name;
                                                                  idController
                                                                          .text =
                                                                      appController
                                                                          .covidModels[
                                                                              index]
                                                                          .id;
                                                                  dateController
                                                                          .text =
                                                                      appController
                                                                          .covidModels[
                                                                              index]
                                                                          .date;
                                                                  Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                Updatacovid(
                                                                          covidModel:
                                                                              appController.covidModels[index],
                                                                          docIdCovid:
                                                                              appController.docIdCovids[index],
                                                                        ),
                                                                      )).then((value) {
                                                                    AppService()
                                                                        .redCovid();
                                                                  });
                                                                },
                                                              ),
                                                              ShowIconButton(
                                                                iconData: Icons
                                                                    .delete,
                                                                pressFunc:
                                                                    () async {
                                                                  final result =
                                                                      await showDialog<
                                                                          bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) =>
                                                                            AlertDialog(
                                                                      title: const Text(
                                                                          'คุณแน่ใจไหม ?'),
                                                                      content:
                                                                          const Text(
                                                                              'ถ้าต้องลบ เลือก ลบ'),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              context,
                                                                              true),
                                                                          child:
                                                                              const Text('ลบ'),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed: () => Navigator.pop(
                                                                              context,
                                                                              false),
                                                                          child: const Text(
                                                                              'ยกเลิก',
                                                                              style: TextStyle(color: Color(0xffF02E65))),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );

                                                                  if (result ==
                                                                          null ||
                                                                      !result) {
                                                                    return;
                                                                  }
                                                                  await FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          'covid')
                                                                      .doc(appController
                                                                              .docIdCovids[
                                                                          index])
                                                                      .delete()
                                                                      .then((value) =>
                                                                          null);
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                  ]),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
            );
          });
    });
  }

  Future<Null> delete(CovidModel covidModel) async {
    showDialog(
      context: context,
      builder: (context) =>
          SimpleDialog(title: Myconstant().titleHx1('ต้องการลบ')),
    );
  }
}
