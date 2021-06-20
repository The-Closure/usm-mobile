import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:usm_mobile/community/models/post_response.dart';

abstract class LikeService {
  Future<bool> addLike({int postID, int userID});
  Future<bool> deleteLike({int postID, int userID});
}

class LikeServiceImpl extends LikeService {
  @override
  Future<bool> addLike({int postID, int userID}) async {
    final response = await http.post(
        Uri.parse('http://192.168.43.187:8080/v2/api/likes/addlike'),
        headers: {'content-type': 'application/json;charset=utf-8'},
        body: jsonEncode({'postID': postID, 'userID': userID}));

    return response.body.contains('true');
  }

  @override
  Future<bool> deleteLike({int postID, int userID}) async {
    final response = await http.delete(
      Uri.parse(
          'http://192.168.43.187:8080/v2/api/likes/deletelike?userID=$userID&postID=$postID'),
      headers: {'content-type': 'application/json;charset=utf-8'},
    );
    return response.body.contains('true');
  }
}
