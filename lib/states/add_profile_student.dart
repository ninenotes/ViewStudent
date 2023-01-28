import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:viewstudent/models/user_model.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/utility/my_dialog.dart';
import 'package:viewstudent/widgets/show_button.dart';
import 'package:viewstudent/widgets/show_form.dart';
import 'package:viewstudent/widgets/show_icon_button.dart';
import 'package:viewstudent/widgets/show_image.dart';
import 'package:viewstudent/widgets/show_text.dart';

class AddProfileStudent extends StatefulWidget {
  const AddProfileStudent({super.key});

  @override
  State<AddProfileStudent> createState() => _AddProfileStudentState();
}

class _AddProfileStudentState extends State<AddProfileStudent> {
  File? file;
  String? idStudent, name, yearStudent, divition, teacher,email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ShowIconButton(
            iconData: Icons.cloud_upload,
            pressFunc: () {
              processAddProfile();
            },
          )
        ],
        title: ShowText(
          text: 'Add Profile Student',
          textStyle: Myconstant().h2whiteStyle(),
        ),
      ),
      body: ListView(
        children: [
          newImage(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                textInputType: TextInputType.number,
                hint: 'รหัสนักศึกษา :',
                iconData: Icons.fingerprint,
                changeFunc: (p0) {
                  idStudent = p0.trim();
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'ชื่อ-สกุล :',
                iconData: Icons.face,
                changeFunc: (p0) {
                  name = p0.trim();
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'ชั้นปี :',
                iconData: Icons.lock_clock,
                changeFunc: (p0) {
                  yearStudent = p0.trim();
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'แผนก :',
                iconData: Icons.house,
                changeFunc: (p0) {
                  divition = p0.trim();
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowForm(
                hint: 'อาจาย์ที่ปรึกษา :',
                iconData: Icons.people,
                changeFunc: (p0) {
                  teacher = p0.trim();
                },
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: ShowButton(
              lable: 'Add Profile',
              pressFunc: () {
                processAddProfile();
              },
            ),
          )
        ],
      ),
    );
  }

  Row newImage() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ShowIconButton(
          iconData: Icons.add_a_photo,
          pressFunc: () {
            processTakePhoto(source: ImageSource.camera);
          },
        ),
        Container(
          margin: const EdgeInsets.only(top: 16, bottom: 16),
          width: 250,
          height: 250,
          child: file == null
              ? const ShowImage(
                  path: 'images/studen.png',
                )
              : CircleAvatar(
                  radius: 125,
                  backgroundImage: FileImage(file!),
                ),
        ),
        ShowIconButton(
          iconData: Icons.add_photo_alternate,
          pressFunc: () {
            processTakePhoto(source: ImageSource.gallery);
          },
        )
      ],
    );
  }

  Future<void> processTakePhoto({required ImageSource source}) async {
    var reuslt = await ImagePicker().pickImage(
      source: source,
      maxWidth: 800,
      maxHeight: 800,
    );

    if (reuslt != null) {
      setState(() {
        file = File(reuslt.path);
      });
    }
  }

  void processAddProfile() {
    if (file == null) {
      MyDialog(context: context).normalDialog(
          title: 'No Image', subTitle: 'Please Tap Camera or Gallery');
    } else if ((checkSpace(string: idStudent)) ||
        (checkSpace(string: name)) ||
        (checkSpace(string: yearStudent)) ||
        (checkSpace(string: divition)) ||
        (checkSpace(string: teacher))) {
      MyDialog(context: context).normalDialog(
          title: 'มีช่องว่าง', subTitle: 'กรุณากรอกทุกช่อง ด้วยคะ');
    } else {
      processUploadImageAndInsertData();
    }
  }

  bool checkSpace({String? string}) {
    if (string?.isEmpty ?? true) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> processUploadImageAndInsertData() async {
    var user = FirebaseAuth.instance.currentUser;
    String uid = user!.uid;
    String nameImage = '$uid.jpg';

    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference reference = firebaseStorage.ref().child('profile/$nameImage');
    UploadTask uploadTask = reference.putFile(file!);
    await uploadTask.whenComplete(() async {
      await reference.getDownloadURL().then((value) async {
        String urlPorfile = value.toString();
        print('urlPfile ===> $urlPorfile ');

        UserModel userModeL = UserModel(
          idStudent: idStudent!,
          name: name!,
          yearStudent: yearStudent!,
          divition: divition!,
          teacher: teacher!,
          urlPfile: urlPorfile,
          typeuser: 'student', 

          
          
        );

        await FirebaseFirestore.instance
            .collection('user')
            .doc(uid)
            .set(userModeL.toMap())
            .then((value) {
          Navigator.pop(context);
        });
      });
    });
  }
}
