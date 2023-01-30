import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:viewstudent/widgets/books.dart';
import 'package:viewstudent/widgets/show_icon_button.dart';
import 'package:viewstudent/widgets/show_text.dart';
import 'package:searchable_listview/searchable_listview.dart';

import '../folder/book_page.dart';

class Search extends StatefulWidget {
  //const Search({super.key});



   
  @override
  State<Search> createState() => _Searchdat();
}

class _Searchdat extends State<Search> {
  
  Future pickImage() async {
    // your code

    setState(() {
      // your code
    });
  }
    

  final controller = TextEditingController();
  List<Book> books = allBooks;

  @override
  Widget build(BuildContext context) => Scaffold(
       
        
        body: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Book Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 3, 3, 3),
                    ),
                  ),
                ),
                onChanged: searchBook,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];

                  return ListTile(
                    leading: Image.network(
                      book.urLIamge,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                    title: Text(book.title),
                    onTap: () => Navigator.push(
                      context,
                      
                      MaterialPageRoute(
                        
                        builder: (context) => BookPage(book:book) ,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );

  void searchBook(String query) {
    final suggestions = allBooks.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();

      return bookTitle.contains(input);
    }).toList();

    setState(() => books = suggestions);
  }
  
  
  
  
}
