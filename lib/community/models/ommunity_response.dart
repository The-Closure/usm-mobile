import 'package:usm_mobile/auth/models/RegisterdUser.dart';

class CommunityRespnse {
  String name;
  String description;
  String img;
  List<RegisteredUser> users;

  CommunityRespnse({this.name, this.users, this.description, this.img});

  CommunityRespnse.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    img = json['img'];
    if (json['users'] != null) {
      users = [];
      json['users'].forEach((v) {
        users.add(new RegisteredUser.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['img'] = this.img;
    if (this.users != null) {
      data['users'] = this.users.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
