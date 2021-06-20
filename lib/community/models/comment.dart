import 'package:usm_mobile/community/models/post_response.dart';

class Comments {
  int id;
  String value;
  Uentity uentity;
  int postID;

  Comments({this.id, this.value, this.uentity, this.postID});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    uentity =
        json['uentity'] != null ? new Uentity.fromJson(json['uentity']) : null;
    postID = json['postID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    if (this.uentity != null) {
      data['uentity'] = this.uentity.toJson();
    }
    data['postID'] = this.postID;
    return data;
  }
}
