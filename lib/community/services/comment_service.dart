import 'dart:convert';

import 'package:usm_mobile/community/models/comment.dart';
import 'package:http/http.dart' as http;

class CommentService {
  Future<Comments> addComment(String value, int userID, int postID) async {
    http.Response response = await http.post(
        Uri.parse(
            'http://192.168.43.187:8080/v2/api/comments/add?userID=$userID&postID=$postID '),
        headers: {'content-type': 'application/json;encode=utf-8'},
        body: jsonEncode({'value': value}));
    if (response.statusCode == 200) {
      return Comments.fromJson(jsonDecode(response.body));
    } else
      throw Exception('something went wrong please try again later');
  }
}
