class RegisterFormModel {
  String name;
  String email;
  String password;
  int community;

  RegisterFormModel({this.name, this.email, this.password, this.community});

  RegisterFormModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    community = json['community'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['community'] = this.community;
    return data;
  }
}
