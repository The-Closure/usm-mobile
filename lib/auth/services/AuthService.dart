import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:usm_mobile/auth/models/RegisterFormModel.dart';
import 'package:usm_mobile/auth/models/RegisterdUser.dart';
import 'package:http/http.dart' as http;
import 'package:usm_mobile/auth/models/SignInModel.dart';

abstract class AuthService {
  Future<RegisteredUser> registerUser(RegisterFormModel registerFormModel);
  Future<RegisteredUser> signInUser(SignInModel signInModel);
}

class AuthServiceImpl implements AuthService {
  @override
  Future<RegisteredUser> registerUser(
      RegisterFormModel registerFormModel) async {
    var response = await http.post(
      Uri.parse("http://192.168.43.187:8080/v2/api/user/add"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(
        registerFormModel.toJson(),
      ),
    );
    print(response.body.toString());
    if (response.statusCode == 201) {
      Map data = json.decode(response.body);
      data.forEach((key, element) {
        print('$key : $element');
      });
      RegisteredUser registeredUser = RegisteredUser.fromJson(data);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("home", "/community");
      sharedPreferences.setInt("userID", registeredUser.id);
      return registeredUser;
    } else {
      throw Exception();
    }
  }

  @override
  Future<RegisteredUser> signInUser(SignInModel signInModel) async {
    var response = await http.put(
      Uri.parse(
          "http://192.168.43.187:8080/v2/api/user/signin?email=${signInModel.email}&password=${signInModel.password}"),
      headers: {"Content-Type": "application/json"},
    );
    print("${response.body}");
    if (response.statusCode == 200) {
      Map data = json.decode(response.body);
      RegisteredUser registeredUser = RegisteredUser.fromJson(data);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("home", "/community");
      sharedPreferences.setInt("userID", registeredUser.id);
      return registeredUser;
    } else {
      throw Exception("${response.body}");
    }
  }
}
