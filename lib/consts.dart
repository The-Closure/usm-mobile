import 'package:shared_preferences/shared_preferences.dart';

class RepoValues {
  Future<int> init() async {
    return await SharedPreferences.getInstance()
        .then((value) => value.getInt('userID'));
  }

  Future<int> getId() async {
    init();
    return userID;
  }

  int userID;
}
