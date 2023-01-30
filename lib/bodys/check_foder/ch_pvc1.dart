import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utility/my_constant.dart';
import '../../widgets/show_text.dart';

class ch_pvc1 extends StatelessWidget {
  const ch_pvc1({super.key});

  @override
  Widget build(BuildContext context) {
    
return Scaffold(
      
      appBar: AppBar(
        title: ShowText(
          text: 'ปวช 1',
          textStyle: Myconstant().h2whiteStyle(),
        ),
      ),
     body: WebView(
       initialUrl: 'https://checking-regulatory-students.on.drv.tw/%E0%B8%95%E0%B8%A3%E0%B8%A7%E0%B8%88%E0%B8%AA%E0%B8%A0%E0%B8%B2%E0%B8%9E3/%E0%B8%9B%E0%B8%A7%E0%B8%8A.1/',
       javascriptMode: JavascriptMode.unrestricted,
    ));
  }
   
  }
