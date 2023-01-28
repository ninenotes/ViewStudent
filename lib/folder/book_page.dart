import 'package:flutter/material.dart';
import 'package:pdf_viewer_jk/pdf_viewer_jk.dart';
import 'package:viewstudent/widgets/books.dart';

class BookPage extends StatelessWidget {
  final Book book;

  const BookPage({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(book.title),
        ),
        body: InteractiveViewer(
          child:
           Image.network(
            book.urLIamgeJP,
          ),
        ),
      );
}
