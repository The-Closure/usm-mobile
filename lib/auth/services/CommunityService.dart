import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:usm_mobile/auth/models/CommunityModel.dart';

abstract class CommunityService {
  Future<List<CommunityModel>> getCommunities();
}

class CommunityServiceImpl implements CommunityService {
  @override
  Future<List<CommunityModel>> getCommunities() async {
    var response = await http
        .get(Uri.parse("http://192.168.43.187:8080/v2/api/community/getall"));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      data.forEach((element) {});
      List<CommunityModel> list =
          data.map((e) => CommunityModel.fromJson(e)).toList(growable: true);
      list.forEach((element) {});
      return list;
    } else {
      throw Exception();
    }
  }
}
