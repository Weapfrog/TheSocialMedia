import 'package:the_social_media/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:the_social_media/usermodel.dart';
import 'dogrulama.dart';

class KaydolSayfasi2 extends StatefulWidget {
  @override
  _KaydolSayfasi2State createState() => _KaydolSayfasi2State();
}

class _KaydolSayfasi2State extends State<KaydolSayfasi2> {
  final auth = FirebaseAuth.instance;
  UserModel currentUser;
  Links currentUserLinks;

  @override
  void initState() {
    // TODO: implement initState
    currentUserLinks = new Links();
  }

  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("The Social Media"),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Color.fromRGBO(0, 100, 128, 1),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Anasayfa())),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
              child: Column(
                children: <Widget>[
                  Center(
                    heightFactor: 2,
                    child: Text("The Social Media",
                        style: TextStyle(
                          color: Color.fromRGBO(0, 100, 129, 1),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(
                    child:
                        Text("Kullandigin sosyal medya uygulamalarini ekle!"),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: 10, right: 20, left: 20, top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 100, 129, 1),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        )
                      ],
                      color: Colors.white,
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          currentUserLinks.instagramLink = value.trim();
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Instagram",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: 10, right: 20, left: 20, top: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 100, 129, 1),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        )
                      ],
                      color: Colors.white,
                    ),
                      child: TextFormField(
                        key: _formKey,
                        onSaved: (value){
                        currentUserLinks.facebookLink = value;
                        },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Facebook",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: 10, right: 20, left: 20, top: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 100, 129, 1),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        )
                      ],
                      color: Colors.white,
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          currentUserLinks.linkedinLink = value.trim();
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "LinkedIn",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: 10, right: 20, left: 20, top: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 100, 129, 1),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        )
                      ],
                      color: Colors.white,
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          currentUserLinks.twitterLink = value.trim();
                        });
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Twitter",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: 10, right: 20, left: 20, top: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 100, 129, 1),
                          offset: Offset(0, 10),
                          blurRadius: 20,
                        )
                      ],
                      color: Colors.white,
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          currentUserLinks.youtubeLink = value.trim();
                        });
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Youtube",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Center(
                    child: Center(
                        heightFactor: 1,
                        child: TextButton(
                          child: Text(
                            "Bitir!",
                            style: TextStyle(
                              color: Color.fromRGBO(0, 100, 129, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            _formKey.currentState.save();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Anasayfa()));
                          },
                        )),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  _kayitOl(String _email, String _password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      //Başarılı
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => DogrulamaSayfasi()));
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
    }
  }
}
