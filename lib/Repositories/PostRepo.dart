import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/PostModel.dart';
import 'Constants.dart';

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
      return null;
    }
  }
}
