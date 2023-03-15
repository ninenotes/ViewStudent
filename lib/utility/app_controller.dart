import 'package:get/get.dart';
import 'package:viewstudent/bodys/COVID_19.dart';
import 'package:viewstudent/models/covid_model.dart';
import 'package:viewstudent/models/post_model.dart';
import 'package:viewstudent/models/user_model.dart';

class AppController extends GetxController{

  RxList<UserModel> userModels = <UserModel>[].obs;
  RxList<String> uidLogins = <String>[].obs;
  RxList<String> docIdPosts =<String>[].obs;

  RxInt indexBody = 0.obs;

  RxList<PostModel> postModels = <PostModel>[].obs;

  RxList<CovidModel> covidModels  = <CovidModel>[].obs;
  RxList<String> docIdCovids = <String>[].obs;

  RxList<int> indexUpdates =<int>[].obs;
}