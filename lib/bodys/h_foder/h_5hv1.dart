import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viewstudent/utility/app_controller.dart';
import 'package:viewstudent/utility/app_service.dart';
import 'package:viewstudent/utility/dialog.dart';
import 'package:viewstudent/utility/my_dialog.dart';
import 'package:viewstudent/widgets/widget_image_network.dart';

class History5hv1 extends StatefulWidget {
  const History5hv1({super.key});

  @override
  State<History5hv1> createState() => _History5hv1State();
}

class _History5hv1State extends State<History5hv1> {
  @override

  // Title List Here
  // var titleList = [
  //   "64309010001",
  //   "64309010002",
  //   "64309010003",
  //   "64309010004",
  //   "64309010005",
  //   "64309010006",
  //   "64309010007",
  //   "64309010008",
  // ];
  // var comment = [
  //   "วันเดือนปีเกิด: 24/12/2545\n สัญชาติ: ไทย \nกรุ๊ปเลือด: O\n เบอร์โทรศัพท์ : 0843981765\n ที่อยู่: 6/7 หมู่ 9 ต.บางแค\n ผู้ปกครอง:กนกรดา หงษ์รัก\n เบอร์ผู้ปกครอง: 0997210400",
  //   "วันเดือนปีเกิด: 24/03/2546\n สัญชาติ: ไทย \nกรุ๊ปเลือด: B\n เบอร์โทรศัพท์ : 0954728513\n ที่อยู่: 112/1 หมู่ 6 ต.นางตะเคียน\n ผู้ปกครอง:กุลนิดา ทองคำ\n เบอร์ผู้ปกครอง: 092040205",
  //   "วันเดือนปีเกิด: 16/05/2546\n สัญชาติ: ไทย \nกรุ๊ปเลือด: O\n เบอร์โทรศัพท์ : 0995487632\n ที่อยู่: 77/4 หมู่ 4 ต.ท้ายหาด\n ผู้ปกครอง:ขวัญฤดี นวนตา\n เบอร์ผู้ปกครอง: 0881230495",
  //   "วันเดือนปีเกิด: 23/12/2545\n สัญชาติ: ไทย \nกรุ๊ปเลือด: O \n เบอร์โทรศัพท์ : 0812340909\n ที่อยู่: 31/1 หมู่ 5 ต.แหลมใหญ่\n ผู้ปกครอง:ปรียาดา คุ้มศิริ\n เบอร์ผู้ปกครอง: 09233929199 ",
  //   "วันเดือนปีเกิด: 13/12/2545\n สัญชาติ: ไทย \nกรุ๊ปเลือด: A \n เบอร์โทรศัพท์ : 0881866709\n ที่อยู่: 92/1 หมู่ 4 ต.ลาดใหญ่\n ผู้ปกครอง:นพรรณพ มาฆะสวัสดิ์\n เบอร์ผู้ปกครอง: 0842859539 ",
  //   "วันเดือนปีเกิด: 22/09/2545\n สัญชาติ: ไทย \nกรุ๊ปเลือด: O \n เบอร์โทรศัพท์ : 0844212104\n ที่อยู่: 22/5 หมู่ 5 ต.คลองเขิน\n ผู้ปกครอง:พรรษสร จำปาเต็ม\n เบอร์ผู้ปกครอง: 0939898174",
  //   "วันเดือนปีเกิด: 25/01/2546\n สัญชาติ: ไทย \nกรุ๊ปเลือด: O\n เบอร์โทรศัพท์ : 08229789712\n ที่อยู่: 12/1 หมู่ 2 ต.บางแก้ว\n ผู้ปกครอง:ภคมน จงสมจิต\n เบอร์ผู้ปกครอง: 0909712481",
  //   "วันเดือนปีเกิด: 17/01/2545\n สัญชาติ: ไทย \nกรุ๊ปเลือด: A\n เบอร์โทรศัพท์ : 0804212765\n ที่อยู่: 22/8 หมู่ 4 ต.	บ้านปรก\n ผู้ปกครอง:จิณห์วรา อินทร์จันทร์\n เบอร์ผู้ปกครอง: 0869774349",
  // ];

  // Description List Here
  // ฟห
  @override
  void initState() {
    super.initState();

    AppService().read5hv1Data();
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get Device Width
    double width = MediaQuery.of(context).size.width * 0.6;

    return GetX(
        init: AppController(),
        builder: (AppController appController) {
          print('model5np1 -->${appController.model5np1s.length}');
          return Scaffold(
            appBar: AppBar(
              // App Bar
              title: Text(
                "ประวัตินักศึกษา  5ฮว1",
                style: TextStyle(color: Colors.black),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            // Main List View With Builder
            body: appController.model5np1s.isEmpty
                ? const SizedBox()
                : ListView.builder(
                    itemCount: appController.model5np1s.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          showDialogFunc(
                              context,
                              appController.model5np1s[index].image,
                              appController.model5np1s[index].idStudent,
                              appController.model5np1s[index].name,
                          birthDate: appController.model5np1s[index].date,
                          nation: appController.model5np1s[index].nationality,
                           bloodtype: appController.model5np1s[index].bloodtype,
                          phone: appController.model5np1s[index].phone,
                          address: appController.model5np1s[index].address,
                          nameParent: appController.model5np1s[index].nameparent,
                          phoneParent: appController.model5np1s[index].phone2);
                          //  MyDialog(context: context).normalDialog(
                          //             title: titleList[index],
                          //             subTitle:
                          //                 descList[index]);
                        },
                        // Card Which Holds Layout Of ListView Item
                        child: Card(
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: WidgetImageNetwork(
                                    urlImage:
                                        appController.model5np1s[index].image),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      appController.model5np1s[index].idStudent,
                                      style: const TextStyle(
                                        fontSize: 25,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                        // height: 10,
                                        ),
                                    Container(
                                      width: width,
                                      child: Text(
                                        appController.model5np1s[index].name,
                                        maxLines: 5,
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          );
        });
  }
}

// This is a block of Model Dialog
showDialogFunc(context, img, title, desc,
    {required String birthDate,
    required String  bloodtype,
    required String nation,
    required String phone,
    required String address,
    required String nameParent,
    required String phoneParent}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(15),
            height: 450,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SizedBox(
                    width: 330,
                    height: 160,
                    child: WidgetImageNetwork(urlImage: img),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 73, 151, 224),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Center(
                  child: Text(
                    desc,
                    style: const TextStyle(
                      fontSize: 20,
                      
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'วันเดือนปีเกิด: $birthDate',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                  
                ),
                            Text(
                  'สัญชาติ:$nation',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                             Text(
                  'กรุ๊ปเลือด:$bloodtype',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 Text(
                  'เบอร์โทร: $phone',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 Text(
                  'ที่อยู้:$address',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 Text(
                  'ผู้ปกครอง:$nameParent',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
     
                 Text(
                  'เบอรฺผู้ปกครอง:$phoneParent',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
               
              ],
            ),
          ),
        ),
      );
    },
  );
}
