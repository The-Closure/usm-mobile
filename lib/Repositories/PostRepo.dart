import 'dart:convert';

import 'package:usm_mobile/Models/PostModel.dart';
import 'package:usm_mobile/Repositories/Constants.dart';
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
      return null;
    }
  }
}
