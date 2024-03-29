import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viewstudent/utility/app_controller.dart';
import 'package:viewstudent/utility/app_service.dart';
import 'package:viewstudent/widgets/show_text.dart';

import '../utility/contact.dart';

class covid extends StatefulWidget {
  const covid({Key? key}) : super(key: key);

  @override
  State<covid> createState() => _CovidPageState();
}

class _CovidPageState extends State<covid> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  List<Contact> contacts = List.empty(growable: true);

  int selectedIndex = -1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AppService().redCovid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('รายชื่อคนที่ติดโควิด'),
      ),
      body: GetX(
          init: AppController(),
          builder: (AppController appController) {
            print('covidModel --->${appController.covidModels.length}');
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // const SizedBox(height: 10),
                  // TextField(
                  //   controller: nameController,
                  //   decoration: const InputDecoration(
                  //       hintText: 'ชื่อนักศ๊กษา:',
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(
                  //         Radius.circular(10),
                  //       ))),
                  // ),
                  // const SizedBox(height: 10),
                  // TextField(
                  //   controller: contactController,
                  //   keyboardType: TextInputType.number,
                  //   maxLength: 11,
                  //   decoration: const InputDecoration(
                  //       hintText: 'เลขประจำตัวนักศีกษา:',
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(
                  //         Radius.circular(10),
                  //       ))),
                  // ),
                  // const SizedBox(height: 10),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     ElevatedButton(
                  //         onPressed: () {
                  //           //
                  //           String name = nameController.text.trim();
                  //           String contact = contactController.text.trim();
                  //           if (name.isNotEmpty && contact.isNotEmpty) {
                  //             setState(() {
                  //               nameController.text = '';
                  //               contactController.text = '';
                  //               contacts.add(Contact(name: name, contact: contact));
                  //             });
                  //           }
                  //           //
                  //         },
                  //         child: const Text('Save')),
                  //     ElevatedButton(
                  //         onPressed: () {
                  //           //
                  //           String name = nameController.text.trim();
                  //           String contact = contactController.text.trim();
                  //           if (name.isNotEmpty && contact.isNotEmpty) {
                  //             setState(() {
                  //               nameController.text = '';
                  //               contactController.text = '';
                  //               contacts[selectedIndex].name = name;
                  //               contacts[selectedIndex].contact = contact;
                  //               selectedIndex = -1;
                  //             });
                  //           }
                  //           //
                  //         },
                  //         child: const Text('Update')),
                  //   ],
                  // ),
                  const SizedBox(height: 10),
                  appController.covidModels.isEmpty
                      ? const SizedBox()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: appController.covidModels.length,
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
                                          text:
                                              'Name : ${appController.covidModels[index].name}'),
                                      ShowText(
                                          text:
                                              'ID : ${appController.covidModels[index].id}'),
                                    ],
                                  ),
                                  ShowText(
                                      text:
                                          'Date : ${appController.covidModels[index].date}'),
                                ],
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            );
          }),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
          foregroundColor: Colors.white,
          child: Text(
            contacts[index].name[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(contacts[index].contact),
          ],
        ),
        trailing: SizedBox(
          width: 70,
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    //
                    nameController.text = contacts[index].name;
                    contactController.text = contacts[index].contact;
                    setState(() {
                      selectedIndex = index;
                    });
                    //
                  },
                  child: const Icon(Icons.edit)),
              InkWell(
                  onTap: (() {
                    //
                    setState(() {
                      contacts.removeAt(index);
                    });
                    //
                  }),
                  child: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
