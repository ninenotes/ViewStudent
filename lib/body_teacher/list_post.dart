import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viewstudent/models/post_model.dart';
import 'package:viewstudent/utility/app_controller.dart';
import 'package:viewstudent/utility/app_service.dart';
import 'package:viewstudent/utility/my_dialog.dart';
import 'package:viewstudent/widgets/show_form.dart';
import 'package:viewstudent/widgets/show_icon_button.dart';
import 'package:viewstudent/widgets/show_text.dart';
import 'package:path/path.dart';
import 'package:viewstudent/widgets/widget_image_network.dart';

class ListPost extends StatefulWidget {
  const ListPost({super.key});

  @override
  State<ListPost> createState() => _ListPostState();
}

class _ListPostState extends State<ListPost> {
  String? post;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    AppService().redPost();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, BoxConstraints boxConstraints) {
      return GetX(
          init: AppController(),
          builder: (AppController appController) {
            print('postModels ---> ${appController.postModels.length}');
            return SizedBox(
              width: boxConstraints.maxWidth,
              height: boxConstraints.maxHeight,
              child: Stack(
                children: [
                  appController.postModels.isEmpty
                      ? const SizedBox()
                      : SizedBox(
                          width: boxConstraints.maxWidth,
                          height: boxConstraints.maxHeight - 50,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: appController.postModels.length,
                            itemBuilder: (context, index) => Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ShowText(
                                            text: appController
                                                .postModels[index].namePost),
                                        ShowText(
                                            text: appController
                                                .postModels[index].post),
                                        appController.postModels[index]
                                                .urlImage!.isEmpty
                                            ? const SizedBox()
                                            : SizedBox(width: 250,
                                              child: WidgetImageNetwork(
                                                  urlImage: appController
                                                      .postModels[index]
                                                      .urlImage!),
                                            ),
                                        ShowText(
                                            text: AppService().timeToString(timestamp: appController.postModels[index].timestamp)),
                                      ],
                                    ),
                                    ShowIconButton(
                                        iconData: Icons.delete,
                                        pressFunc: () async {
                                          final result = await showDialog<bool>(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title:
                                                  const Text('คุณแน่ใจไหม ?'),
                                              content: const Text(
                                                  'ถ้าต้องลบ เลือก Delete'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, true),
                                                  child: const Text('Delete'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          context, false),
                                                  child: const Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffF02E65)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );

                                          if (result == null || !result) {
                                            return;
                                          }
                                          String docId =
                                              appController.docIdPosts[index];
                                          print('docId ----> $docId');

                                          await FirebaseFirestore.instance
                                              .collection('post')
                                              .doc(docId)
                                              .delete()
                                              .then((value) => null);
                                        }
                                        // String docId =
                                        //     appController.docIdPosts[index];
                                        // print('docId ----> $docId');

                                        // await FirebaseFirestore.instance
                                        //     .collection('post')
                                        //     .doc(docId)
                                        //     .delete()
                                        //     .then((value) => null);

                                        )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: boxConstraints.maxWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ShowForm(
                            hint: 'Post',
                            // iconData: Icons.newspaper,
                            changeFunc: (p0) {
                              post = p0.trim();
                            },
                            textEditingController: textEditingController,
                          ),
                          Row(
                            children: [
                              ShowIconButton(
                                iconData: Icons.newspaper,
                                pressFunc: () async {
                                  if (post?.isEmpty ?? true) {
                                    MyDialog(context: context).normalDialog(
                                        title: 'Post?',
                                        subTitle: 'Plase Fill Post');
                                  } else {
                                    if (appController.files.isEmpty) {
                                      PostModel postModel = PostModel(
                                          uidPost: appController.uidLogins.last,
                                          namePost: appController
                                              .userModels.last.name,
                                          urlPost: appController
                                              .userModels.last.urlPfile,
                                          post: post!,
                                          urlImage: '',
                                          timestamp: Timestamp.fromDate(
                                              DateTime.now()));

                                      print(
                                          'postModel ===> ${postModel.toMap()}');

                                      await FirebaseFirestore.instance
                                          .collection('post')
                                          .doc()
                                          .set(postModel.toMap())
                                          .then((value) {
                                        print('Insert Post Success');
                                      });

                                      textEditingController.text = '';
                                    } else {
                                      String nameFile = basename(
                                          appController.files.last.path);

                                      FirebaseStorage storage =
                                          FirebaseStorage.instance;
                                      Reference reference =
                                          storage.ref().child('Post/$nameFile');
                                      UploadTask uploadTask = reference
                                          .putFile(appController.files.last);
                                      await uploadTask.whenComplete(() async {
                                        await reference
                                            .getDownloadURL()
                                            .then((value) async {
                                          PostModel postModel = PostModel(
                                              uidPost:
                                                  appController.uidLogins.last,
                                              namePost: appController
                                                  .userModels.last.name,
                                              urlPost: appController
                                                  .userModels.last.urlPfile,
                                              post: post!,
                                              urlImage: value,
                                              timestamp: Timestamp.fromDate(
                                                  DateTime.now()));

                                          print(
                                              'postModel ===> ${postModel.toMap()}');

                                          await FirebaseFirestore.instance
                                              .collection('post')
                                              .doc()
                                              .set(postModel.toMap())
                                              .then((value) {
                                            print('Insert Post Success');
                                          });

                                          textEditingController.text = '';
                                          appController.files.clear();
                                        });
                                      });
                                    }
                                  }
                                },
                              ),
                              appController.files.isEmpty
                                  ? ShowIconButton(
                                      iconData: Icons.add_photo_alternate,
                                      pressFunc: () async {
                                        var result = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.gallery,
                                                maxWidth: 800,
                                                maxHeight: 800);
                                        if (result != null) {
                                          File file = File(result.path);
                                          appController.files.add(file);
                                        }
                                      },
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.file(
                                        appController.files.last,
                                        width: 36,
                                        height: 36,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          });
    });
  }
}
