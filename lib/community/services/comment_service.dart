import 'dart:convert';

import 'package:usm_mobile/community/models/comment.dart';
import 'package:http/http.dart' as http;

class CommentService {
  Future<Comments> addComment(String value, int userID, int postID) async {
    http.Response response = await http
        .post(
            Uri.parse(
                'http://164.68.96.30:7070/v2/api/comments/add?userID=$userID&postID=$postID '),
            headers: {'content-type': 'application/json;encode=utf-8'},
            body: jsonEncode({'value': value}))
        .timeout(Duration(seconds: 5));
    if (response.statusCode == 200) {
      return Comments.fromJson(jsonDecode(response.body));
    } else
      throw Exception('something went wrong please try again later');
  }

  Future<int> deleteComment(int userID, int commentID) async {
    http.Response response = await http.delete(Uri.parse(
        'http://164.68.96.30:7070/v2/api/comments/delete/$userID/$commentID'));

    if (response.statusCode == 200)
      return commentID;
    else
      throw Exception();
  }
}
