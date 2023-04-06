import 'package:flutter/material.dart';
import 'package:viewstudent/bodys/showscore5np1/showscore1.dart';
import 'package:viewstudent/bodys/showscore5np1/showscore2.dart';
import 'package:viewstudent/bodys/showscore5np1/showscore3.dart';
import 'package:viewstudent/bodys/showscore5np1/showscore4.dart';
import 'package:viewstudent/bodys/showscore5np1/showscore5.dart';
import 'package:viewstudent/bodys/showscore5np1/showscore6.dart';
import 'package:viewstudent/bodys/showscore5np1/showscore7.dart';
import 'package:viewstudent/bodys/showscore5np1/showscore8.dart';
import 'package:viewstudent/bodys/showscore5np1/sumshowscore1.dart';
import 'package:viewstudent/bodys/showscore5np1/sumshowscore2.dart';
import 'package:viewstudent/bodys/showscore5np1/sumshowscore3.dart';
import 'package:viewstudent/bodys/showscore5np1/sumshowscore4.dart';
import 'package:viewstudent/bodys/showscore5np1/sumshowscore5.dart';
import 'package:viewstudent/bodys/showscore5np1/sumshowscore6.dart';
import 'package:viewstudent/bodys/showscore5np1/sumshowscore7.dart';
import 'package:viewstudent/bodys/showscore5np1/sumshowscore8.dart';
import 'package:viewstudent/folder/pvc1.dart';

class Score5np1 extends StatefulWidget {
  const Score5np1({super.key});

  @override
  State<Score5np1> createState() => _Score5np1State();
}

class _Score5np1State extends State<Score5np1> {
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

  // Description List Here
  var descList = [
    "ปภาวดี หงษ์รัก",
    "วนัชพร ทองคำ",
    " คณนันท์ นวนตา",
    "จิระเดช   คุ้มศิริ",
    "เทพนิมิตร มาฆะสวัสดิ์",
    "ธนดล  จำปาเต็ม",
    "นาย นิตธานีย์  จงสมจิต  ",
    "นายปืยพัทธ์ อินทร์จันทร์",
  ];

  // Image Name List Here
  var imgList = [
    "images/1.jpg",
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
               switch (titleList[index]) {
              case '64309010001':
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SumShowscore1(),
                    ));

                break;
              case '64309010002':
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SumShowscore2(),
                    ));
                break;
              case '64309010003':
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SumShowscore3(),
                    ));

              break;

              case '64309010004':
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SumShowscore4(),
                    ));

              break;

               case '64309010005':
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SumShowscore5(),
                    ));

              break;
                case '64309010006':
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SumShowscore6(),
                    ));

              break;
                case '64309010007':
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SumShowscore7(),
                    ));

              break;
                case '64309010008':
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SumShowscore8(),
                    ));

              break;
              

              default:
            }
              // // This Will Call When User Click On ListView Item
              // showDialogFunc(context, imgList[index], titleList[index], descList[index]);

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
                          height: 10,
                        ),
                        Container(
                          width: width,
                          child: Text(
                            descList[index],
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[500]),
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
showDialogFunc(context, img, title, desc) {
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
            height: 320,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    img,
                    width: 200,
                    height: 200,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 200,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      desc,
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
      
    );
  }
