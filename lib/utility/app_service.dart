import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:viewstudent/models/covid_model.dart';
import 'package:viewstudent/models/post_model.dart';
import 'package:viewstudent/utility/app_controller.dart';

class AppService {
  AppController appController = Get.put(AppController());

  Future<void> redCovid() async {
    FirebaseFirestore.instance.collection('covid').snapshots().listen((event) {
      if (appController.covidModels.isNotEmpty) {
        appController.covidModels.clear();
        appController.docIdCovids.clear();
      }

      for (var element in event.docs) {
        CovidModel covidModel = CovidModel.fromMap(element.data());
        appController.covidModels.add(covidModel);
        appController.docIdCovids.add(element.id);
      }
    });
  }

  Future<void> redPost() async {
    FirebaseFirestore.instance
        .collection('post')
        .orderBy('timestamp')
        .snapshots()
        .listen((event) {
      if (appController.postModels.isNotEmpty) {
        appController.postModels.clear();
        appController.docIdPosts.clear();
      }

      for (var element in event.docs) {
        PostModel postModel = PostModel.fromMap(element.data());
        appController.postModels.add(postModel);

        appController.docIdPosts.add(element.id);

      
      }
    });
  }
}
