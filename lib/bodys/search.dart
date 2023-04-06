import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viewstudent/states/display_detail_student.dart';
import 'package:viewstudent/utility/app_controller.dart';
import 'package:viewstudent/utility/app_service.dart';
import 'package:viewstudent/widgets/books.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    AppService().read5np1Data();
  }

  @override
  Widget build(BuildContext context) => GetX(
      init: AppController(),
      builder: (AppController appController) {
        print('model5np1 ===> ${appController.model5np1s.length}');
        return Scaffold(
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
                      onTap: () {
                        print('book ---> ${book.title}');


                        bool havedata = false;

                        for (var element in appController.model5np1s) {

                          if (book.title == element.name) {
                            havedata = true;
                                Get.to(DisplayDetailStudent(model5np1: element));
                            
                          }
                          
                        }

                        print('havedata ---> ${havedata}');

                      if (!havedata) {
                         Navigator.push(
                          context,

                          MaterialPageRoute(

                            builder: (context) => BookPage(book:book) ,
                          ),
                        );
                        
                      }
                     
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      });

  void searchBook(String query) {
    final suggestions = allBooks.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();

      return bookTitle.contains(input);
    }).toList();

    setState(() => books = suggestions);
  }
}
