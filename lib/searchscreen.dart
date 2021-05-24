
import 'package:flutter/material.dart';
import 'package:the_social_media/profilescreen.dart';
import 'package:the_social_media/profilescreenberke.dart';
import 'package:the_social_media/profilescreennilay.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("Search"),
        actions: [
          IconButton(
              color: Color.fromRGBO(0, 100, 128, 1),
              icon: Icon(Icons.search), onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          })
        ],
      ),
      drawer: Drawer(),
      body: Center(
        child: Container(
          child: Image.asset("assets/images/karekod.png"),
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String>{

  final names = [
    "Kylan Cross",
    "Maleeha Gill",
    "Florrie West",
    "Mcneill",
    "Martyna Mcdermott",
    "Deanne Kline",
    "Anniyah Little",
    "Jimmy Truong",
    "Cillian Bolton",
    "Matylda Boone",
    "Sefa Özkan",
    "Nilay Çomak",
    "Berke Öztürk",
  ];

  final recentNames=[
        "Martyna Mcdermott",
        "Deanne Kline",
        "Anniyah Little",
        "Jimmy Truong",
];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(
        color: Color.fromRGBO(0, 100, 128, 1),
        icon: Icon(Icons.clear), onPressed: (){
      query = "";
    }),];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          color: Color.fromRGBO(0, 100, 128, 1),
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,),
          onPressed: (){
            close(context, null);
          });
  }

  @override
  Widget buildResults(BuildContext context) {
      return ProfileScreenBerke();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?recentNames:names.where((p) => p.startsWith(query)).toList();
    return ListView.builder(itemBuilder: (context,index)=> ListTile(
        onTap: (){
          showResults(context);
        },
        leading: Icon(Icons.account_circle),
        title: RichText(text: TextSpan(text:suggestionList[index].substring(0,query.length),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),children:
        [
          TextSpan(
            text: suggestionList[index].substring(query.length),
            style: TextStyle(color: Colors.grey)
          ),
        ]),),
    ),
      itemCount: suggestionList.length,
    );

  }

}