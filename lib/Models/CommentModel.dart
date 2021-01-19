class Comment {
  String name;
  String value;

  Comment({
    this.name,
    this.value,
  });
  Comment.fromJson(Map<String, dynamic> json) {
    name = json['userName'];
    value = json['value'];
  }
}
