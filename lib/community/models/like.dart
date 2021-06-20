class Likes {
  int id;
  String likerName;
  int likerId;
  String likerImg;

  Likes({this.id, this.likerName, this.likerId, this.likerImg});

  Likes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    likerName = json['likerName'];
    likerId = json['likerId'];
    likerImg = json['likerImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['likerName'] = this.likerName;
    data['likerId'] = this.likerId;
    data['likerImg'] = this.likerImg;
    return data;
  }
}
