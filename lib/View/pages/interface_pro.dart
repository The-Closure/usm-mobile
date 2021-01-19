import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usm_app/Controllers/UserController.dart';
import 'package:usm_app/Models/user_model.dart';
import 'package:usm_app/View/components/CustomAppBar.dart';
import 'package:usm_app/View/components/custom_background.dart';
import 'package:usm_app/View/components/custom_circle_avatar.dart';
import 'package:usm_app/View/components/custom_text.dart';
import 'package:usm_app/View/components/side_bar.dart';
import 'package:usm_app/View/components/tiles.dart';

class InterFacePro extends StatefulWidget {
  final selected;

  InterFacePro({Key key, this.selected}) : super(key: key);

  @override
  _InterFaceProState createState() => _InterFaceProState();
}

class _InterFaceProState extends State<InterFacePro> {
  UserController userController;
  UserModel v;
  @override
  void initState() {
    // TODO: implement initState
    userController = Get.find(tag: 'userController');
    v = userController.userinfo;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(UserController());
    final mq = MediaQuery.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(),
        //backgroundColor: Colors.amber,
        body: Stack(
          children: [
            CustomBackGround(image_back: 'assets/images/p2.png'),
            SingleChildScrollView(
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                new Side_bar(selected: 3),
              ]),
            ),
            Container(
              margin: EdgeInsets.only(
                left: mq.size.width * 0.25,
                // top: mq.size.height * 0.1,
              ),
              child: Row(
                //
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: <Widget>[
                      CustomCircleAvatar(image_name: 'assets/images/2.png'),
                      SizedBox(
                        height: 28,
                      ),
                      GetBuilder<UserController>(
                        //speci/fy type as Controller
                        // init: UserController(), // intialize with the Controller
                        builder: (userController) => CustomText(
                          text: "${v.name}",
                          // value is an instance of Controller
                          //text: u.name,
                          color: new Color(0Xff939393),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GetBuilder<UserController>(
                        builder: (userController) => CustomText(
                          text: "${v.communityName}",
                          color: new Color(0Xff939393),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GetBuilder<UserController>(
                        // v = userController.userinfo,

                        builder: (userController) => CustomText(
                          text: "${v.email}",
                          color: new Color(0Xff939393),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
