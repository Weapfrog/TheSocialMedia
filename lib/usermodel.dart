class UserModel {
  String uid;
  String displayName;
  String avatarUrl;

  UserModel(this.uid,{this.displayName,this.avatarUrl})  ;
}

class Links {
  String twitterLink;
  String instagramLink;
  String linkedinLink;
  String facebookLink;
  String youtubeLink;

  Links({this.facebookLink,this.instagramLink,this.linkedinLink,this.twitterLink,this.youtubeLink});
}