import 'package:flutter/material.dart';
import 'package:pdf_viewer_jk/pdf_viewer_jk.dart';
import 'package:photo_view/photo_view.dart';
import 'package:viewstudent/models/post_model.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/books.dart';

class Imagepost extends StatelessWidget {
  final PostModel postModel;

  const Imagepost({Key? key, required this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        
        
        body: 
      
        
        
        PhotoView(imageProvider: NetworkImage(postModel.urlImage!)),
      

      );
      
}
