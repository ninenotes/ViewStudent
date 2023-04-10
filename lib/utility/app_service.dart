import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:viewstudent/models/covid_model.dart';
import 'package:viewstudent/models/model_5np1.dart';
import 'package:viewstudent/models/post_model.dart';
import 'package:viewstudent/utility/app_controller.dart';

class AppService {
  AppController appController = Get.put(AppController());

String timeToString({required Timestamp timestamp}){

DateFormat dateFormat = DateFormat('dd MMM yyyy HH:mm');
DateTime dateTime = timestamp.toDate();
return dateFormat.format(dateTime);
}






  Future<void> read5np1Data() async {
    if (appController.model5np1s.isNotEmpty) {
      appController.model5np1s.clear();
    }
    await FirebaseFirestore.instance.collection('5np1').orderBy('idStudent')
    .get().then((value) {
      for (var element in value.docs) {
        Model5np1 model5np1 = Model5np1.fromMap(element.data());
        appController.model5np1s.add(model5np1);
      }
    });
  }
  
  Future<void> read5tt1Data() async {
    if (appController.model5np1s.isNotEmpty) {
      appController.model5np1s.clear();
    }
    await FirebaseFirestore.instance.collection('5tt1').orderBy('idStudent')
    .get().then((value) {
      for (var element in value.docs) {
        Model5np1 model5np1 = Model5np1.fromMap(element.data());
        appController.model5np1s.add(model5np1);
      }
    });
  }
    Future<void> read5aa1Data() async {
    if (appController.model5np1s.isNotEmpty) {
      appController.model5np1s.clear();
    }
    await FirebaseFirestore.instance.collection('5aa1').orderBy('idStudent')
    .get().then((value) {
      for (var element in value.docs) {
        Model5np1 model5np1 = Model5np1.fromMap(element.data());
        appController.model5np1s.add(model5np1);
      }
    });
  }
   Future<void> read5mk1Data() async {
    if (appController.model5np1s.isNotEmpty) {
      appController.model5np1s.clear();
    }
    await FirebaseFirestore.instance.collection('5mk1').orderBy('idStudent')
    .get().then((value) {
      for (var element in value.docs) {
        Model5np1 model5np1 = Model5np1.fromMap(element.data());
        appController.model5np1s.add(model5np1);
      }
    });
  }
   Future<void> read5hv1Data() async {
    if (appController.model5np1s.isNotEmpty) {
      appController.model5np1s.clear();
    }
    await FirebaseFirestore.instance.collection('5hv1').orderBy('idStudent')
    .get().then((value) {
      for (var element in value.docs) {
        Model5np1 model5np1 = Model5np1.fromMap(element.data());
        appController.model5np1s.add(model5np1);
      }
    });
  }
  

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
