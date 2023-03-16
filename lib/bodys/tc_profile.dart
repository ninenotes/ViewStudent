import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viewstudent/models/user_model.dart';
import 'package:viewstudent/utility/app_controller.dart';
import 'package:viewstudent/widgets/show_progree.dart';
import 'package:viewstudent/widgets/show_text.dart';

import '../utility/my_constant.dart';

class tc_profile extends StatefulWidget {
  const tc_profile({super.key});

  @override
  State<tc_profile> createState() => _ProfileState();
}

class _ProfileState extends State<tc_profile> {
  bool load = true;
  bool? haveData;
  UserModel? userModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: AppController(),
        builder: (AppController appController) {
          print('useModel ---> ${appController.userModels.length}');
          return Scaffold(
              appBar: AppBar(),
              body: appController.userModels.isEmpty
                  ? ShowProgress()
                  :  ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      //decoration:BoxDecoration(boxShadow: [BoxShadow(blurRadius: 22,color:Myconstant.primary )]) ,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 18),
                                      width: 125,
                                      height: 200,
                                      child: Image.network(appController.userModels.last.urlPfile),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Myconstant.dark,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                ShowText(
                                  text: 'name : ${appController.userModels.last.name}',
                                  textStyle: Myconstant().h2Style(),
                                ),
                              ],
                            ),
                            Divider(
                              color: Myconstant.dark,
                              thickness: 1,
                            ),
                            Row(
                              children: [
                                ShowText(
                                  text:
                                      'email :  ${appController.userModels.last.email}',
                                  textStyle: Myconstant().h2Style(),
                                ),
                              ],
                            ),
                            Divider(
                              color: Myconstant.dark,
                              thickness: 1,
                            ),
                            Row(
                              children: [
                                ShowText(
                                  text: 'phone :  ${appController.userModels.last.phone}',
                                  textStyle: Myconstant().h2Style(),
                                ),
                              ],
                            ),
                            Divider(
                              color: Myconstant.dark,
                              thickness: 1,
                            )
                          ],
                        ),
                      );
        });
  }
}
