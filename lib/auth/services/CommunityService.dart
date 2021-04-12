import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usm_mobile/auth/models/CommunityModel.dart';

abstract class CommunityService {
  Future<List<CommunityModel>> getCommunities();
}

class CommunityServiceImpl implements CommunityService {
  @override
  Future<List<CommunityModel>> getCommunities() async {
    var response = await http
        .get(Uri.parse("http://192.168.1.5:8080/v2/api/community/getall"));
    print(response.toString());
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      data.forEach((element) {
        print(element.toString());
      });
      List<CommunityModel> list =
          data.map((e) => CommunityModel.fromJson(e)).toList(growable: true);
      list.forEach((element) {
        print(element.name);
      });
      print(list.toString());
      return list;
    } else {
      throw Exception();
    }
  }
}
