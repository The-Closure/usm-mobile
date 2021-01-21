import 'dart:convert';

import 'scholarship_model.dart';

List<UniversityModel> universityModelFromJson(String str) =>
    List<UniversityModel>.from(
        json.decode(str).map((x) => UniversityModel.fromJson(x)));

String universityModelToJson(List<UniversityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UniversityModel {
  UniversityModel({
    this.name,
    this.scholarship,
    this.profs,
    this.image,
    this.description,
  });

  String name;
  List<Scholarship> scholarship;
  List<dynamic> profs;
  String image;
  String description;

  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      UniversityModel(
        name: json["name"],
        scholarship: List<Scholarship>.from(
            json["scholarship"].map((x) => Scholarship.fromJson(x))),
        profs: List<dynamic>.from(json["profs"].map((x) => x)),
        image: json["image"] == null ? null : json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "scholarship": List<dynamic>.from(scholarship.map((x) => x.toJson())),
        "profs": List<dynamic>.from(profs.map((x) => x)),
        "image": image == null ? null : image,
        "description": description,
      };
}
