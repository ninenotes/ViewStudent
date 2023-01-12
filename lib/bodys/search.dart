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
    SearchModel("6430901009", 2022, 10,"https://scontent.fbkk17-1.fna.fbcdn.net/v/t1.15752-9/317809054_1516030798895674_5621883006536025558_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=ae9488&_nc_eui2=AeGx5xjOMTBHwhK05sCXCnXgzJMIg1gw1YrMkwiDWDDViistpVa8qhFdj7zVIgtX_yJ-rV0dTYwGRvFNCd5DPgHV&_nc_ohc=COlfrVWND8EAX8MbCDM&_nc_ht=scontent.fbkk17-1.fna&oh=03_AdTC16yWcS0UezCt6rs9oAkEguuqTkrsBkaPGFDns9H4dg&oe=63DE6A74"),
    SearchModel("6430901010",2022, 10,"https://scontent.fbkk17-1.fna.fbcdn.net/v/t1.15752-9/322661652_1593237474458187_2762383477982546676_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=ae9488&_nc_eui2=AeGJjBuVvNwmQD9xoKlDdCUsUWN_3_muJyNRY3_f-a4nI6Y7zCIWR1EusLxwxAagOTDU8340FBV7kCCioOaemjOu&_nc_ohc=3Y_1EDyVs0wAX9NqzkH&_nc_ht=scontent.fbkk17-1.fna&oh=03_AdSYv0rwBcIhHuGfyTxo0pk47bUsfpz6ZAJ4Of2bGzeuUw&oe=63DE7436")
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
