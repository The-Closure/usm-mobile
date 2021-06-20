import 'package:usm_mobile/community/models/comment.dart';
import 'package:usm_mobile/community/models/like.dart';

class PostResponse {
  int postID;
  int userID;
  int communityID;
  String title;
  String value;
  String attach;
  bool likeState;
  int likesCount;
  List<Likes> likes;
  List<Comments> comments;
  Uentity uentity;

  PostResponse(
      {this.postID,
      this.userID,
      this.communityID,
      this.title,
      this.value,
      this.attach,
      this.likeState,
      this.likesCount,
      this.likes,
      this.comments,
      this.uentity});

  PostResponse.fromJson(Map<String, dynamic> json) {
    postID = json['postID'];
    userID = json['userID'];
    communityID = json['communityID'];
    title = json['title'];
    value = json['value'];
    attach = json['attach'];
    likeState = json['likeState'];
    likesCount = json['likesCount'];
    if (json['likes'] != null) {
      likes = new List<Likes>();
      json['likes'].forEach((v) {
        likes.add(new Likes.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = new List<Comments>();
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
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
    data['likeState'] = this.likeState;
    data['likesCount'] = this.likesCount;
    if (this.likes != null) {
      data['likes'] = this.likes.map((v) => v.toJson()).toList();
    }
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
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
  Communinty communinty;

  Uentity({this.id, this.name, this.img, this.communinty});

  Uentity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    communinty = json['communinty'] != null
        ? new Communinty.fromJson(json['communinty'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    if (this.communinty != null) {
      data['communinty'] = this.communinty.toJson();
    }
    return data;
  }
}

class Communinty {
  int id;
  String name;
  String description;
  Null img;

  Communinty({this.id, this.name, this.description, this.img});

  Communinty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['img'] = this.img;
    return data;
  }
}
