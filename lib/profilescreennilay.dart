import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_social_media/db_helper.dart';
import 'package:the_social_media/loginscreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:the_social_media/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreenNilay extends StatefulWidget {
  @override
  _ProfileScreenNilayState createState() => _ProfileScreenNilayState();
}

class _ProfileScreenNilayState extends State<ProfileScreenNilay> {
  UserModel currentUser;
  Links currentUserLinks;
  String instalink,facelink,linkedinlink,youtubelink,twitterlink;
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    currentUserLinks = new Links();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ayarlar"),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color.fromRGBO(0, 100, 128, 1),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen())),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            color: Color.fromRGBO(0, 100, 128, 1),
            onPressed: () => print("ayarlar"),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              SizedBox(
                child: Container(
                  height: 25,
                ),
              ),
              Center(
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10))
                      ],
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/nilay.jpeg"),
                      )),
                ),
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              Center(
                child: Text(
                  "Nilay ÇOMAK",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 100, 128, 1),
                      fontFamily: "MontserratItalic",
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => launch("https://www.facebook.com/nilay.comak/"),
                      child: Image.asset(
                        'assets/images/facebook.png',
                        // On click should redirect to an URL
                        width: 120.0,
                        height: 150.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => launch("https://www.instagram.com/lglory0/"),
                      child: Image.asset(
                        'assets/images/instagram.png',
                        // On click should redirect to an URL
                        width: 120.0,
                        height: 150.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => launch("https://www.linkedin.com/in/nilay-%C3%A7omak-5aa5841a4/"),
                      child: Image.asset(
                        'assets/images/linkedin.png',
                        // On click should redirect to an URL
                        width: 120.0,
                        height: 150.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => launch("https://www.twitter.com"),
                      child: Image.asset(
                        'assets/images/twitter.png',
                        // On click should redirect to an URL
                        width: 120.0,
                        height: 150.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => launch("https://www.youtube.com"),
                      child: Image.asset(
                        'assets/images/youtube.png',
                        // On click should redirect to an URL
                        width: 120.0,
                        height: 150.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
