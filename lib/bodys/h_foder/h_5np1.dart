

import 'package:flutter/material.dart';
import 'package:viewstudent/utility/dialog.dart';
import 'package:viewstudent/utility/my_dialog.dart';

class History5np1 extends StatefulWidget {
  const History5np1({super.key});

  @override
  State<History5np1> createState() => _History5np1State();
}

class _History5np1State extends State<History5np1> {
  @override

     
  // Title List Here
  var titleList = [
    "64309010001",
    "64309010002",
    "64309010003",
    "64309010004",
    "64309010005",
    "64309010006",
    "64309010007",
     "64309010008",
    
  
  ];
  var comment = [
   "วันเดือนปีเกิด: 24/12/2545\nสัญชาติ: ไทย \nกรุ๊ปเลือด: O\nเบอร์โทรศัพท์ : 0843981765\n ที่อยู่: 6/7 หมู่ 9 ต.บางแค\n ผู้ปกครอง:กนกรดา หงษ์รัก",
    "วันเดือนปีเกิด: 24/03/2546\nสัญชาติ: ไทย \nกรุ๊ปเลือด: B\nเบอร์โทรศัพท์ : 0954728513\n ที่อยู่: 112/1 หมู่ 6 ต.นางตะเคียน \n ผู้ปกครอง:กุลนิดา ทองคำ",
    "วันเดือนปีเกิด: 16/05/2546\nสัญชาติ: ไทย \nกรุ๊ปเลือด: O\nเบอร์โทรศัพท์ : 0995487632\n ที่อยู่: 77/4 หมู่ 4 ต.ท้ายหาด\n ผู้ปกครอง:ขวัญฤดี นวนตา",
    "วันเดือนปีเกิด: 23/12/2545\nสัญชาติ: ไทย \nกรุ๊ปเลือด: O \nเบอร์โทรศัพท์ : 0812340909\n ที่อยู่: 31/1 หมู่ 5 ต.แหลมใหญ่\n ผู้ปกครอง:ปรียาดา คุ้มศิริ  ",
   "วันเดือนปีเกิด: 13/12/2545\nสัญชาติ: ไทย \nกรุ๊ปเลือด: A \nเบอร์โทรศัพท์ : 0881866709\n ที่อยู่: 92/1 หมู่ 4 ต.ลาดใหญ่\n ผู้ปกครอง:นพรรณพ มาฆะสวัสดิ์ ",
    "วันเดือนปีเกิด: 22/09/2545\nสัญชาติ: ไทย \nกรุ๊ปเลือด: O \nเบอร์โทรศัพท์ : 0844212104\n ที่อยู่: 22/5 หมู่ 5 ต.คลองเขิน\n ผู้ปกครอง:พรรษสร จำปาเต็ม",
    "วันเดือนปีเกิด: 25/01/2546\nสัญชาติ: ไทย \nกรุ๊ปเลือด: O\nเบอร์โทรศัพท์ : 08229789712\n ที่อยู่: 12/1 หมู่ 2 ต.บางแก้ว\n ผู้ปกครอง:ภคมน จงสมจิต",
    "วันเดือนปีเกิด: 17/01/2545\nสัญชาติ: ไทย \nกรุ๊ปเลือด: A\nเบอร์โทรศัพท์ : 0804212765\n ที่อยู่: 22/8 หมู่ 4 ต.	บ้านปรก\n ผู้ปกครอง:จิณห์วรา อินทร์จันทร์",
  ];

  // Description List Here
  var descList = [
    "นางสาวปภาวดี หงษ์รัก",
    "นางสาววนัชพร ทองคำ",
    "นายคณนันท์ นวนตา",
    "นายจิระเดช   คุ้มศิริ",
    "นายเทพนิมิตร มาฆะสวัสดิ์ ",
    "นาธนดล  จำปาเต็ม",
    "นายนิตธานีย์  จงสมจิต  ",
    "นายปืยพัทธ์ อินทร์จันทร์  ",
  ];

  // Image Name List Here
  var imgList = [
    "images/num1.jpg",
    "images/2.jpg",
    "images/3.jpg",
    "images/4.jpg",
    "images/5.jpg",
     "images/6.jpg",
     "images/7.jpg",
     "images/8.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    // MediaQuery to get Device Width
     double width = MediaQuery.of(context).size.width * 0.6;
     

    return Scaffold(
      appBar: AppBar(
        // App Bar
        title: Text(
          "5นพ1",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      // Main List View With Builder
      body: ListView.builder(
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
          
              
               showDialogFunc(context, imgList[index], titleList[index], descList[index],comment[index]);
            //  MyDialog(context: context).normalDialog(
            //             title: titleList[index],
            //             subTitle:
            //                 descList[index]);
              
            },
            // Card Which Holds Layout Of ListView Item
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(imgList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleList[index],
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          // height: 10,
                        ),
                        Container(
                          width: width,
                          child: Text(
                            descList[index],
                            maxLines: 5,
                            style: TextStyle(
                                fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
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
  }
}

// This is a block of Model Dialog 
showDialogFunc(context, img, title, desc,comment) {
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
            padding: EdgeInsets.all(15),
            height: 480,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    img,
                    width: 200,
                    height: 150,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 233, 14, 14),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 
                 Text(
                  desc,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  
                  comment,
                  
                
                  style: TextStyle(
                    
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Container(
                //   // width: 200,
                //   child: Align(
                //     alignment: Alignment.center,
                //     child: Text(
                //       desc,
                //       maxLines: 3,
                //       style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 0, 0, 0)),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
    },
      
    );
  }
