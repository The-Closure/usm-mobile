import 'package:usm_mobile/auth/models/RegisterdUser.dart';

class Community {
  String name;
  List<RegisteredUser> users;

  Community({this.name, this.users});

  Community.fromJson(Map<String, dynamic> json) {
    name = json['name'];
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
    if (this.users != null) {
      data['users'] = this.users.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
