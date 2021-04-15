import 'package:usm_mobile/community/models/comment.dart';
import 'package:usm_mobile/community/models/like.dart';

class Posts {
  int id;
  String value;
  String userimg;
  String img;
  List<Likes> likes;
  List<Comments> comments;

  Posts(
      {this.id, this.value, this.userimg, this.img, this.likes, this.comments});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    userimg = json['userimg'];
    img = json['img'];
    if (json['likes'] != null) {
      likes = [];
      json['likes'].forEach((v) {
        likes.add(new Likes.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = [];
      json['comments'].forEach((v) {
        comments.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    data['userimg'] = this.userimg;
    data['img'] = this.img;
    if (this.likes != null) {
      data['likes'] = this.likes.map((v) => v.toJson()).toList();
    }
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
