import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:usm_mobile/community/models/post.dart';

abstract class Postservice {
  Future<List<PostModel>> fetchPosts(int communityId);
}

class PostServiceImpl extends Postservice {
  @override
  Future<List<PostModel>> fetchPosts(int communityId) async {
    var response = await http.get(Uri.parse(
        "http://172.16.40.18:8080/v2/api/posts/getposts?pageNo=0&pageSize=5&sortBy=id&communityID=$communityId"));
    print(response.toString());
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      data.forEach((element) {
        print(element.toString());
      });
      List<PostModel> list =
          data.map((e) => PostModel.fromJson(e)).toList(growable: true);
      list.forEach((element) {
        print(element.toString());
      });
      print(list.toString());
      return list;
    } else {
      throw Exception();
    }
  }
}
