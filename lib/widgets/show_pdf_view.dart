// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pdf_viewer_jk/pdf_viewer_jk.dart';

import 'package:viewstudent/models/score_model.dart';
import 'package:viewstudent/utility/my_constant.dart';
import 'package:viewstudent/widgets/show_pdf_view.dart';

class ShowPdfView extends StatefulWidget {
  final ScoreModel scoreModel;

  const ShowPdfView({
    Key? key,
    required this.scoreModel,
  }) : super(key: key);

  @override
  State<ShowPdfView> createState() => _ShowPdfViewState();
}

class _ShowPdfViewState extends State<ShowPdfView> {
  late ScoreModel model;
  PDFDocument pdfDocument = PDFDocument();
  
  

  @override
  void initState() {
    super.initState();
    model = widget.scoreModel;
    createPDFDocument();
  }

  Future<Null> createPDFDocument() async {
    try {
     
      var reuslt = await PDFDocument.fromURL(model.pdf);
      setState(() {
        pdfDocument = reuslt;
      });
    } catch (e) {
      print('e ==> ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name == null ? 'Red data' : model.name),
      ),
      body: pdfDocument == null
          ? Center(child: CircularProgressIndicator.adaptive())
          : PDFViewer(document: pdfDocument ),
    );
  }
}
