class CommunityModel {
  int id;
  String name;
  String description;
  String img;

  CommunityModel({int id, String name, String description, String img}) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.img = img;
  }

  CommunityModel.fromJson(Map<String, dynamic> json) {
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
