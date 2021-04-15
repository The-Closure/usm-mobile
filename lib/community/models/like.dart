class Likes {
  String name;
  String img;
  int id;

  Likes({this.name, this.img, this.id});

  Likes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    img = json['img'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['img'] = this.img;
    data['id'] = this.id;
    return data;
  }
}
