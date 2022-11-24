import 'package:flutter/material.dart';
import 'package:viewstudent/models/search_model.dart';
import 'package:viewstudent/widgets/show_icon_button.dart';
import 'package:viewstudent/widgets/show_text.dart';
import 'package:searchable_listview/searchable_listview.dart';




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Search(),
    );
  }

class Search extends StatelessWidget {
  Search({super.key});




  static List<SearchModel> main_search_list = [
    SearchModel("ปวช2", 2022, 10,"https://f.ptcdn.info/935/046/000/1477921453-10134656a3-o.jpg"),
    SearchModel("ปวช3",2022, 10,"https://f.ptcdn.info/912/046/000/ofuy4rp6wlLV2PcntKl-o.png")
  ];
  
List<SearchModel> display_list = List.from(main_search_list);

  void updateList(String value) {
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a data",
              style: TextStyle(
                color: Color.fromARGB(255, 134, 129, 129),
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 241, 241, 241),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search from data",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.purple.shade900,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: display_list.length,
              itemBuilder: (context, index) => ListTile(
                contentPadding: EdgeInsets.all(8.0),
                title: Text(
                  display_list[index].search_title!,
                  style: TextStyle(
                    color: Color.fromARGB(255, 26, 25, 25),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '${display_list[index].search_release_year!}',
                  style: TextStyle(
                    color: Color.fromARGB(153, 27, 26, 26),
                  ),
                ),
                trailing:  Text("${display_list[index].rating}",style: TextStyle(color: Colors.red),
                ),
                leading: Image.network(display_list[index].search_poster_url!),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
