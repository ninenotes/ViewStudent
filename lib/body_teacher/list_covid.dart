import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viewstudent/bodys/COVID_19.dart';
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

class ListCovid extends StatefulWidget {
  const ListCovid({super.key});

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
                  Column(
                    children: [
                      ShowForm(
                        hint: 'Name : ',
                        changeFunc: (p0) {
                          name = p0.trim();
                        },
                        textEditingController: nameController,
                      ),
                      ShowForm(
                        hint: 'id : ',
                        changeFunc: (p0) {
                          id = p0.trim();
                        },
                        textEditingController: idController,
                      ),
                      ShowForm(
                        hint: 'Date : ',
                        changeFunc: (p0) {
                          date = p0.trim();
                        },
                        textEditingController: dateController,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ShowButton(
                            lable: 'Save',
                            pressFunc: () async {
                              if ((name?.isEmpty ?? true) ||
                                  (id?.isEmpty ?? true) ||
                                  (date?.isEmpty ?? true)) {
                                MyDialog(context: context).normalDialog(
                                    title: 'Have Space ?',
                                    subTitle: 'Please Fill Every Blank');
                              } else {
                                CovidModel covidModel = CovidModel(
                                    name: name!, id: id!, date: date!);
                                await FirebaseFirestore.instance
                                    .collection('covid')
                                    .doc()
                                    .set(covidModel.toMap())
                                    .then((value) {
                                  nameController.text = '';
                                  idController.text = '';
                                  dateController.text = '';
                                });
                              }
                            },
                          ),
                          ShowButton(
                            lable: 'Update',
                            pressFunc: () async {
                              if ((nameController.text.isEmpty) ||
                                  (idController.text.isEmpty) ||
                                  (dateController.text.isEmpty)) {
                                MyDialog(context: context).normalDialog(
                                    title: 'Have Space ?',
                                    subTitle: 'Please Fill Every Blank');
                              } else {
                                String docId = appController.docIdCovids[
                                    appController.indexUpdates.last];
                                print('docId Updata---> $docId');

                                CovidModel covidModel = CovidModel(
                                    name: nameController.text,
                                    id: idController.text,
                                    date: dateController.text);
                                print(
                                    'covidModel Update ---> ${covidModel.toMap()}');

                                await FirebaseFirestore.instance
                                    .collection('covid')
                                    .doc(docId)
                                    .update(covidModel.toMap())
                                    .then((value) {
                                  nameController.text = '';
                                  idController.text = '';
                                  dateController.text = '';
                                });
                              }
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  Positioned(
                      top: 260,
                      child: SizedBox(
                        width: boxConstraints.maxWidth,
                        height: boxConstraints.maxHeight - 260,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ShowText(
                                    text: 'รายชื่อคนเป็น Covid19',
                                    textStyle: Myconstant().h2Style(),
                                  ),
                                  appController.covidModels.isEmpty
                                      ? const SizedBox()
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          physics: const ScrollPhysics(),
                                          itemCount:
                                              appController.covidModels.length,
                                          itemBuilder: (context, index) =>
                                              InkWell(
                                            onTap: () {
                                              appController.indexUpdates
                                                  .add(index);

                                              nameController.text =
                                                  appController
                                                      .covidModels[index].name;
                                              idController.text = appController
                                                  .covidModels[index].id;
                                              dateController.text =
                                                  appController
                                                      .covidModels[index].date;
                                            },
                                            child: Card(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                        ShowIconButton(
                                                          iconData:
                                                              Icons.delete,
                                                          pressFunc: () async {
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
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            );
          });
    });
  }
}
