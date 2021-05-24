import 'package:flutter/material.dart';
import 'package:the_social_media/kaydol2.dart';
import 'package:the_social_media/formfield.dart';


class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
          onPressed: ()=> print("geri"),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings,),
            color: Color.fromRGBO(0, 100, 128, 1),
            onPressed: ()=> print("ayarlar"),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left:16,top: 25),
        child: ListView(
          children: [
            Center(child: Text("Profili düzenle", style: TextStyle(color:Color.fromRGBO(0, 100, 128, 1),fontFamily: "MontserratItalic", fontWeight: FontWeight.w500, fontSize: 25),)),
            SizedBox(
              width: 15,
              height: 30,
            ),
            Center(
              child: Stack(
              children: [
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                      boxShadow: [BoxShadow(
                          spreadRadius: 2,blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0,10)
                      )],
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor
                      ),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/gecici.jpg"),
                      )
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right:0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        color:Color.fromRGBO(0, 100, 128, 1),

                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),),
              ],
            ),),
            SizedBox(
              height: 25,
            ),
              Card(
                elevation: 8.0,
                margin: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.qr_code,color: Color.fromRGBO(0, 100, 128, 1),) ,
                    title: Text("Lütfen isminizi girin"),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      color: Color.fromRGBO(0, 100, 128, 1),
                      onPressed: ()=>print("qr code iste"),
                    ),

                  ),
                  _KartAyirici(),
                  ListTile(
                    leading: Icon(Icons.lock_outline,color: Color.fromRGBO(0, 100, 128, 1),) ,
                    title: Text("Parolanı değiştir"),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      color: Color.fromRGBO(0, 100, 128, 1),
                      onPressed: ()=>print("parolayı degistire git"),
                    ),
                  ),
                  _KartAyirici(),
                  ListTile(
                    leading: Icon(Icons.qr_code,color: Color.fromRGBO(0, 100, 128, 1),) ,
                    title: Text("Yeni KAREKOD iste"),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      color: Color.fromRGBO(0, 100, 128, 1),
                      onPressed: ()=>print("qr code iste"),
                    ),

                  ),
                  _KartAyirici(),
                  ListTile(
                    leading: Icon(Icons.add,color: Color.fromRGBO(0, 100, 128, 1),) ,
                    title: Text("Yeni sosyal medya hesabı ekle "),
                    trailing: IconButton(
                      icon: Icon(Icons.arrow_forward),
                      color: Color.fromRGBO(0, 100, 128, 1),
                      onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> FormYeri())),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(child:Text("Bildirim Ayarları",style: TextStyle(color:Color.fromRGBO(0, 100, 128, 1),fontFamily: "MontserratItalic", fontWeight: FontWeight.w500, fontSize: 15),),),
            SwitchListTile(
              activeColor: Color.fromRGBO(0, 100, 128, 1),
              contentPadding: const EdgeInsets.all(0),
              title: Text("Mesaj bildirimleri"),
              value: true,
              onChanged: (val){ },
            ),
            _KartAyirici(),
            SwitchListTile(
              activeColor: Color.fromRGBO(0, 100, 128, 1),
              contentPadding: const EdgeInsets.all(0),
              title: Text("Mail bildirimleri"),
              value: false,
              onChanged: (val){ },
            ),
            _KartAyirici(),
            SwitchListTile(
              activeColor: Color.fromRGBO(0, 100, 128, 1),
              contentPadding: const EdgeInsets.all(0),
              title: Text("Reklamlar"),
              value: true,
              onChanged: (val){ },
            ),
            _KartAyirici(),
            SwitchListTile(
              activeColor: Color.fromRGBO(0, 100, 128, 1),
              contentPadding: const EdgeInsets.all(0),
              title: Text("Otomatik güncelleme"),
              value: true,
              onChanged: (val){ },
            ),
          ],
        ),
      )
    );
  }
}

Container _KartAyirici(){
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5.0),
    width: double.infinity,
    height: 1.0,
    color: Colors.grey.shade400,
  );
}