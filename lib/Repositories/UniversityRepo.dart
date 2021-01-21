import 'package:http/http.dart' as http;

import 'package:usm_mobile/Models/UniversityModel.dart';

import 'Constants.dart';

class UniversityRepo {
  static final university_base_url = "$base_url/boards/search/u";

  static Future<List<UniversityModel>> fetchUnis() async {
    var response = await http.get(university_base_url);

    if (response.statusCode == 200) {
      print(response.body);
      var jsonString = response.body;
      return universityModelFromJson(jsonString);
    }
  }
}
