import 'dart:io';

import 'package:get/get.dart';
import 'package:viewstudent/bodys/COVID_19.dart';
import 'package:viewstudent/models/covid_model.dart';
import 'package:viewstudent/models/model_5np1.dart';
import 'package:viewstudent/models/post_model.dart';
import 'package:viewstudent/models/user_model.dart';

class AppController extends GetxController {
  RxList<UserModel> userModels = <UserModel>[].obs;
  RxList<String> uidLogins = <String>[].obs;
  RxList<String> docIdPosts = <String>[].obs;
  RxInt indexBody = 0.obs;
  RxList<PostModel> postModels = <PostModel>[].obs;
  RxList<CovidModel> covidModels = <CovidModel>[].obs;
  RxList<String> docIdCovids = <String>[].obs;
  RxList<int> indexUpdates = <int>[].obs;
  RxList<Model5np1> model5np1s = <Model5np1>[].obs;
  RxList<File> files = <File>[].obs;
}
