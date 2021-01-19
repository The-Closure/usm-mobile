import 'dart:convert';

import 'package:usm/Models/PostModel.dart';
import 'package:usm/Repositories/Constants.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  final post_base_url = "$base_url/posts";

  Future<List<Post>> getPosts() async {
    final req_url = "$post_base_url/getbestposts";
    final response = await http.get(req_url);
    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(response.body);
      List<Post> posts = result.map((e) => Post.fromJson(e)).toList();
      print('done');
      return posts;
    } else {
      print("${response.statusCode}");
      return null;
    }
  }
}
