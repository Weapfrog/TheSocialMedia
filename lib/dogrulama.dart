import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_social_media/welcome_screen.dart';

class DogrulamaSayfasi extends StatefulWidget{
  @override
  _DogrulamaSayfasiState createState() => _DogrulamaSayfasiState();
}

class _DogrulamaSayfasiState extends State<DogrulamaSayfasi> {

  final auth= FirebaseAuth.instance;
  User kullanici;
  Timer zamanlayici;


  @override
  void initState() {
    kullanici = auth.currentUser;
    kullanici.sendEmailVerification();
    
    zamanlayici = Timer.periodic(Duration(seconds: 5), (timer) {
    checkEmailVerified();
    });

    super.initState();
  }

  @override
  void dispose() {
    zamanlayici.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text("Doğrulama maili ${kullanici.email} adresine gönderildi. Lütfen gereksiz postalari da kontrol edin.",style: TextStyle(color: Color.fromRGBO(0, 100, 128, 1),fontSize: 14,fontWeight: FontWeight.bold,fontFamily: 'MontserratItalic')),
      ),
    );
  }

  Future <void> checkEmailVerified() async{
    kullanici=auth.currentUser;
    await kullanici.reload();
    if (kullanici.emailVerified){
      zamanlayici.cancel();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Anasayfa()));
    }

  }
 }
