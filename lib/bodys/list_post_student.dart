import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viewstudent/utility/app_controller.dart';
import 'package:viewstudent/utility/app_service.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_text.dart';

class ListPostStudent extends StatefulWidget {
  const ListPostStudent({super.key});

  @override
  State<ListPostStudent> createState() => _ListPostStudentState();
}

class _ListPostStudentState extends State<ListPostStudent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppService().redPost();
  }

  @override
  Widget build(BuildContext context) {
    return GetX(
        init: AppController(),
        builder: (AppController appController) {
          print('postModel --->${appController.postModels.length}');
          return appController.postModels.isEmpty
              ? const SizedBox()
              : ListView.builder(
                  itemCount: appController.postModels.length,
                  itemBuilder: (context, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShowText(
                            text: appController.postModels[index].post,
                            textStyle: Myconstant().h2Style(),
                          ),
                            ShowText(
                            text: appController.postModels[index].timestamp.toDate().toString(),
                            textStyle: Myconstant().h3Style(),
                          ),
                            ShowText(
                            text: appController.postModels[index].namePost,
                            textStyle: Myconstant().h3Style(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        });
  }
}
