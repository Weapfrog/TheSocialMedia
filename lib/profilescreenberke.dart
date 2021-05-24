import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_social_media/loginscreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:the_social_media/usermodel.dart';


class ProfileScreenBerke extends StatefulWidget {
  @override
  _ProfileScreenBerkeState createState() => _ProfileScreenBerkeState();
}

class _ProfileScreenBerkeState extends State<ProfileScreenBerke> {
  UserModel currentUser;
  Links currentUserLinks;
  final auth = FirebaseAuth.instance;

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
                        image: AssetImage("assets/images/berke.png"),
                      )),
                ),
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              Center(
                child: Text(
                  "Berke ÖZTÜRK",
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
                      onTap: () => launch("https://www.facebook.com/berke.ozturk.5648137/"),
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
                      onTap: () => launch("https://www.instagram.com/berkeozturk7/"),
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
                      onTap: () => launch("https://www.linkedin.com/in/berke-%C3%B6zt%C3%BCrk-739133199/"),
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
                      onTap: () => launch("https://twitter.com/Berkeozt"),
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
