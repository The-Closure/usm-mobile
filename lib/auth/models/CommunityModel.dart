class CommunityModel {
  int _id;
  String _name;
  String _description;
  String _img;

  CommunityModel({int id, String name, String description, String img}) {
    this._id = id;
    this._name = name;
    this._description = description;
    this._img = img;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get name => _name;
  set name(String name) => _name = name;
  String get description => _description;
  set description(String description) => _description = description;
  String get img => _img;
  set img(String img) => _img = img;

  CommunityModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['description'] = this._description;
    data['img'] = this._img;
    return data;
  }
}
