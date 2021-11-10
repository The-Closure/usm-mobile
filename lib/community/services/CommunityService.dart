import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:usm_mobile/auth/models/CommunityModel.dart';
import 'package:usm_mobile/community/models/ommunity_response.dart';
import 'package:dio/dio.dart';

abstract class CommunityService {
  Future<List<CommunityModel>> getCommunities();
  Future<CommunityRespnse> getCommunity(int communityId);
}

class CommunityServiceImpl implements CommunityService {
  @override
  Future<List<CommunityModel>> getCommunities() async {
    var response = await http
        .get(Uri.parse("http://164.68.96.30:7070/v2/api/community/getall"));
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

  @override
  Future<CommunityRespnse> getCommunity(int communityId) async {
    BaseOptions options = new BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 5000,
        receiveTimeout: 5000);

    var dio = new Dio(options);
    Response response = await dio.get(
      // 1164.68.96.30:7070
      'http://164.68.96.30:7070/v2/api/community/getbyid?id=$communityId',
    );
    // var response = await http.get(Uri.parse(
    //     'http://localhost:8080/v2/api/community/getbyid?id=$communityId'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.toString());
      ;
      return CommunityRespnse.fromJson(data);
    } else {
      throw Exception();
    }
  }
}
