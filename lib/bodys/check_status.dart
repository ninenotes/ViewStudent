import 'package:flutter/material.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_text.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckStuden extends StatelessWidget {
  const CheckStuden({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShowText(
          text: 'สถานะตรวจสะภาพ',
          textStyle: Myconstant().h2whiteStyle(),
        ),
      ),
         body: WebView(
       initialUrl: 'https://sites.google.com/u/0/d/1qIA1kO5ikTijwb07iUPwuqo7Eul5NCBZ/preview?fbclid=IwAR0tR_2wcWVSRirdrSARLD2ooPzosBS5s-lM9ilqU25jwNKF6WFjMbMhD0I&pli=1&authuser=0',
       javascriptMode: JavascriptMode.unrestricted,
    )
    );
  }
}
