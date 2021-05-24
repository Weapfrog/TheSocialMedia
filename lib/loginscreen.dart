import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:the_social_media/dogrulama.dart';
import 'package:the_social_media/kaydol.dart';
import 'package:the_social_media/profilescreen.dart';
import 'package:the_social_media/welcome_screen.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String _email,_password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 300 ,

              child: Stack(
                children: <Widget>[
                  Positioned(
                    child: Container(

                      child: Center(

                        child: Text("Login", style: TextStyle(color: Color.fromRGBO(0, 100, 129, 1),fontSize:40,fontWeight: FontWeight.bold,fontFamily: 'MontserratItalic')),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),


                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
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
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "E-Posta",

                                hintStyle: TextStyle(color: Colors.grey)
                            ),
                          ),

                        ),
                        Container(

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
                            }
                            ,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Parola",
                                hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(top:5,bottom:5,right: 20,left:20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(0, 100, 129, 1),
                              Color.fromRGBO(0, 100, 129, 1),

                            ]
                        )
                    ),
                    child: Center(
                        child: TextButton(
                          child: Text("Giris Yap!",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontFamily: 'MontserratItalic'),),
                          onPressed: () {
                          _girisYap(_email, _password);
                        },)
                    ),
                  ),
                  Container(
                    child:TextButton(
                      onPressed: () {
                        _kayitOl(_email, _password);
                      },
                      child: Text(
                        'Kaydol!',
                        style: TextStyle(color: Color.fromRGBO(0, 100, 129, 1),fontWeight: FontWeight.bold,fontFamily: 'MontserratItalic'),)
                      ),
                    ),
                ],
              ),



            ),


          ],
        ),
      ),
    );
  }

  _girisYap(String _email,String _password) async {

    try{
      await auth.signInWithEmailAndPassword(email: _email, password: _password);
      //Başarılı
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Anasayfa()));
    } on FirebaseAuthException catch(error){
      Fluttertoast.showToast(msg: "E-Posta adresi ile parola uyuşmuyor.",gravity: ToastGravity.TOP);
    }

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
