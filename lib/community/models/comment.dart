class Comments {
  String name;
  String userID;
  String img;
  int id;
  String value;

  Comments({this.name, this.userID, this.img, this.id, this.value});

  Comments.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userID = json['userID'];
    img = json['img'];
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['userID'] = this.userID;
    data['img'] = this.img;
    data['id'] = this.id;
    data['value'] = this.value;
    return data;
  }
}
