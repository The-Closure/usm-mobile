import 'package:usm_mobile/auth/models/RegisterdUser.dart';
import 'package:usm_mobile/community/models/comment.dart';
import 'package:usm_mobile/community/models/like.dart';

class PostModel {
  int postID;
  int userID;
  int communityID;
  String title;
  String value;
  String attach;
  Uentity uentity;

  PostModel(
      {this.postID,
      this.userID,
      this.communityID,
      this.title,
      this.value,
      this.attach,
      this.uentity});

  PostModel.fromJson(Map<String, dynamic> json) {
    postID = json['postID'];
    userID = json['userID'];
    communityID = json['communityID'];
    title = json['title'];
    value = json['value'];
    attach = json['attach'];
    uentity =
        json['uentity'] != null ? new Uentity.fromJson(json['uentity']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postID'] = this.postID;
    data['userID'] = this.userID;
    data['communityID'] = this.communityID;
    data['title'] = this.title;
    data['value'] = this.value;
    data['attach'] = this.attach;
    if (this.uentity != null) {
      data['uentity'] = this.uentity.toJson();
    }
    return data;
  }
}

class Uentity {
  int id;
  String name;
  String img;

  Uentity({this.id, this.name, this.img});

  Uentity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    return data;
  }
}
