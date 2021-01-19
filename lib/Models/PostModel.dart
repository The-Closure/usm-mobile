import 'CommentModel.dart';

class Post {
  int id;
  String title;
  String description = '';
  int likes = 0;
  int comments = 0;
  String image;
  String duration;
  List<dynamic> commentArr = [];
  List<dynamic> likesArr = [];

  Post({
    this.id,
    this.title,
    this.description,
    this.image,
    this.likes = 0,
    this.comments = 0,
  });
  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['value'];
    likes = json['likeCount'];
    comments = json['commentCount'];
    duration = this.getDuration(json['created_at']);
    commentArr = json['commentsInfo'] != []
        ? (json['commentsInfo'].map((e) => Comment.fromJson(e)).toList())
        : [];
  }

  getDuration(String date) {
    DateTime dob = DateTime.parse(date);
    Duration dur = DateTime.now().difference(dob);
    num years = (dur.inDays / 365).floor();
    num months = ((dur.inDays % 365) / 12).floor();
    num days = ((dur.inDays % 365) % 12);
    num hours = (dur.inHours % 24);
    num minutes = (dur.inMinutes % 60);

    return (years > 0 ? years.toString() + ' y ' : '') +
        (months > 0 ? months.toString() + ' mon ' : '') +
        (days > 0 ? days.toString() + ' day ' : '') +
        (hours > 0 ? hours.toString() + ' hour ' : '') +
        (minutes > 0 ? minutes.toString() + ' min ' : '');
  }
}
