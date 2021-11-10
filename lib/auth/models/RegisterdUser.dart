class RegisteredUser {
  int id;
  String name;
  String img;
  Communinty communinty;

  RegisteredUser({this.id, this.name, this.img, this.communinty});

  RegisteredUser.fromJson(Map<String, dynamic> json) {
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
  String img;

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
