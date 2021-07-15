import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MessagingService {
  Future<void> initMessaging() async {
    // FirebaseApp firebaseInit = await Firebase.initializeApp();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String token = await messaging.getToken();
    print('!!! ... $token');
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
    await SharedPreferences.getInstance()
        .then((sharedPref) => sharedPref.setString('FCMTOKEN', token));

    addTokenToApi(token);
  }

  Future<void> addTokenToApi(String token) async {
    http.Response response = await http.post(
      Uri.parse('http://164.68.96.30:7070/api/v2/firebase/addToken'),
      headers: {'content-type': 'application/json;encode=utf-8'},
      body: jsonEncode(
        {
          "token": "$token",
          "userID": (await SharedPreferences.getInstance()
                  .then((sharedPref) => sharedPref))
              .getInt('userID')
              .toString()
        },
      ),
    );
    print('${response.body}');
  }
}
