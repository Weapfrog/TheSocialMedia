import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:the_social_media/profilescreen.dart';
import 'package:the_social_media/profilescreenberke.dart';
import 'package:the_social_media/searchscreen.dart';
import 'package:the_social_media/settingsscreen.dart';


class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  int _currentIndex = 0;

  final tabs=[
    ProfileScreen(),
    SearchScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromRGBO(0, 100, 128, 1),
        currentIndex: _currentIndex,
        items: [

          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: "Profil",
              backgroundColor: Color.fromRGBO(0, 100, 128, 1),

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Arama",
              backgroundColor: Color.fromRGBO(0, 100, 128, 1)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Ayarlar",
            backgroundColor: Color.fromRGBO(0, 100, 128, 1),

          ),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: tabs[_currentIndex]
    );
  }
}

