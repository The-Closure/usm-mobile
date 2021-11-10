import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:usm_mobile/community/services/Post_service.dart';

class MessagingService {
  Future<void> initMessaging() async {
    // FirebaseApp firebaseInit = await Firebase.initializeApp();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String token = await messaging.getToken();
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.max,
    );
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (selectNotification) async {
        WidgetsFlutterBinding.ensureInitialized();

        selectNotification = selectNotification.replaceAll('{', '');
        selectNotification = selectNotification.replaceAll('}', '');
        selectNotification = selectNotification.replaceAll('postID', '');
        selectNotification = selectNotification.replaceAll(':', '');
        selectNotification = selectNotification.trim();
        Get.toNamed('/PostDetails',
            arguments: await PostServiceImpl()
                .fetchPost(int.parse(selectNotification)));
      },
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.

      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification?.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channel.description,
              icon: android?.smallIcon,
              // other properties...
            )),
            payload: message.data.toString());
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) async {
      Map postID = event.data;
      Get.toNamed('/PostDetails',
          arguments:
              await PostServiceImpl().fetchPost(int.parse(postID['postID'])));
    });

    await SharedPreferences.getInstance()
        .then((sharedPref) => sharedPref.setString('FCMTOKEN', token));

    addTokenToApi(token);
  }

  Future<void> addTokenToApi(String token) async {
    // http.Response response =
    await http.post(
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
  }
}
