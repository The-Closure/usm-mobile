import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usm_mobile/community/models/post_response.dart';

abstract class Postservice {
  Future<List<PostResponse>> fetchPosts(int communityId, {int pageNo = 0});
  Future<PostResponse> addPost(int userID, String value);
  Future<PostResponse> fetchPost(int postID);
}

class PostServiceImpl extends Postservice {
  @override
  Future<List<PostResponse>> fetchPosts(int communityId,
      {int pageNo = 0}) async {
    final userID = await SharedPreferences.getInstance()
        .then((value) => value.getInt('userID'));
    var response = await http
        .get(Uri.parse(
            "http://164.68.96.30:7070/v2/api/posts/getposts?pageNo=$pageNo&pageSize=5&sortBy=id&communityID=$communityId&userID=$userID"))
        .timeout(Duration(seconds: 5));
    if (response.statusCode == 200) {
      List data = json.decode(utf8.decode(response.bodyBytes));
      List<PostResponse> list =
          data.map((e) => PostResponse.fromJson(e)).toList(growable: true);

      return list;
    } else {
      throw Exception();
    }
  }

  Future<PostResponse> addPost(int userID, String value) async {
    http.Response response = await http.put(
      Uri.parse('http://164.68.96.30:7070/v2/api/posts/addpost/$userID'),
      headers: {'content-type': 'application/json;encode=utf-8'},
      body: jsonEncode(
        {'value': '$value'},
      ),
    );
    if (response.statusCode == 500) throw Exception();
    return PostResponse.fromJson(
      jsonDecode(response.body),
    );
  }

  @override
  Future<PostResponse> fetchPost(int postID) async {
    final userID = await SharedPreferences.getInstance()
        .then((value) => value.getInt('userID'));
    var response = await http
        .get(Uri.parse(
            "http://164.68.96.30:7070/v2/api/posts/getpost?postID=$postID"))
        .timeout(Duration(seconds: 5));
    if (response.statusCode == 200) {
      Map data = json.decode(utf8.decode(response.bodyBytes));
      PostResponse post = PostResponse.fromJson(data);

      return post;
    } else {
      throw Exception();
    }
  }
}
