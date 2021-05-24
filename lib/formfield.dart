import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_social_media/usermodel.dart';
import 'package:url_launcher/url_launcher.dart';

class FormYeri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddLinkForm(),
    );
  }
}

class AddLinkForm extends StatefulWidget {
  @override
  _AddLinkFormState createState() => _AddLinkFormState();
}

class _AddLinkFormState extends State<AddLinkForm> {
  final _formKey = new GlobalKey<FormState>();
  Links currentUserLinks = new Links();
  String instalink;
  String facelink;
  String linkedinlink;
  String youtubelink;
  String twitterlink;

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
            onPressed: () => Navigator.pop(context),
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
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: TextFormField(
                      initialValue: "https://www.instagram.com/",
                      decoration: InputDecoration(hintText: "InstaLink"),
                      onSaved: (value) {
                        instalink = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      initialValue: "https://www.facebook.com/",
                      decoration: InputDecoration(hintText: "FacebookLink"),
                      onSaved: (value) {
                        facelink = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      initialValue: "https://www.linkedin.com/",
                      decoration: InputDecoration(hintText: "LinkedinLink"),
                      onSaved: (value) {
                        linkedinlink = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      initialValue: "https://www.twitter.com/",
                      decoration: InputDecoration(hintText: "TwitterLink"),
                      onSaved: (value) {
                        twitterlink = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      initialValue: "https://www.youtube.com/",
                      decoration: InputDecoration(hintText: "YoutubeLink"),
                      onSaved: (value) {
                        youtubelink = value;
                      },
                    ),
                  ),
                  RaisedButton(
                      child: Text("Submit"),
                      onPressed: () {
                        _formKey.currentState.save();
                        currentUserLinks.instagramLink = instalink;
                        currentUserLinks.facebookLink = facelink;
                        print(currentUserLinks.facebookLink);
                        print(currentUserLinks.instagramLink);
                      })
                ],
              )),
        ));
  }
}
