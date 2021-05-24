import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:the_social_media/usermodel.dart';


import 'dogrulama.dart';

class KaydolSayfasi extends StatefulWidget {
  @override
  _KaydolSayfasiState createState() => _KaydolSayfasiState();
}

class _KaydolSayfasiState extends State<KaydolSayfasi> {



  String _email,_password;
  final auth = FirebaseAuth.instance;
  UserModel currentUser;
  Links currentUserLinks;


  @override
  void initState() {
    currentUserLinks = new Links();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        Container(
            child:
            Column(
              children: <Widget>[
                Center(
                  heightFactor: 4,
                  child: Text("The Social Media", style: TextStyle(color: Color.fromRGBO(0, 100, 129, 1), fontSize: 40, fontWeight: FontWeight.bold,)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10,right: 20,left:20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: Color.fromRGBO(0, 100, 129, 1),
                      offset: Offset(0,10),

                      blurRadius: 20,
                    )],

                    color: Colors.white,
                  ),
                  child: TextField(
                      onChanged: (value){
                        setState(() {
                          currentUser.displayName=value.trim();
                        });
                      },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "İsim Soyisim",
                        hintStyle: TextStyle(color: Colors.grey)
                    ),
                  ),

                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10,right: 20,left:20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: Color.fromRGBO(0, 100, 129, 1),
                      offset: Offset(0,10),

                      blurRadius: 20,
                    )],

                    color: Colors.white,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value){
                      setState(() {
                        _email=value.trim();
                      });
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "E-Posta Adresi",
                        hintStyle: TextStyle(color: Colors.grey)
                    ),
                  ),

                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10,right: 20,left:20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: Color.fromRGBO(0, 100, 129, 1),
                      offset: Offset(0,10),

                      blurRadius: 20,
                    )],

                    color: Colors.white,
                  ),
                  child: TextField(

                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: true,
                    onChanged: (value){
                      setState(() {
                        _password=value.trim();
                      });
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Parola",
                        hintStyle: TextStyle(color: Colors.grey)
                    ),
                  ),

                ),Container(
                  child: Text("Kullandigin sosyal medya uygulamalarini ekle!"),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10,right: 20,left:20,top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: Color.fromRGBO(0, 100, 129, 1),
                      offset: Offset(0,10),

                      blurRadius: 20,
                    )],

                    color: Colors.white,
                  ),
                  child: TextField(
                    onChanged: (value){
                      setState(() {
                        currentUserLinks.instagramLink=value;
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
                  margin: EdgeInsets.only(bottom: 10,right: 20,left:20,top: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: Color.fromRGBO(0, 100, 129, 1),
                      offset: Offset(0,10),
                      blurRadius: 20,
                    )],

                    color: Colors.white,
                  ),
                  child: TextField(
                    onChanged: (value){
                      setState(() {
                        currentUserLinks.facebookLink=value.trim();
                      });
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Facebook",
                        hintStyle: TextStyle(color: Colors.grey)
                    ),
                  ),

                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10,right: 20,left:20,top: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: Color.fromRGBO(0, 100, 129, 1),
                      offset: Offset(0,10),

                      blurRadius: 20,
                    )],

                    color: Colors.white,
                  ),
                  child: TextField(
                    onChanged: (value){
                      setState(() {
                        currentUserLinks.linkedinLink=value.trim();
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
                  margin: EdgeInsets.only(bottom: 10,right: 20,left:20,top: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: Color.fromRGBO(0, 100, 129, 1),
                      offset: Offset(0,10),
                      blurRadius: 20,
                    )],

                    color: Colors.white,
                  ),
                  child: TextField(
                    onChanged: (value){
                      setState(() {
                        currentUserLinks.twitterLink=value.trim();
                      });
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Twitter",
                        hintStyle: TextStyle(color: Colors.grey)

                    ),
                  ),

                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10,right: 20,left:20,top: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: Color.fromRGBO(0, 100, 129, 1),
                      offset: Offset(0,10),

                      blurRadius: 20,
                    )],

                    color: Colors.white,
                  ),
                  child: TextField(
                    onChanged: (value){
                      setState(() {
                        currentUserLinks.youtubeLink=value.trim();
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
                        child: Text("Kayıt ol!",style: TextStyle(color:Color.fromRGBO(0, 100, 129, 1),fontWeight: FontWeight.bold,),),onPressed: () {
                        _kayitOl(_email, _password);
                      },)
                  ),
                ),
              ],

            )
        ),
      ],)
    );
  }
  _kayitOl(String _email,String _password) async {

    try{
      await auth.createUserWithEmailAndPassword(email: _email, password: _password);
      //Başarılı
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> DogrulamaSayfasi()));
    } on FirebaseAuthException catch(error){
      Fluttertoast.showToast(msg: error.message,gravity: ToastGravity.TOP);
    }

  }
}
