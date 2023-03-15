import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viewstudent/models/post_model.dart';
import 'package:viewstudent/utility/app_controller.dart';
import 'package:viewstudent/utility/app_service.dart';
import 'package:viewstudent/utility/my_dialog.dart';
import 'package:viewstudent/widgets/show_form.dart';
import 'package:viewstudent/widgets/show_icon_button.dart';
import 'package:viewstudent/widgets/show_text.dart';

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
                                child: Row(
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
                                      ],
                                    ),
                                    ShowIconButton(
                                      iconData: Icons.delete,
                                      pressFunc: () async {
                                        String docId =
                                            appController.docIdPosts[index];
                                        print('docId ----> $docId');

                                        await FirebaseFirestore.instance
                                            .collection('post')
                                            .doc(docId)
                                            .delete()
                                            .then((value) => null);
                                      },
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
                          ShowIconButton(
                            iconData: Icons.newspaper,
                            pressFunc: () async {
                              if (post?.isEmpty ?? true) {
                                MyDialog(context: context).normalDialog(
                                    title: 'Post?',
                                    subTitle: 'Plase Fill Post');
                              } else {
                                PostModel postModel = PostModel(
                                    uidPost: appController.uidLogins.last,
                                    namePost:
                                        appController.userModels.last.name,
                                    urlPost:
                                        appController.userModels.last.urlPfile,
                                    post: post!,
                                    timestamp:
                                        Timestamp.fromDate(DateTime.now()));

                                print('postModel ===> ${postModel.toMap()}');

                                await FirebaseFirestore.instance
                                    .collection('post')
                                    .doc()
                                    .set(postModel.toMap())
                                    .then((value) {
                                  print('Insert Post Success');
                                });

                                textEditingController.text = '';
                              }
                            },
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
