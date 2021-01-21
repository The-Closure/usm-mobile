import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_appbar.dart';
import '../components/custom_background.dart';
import '../components/custom_circle_avatar.dart';
import '../components/custom_shape_circle.dart';
import '../components/custom_text_field.dart';
import '../components/side_bar.dart';
import '../components/tiles.dart';

class InterfaceSetting extends StatefulWidget {
  InterfaceSetting({Key key}) : super(key: key);

  @override
  _InterfaceSettingState createState() => _InterfaceSettingState();
}

class _InterfaceSettingState extends State<InterfaceSetting> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(),
        //backgroundColor: Colors.amber,
        body: Stack(
          children: [
            Side_bar(selected: 5),
            CustomBackGround(),
            SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(top: mq.size.height * 0.039, left: 85),
                    width: mq.size.width * 0.4,
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: "Name",
                          labelText: "FIRST NAME",
                        ),
                        SizedBox(
                          height: mq.size.height * 0.025,
                        ),
                        CustomTextField(
                          hintText: "Name",
                          labelText: "LAST NAME",
                        ),
                        SizedBox(
                          height: mq.size.height * 0.025,
                        ),
                        CustomTextField(
                          hintText: "********",
                          labelText: "PASSWORD ",
                        ),
                        SizedBox(
                          height: mq.size.height * 0.025,
                        ),
                        CustomTextField(
                          hintText: "EMAIL",
                          labelText: "EXAMPL@gmail.com",
                        ),
                        SizedBox(
                          height: mq.size.height * 0.025,
                        ),
                        CustomTextField(
                          hintText: "computer science",
                          labelText: "SPECILAIZATION",
                        ),
                        SizedBox(
                          height: mq.size.height * 0.025,
                        ),
                        CustomTextField(
                          hintText: "DD/MM/YYYY",
                          labelText: "BIRTHDATE",
                        ),
                        SizedBox(
                          height: mq.size.height * 0.025,
                        ),
                        CustomTextField(
                          hintText: "YYY",
                          labelText: "REGISTERATION YEAR",
                        ),
                        SizedBox(
                          height: mq.size.height * 0.025,
                        ),
                        CustomTextField(
                          hintText: "YYY",
                          labelText: "CURRENT YEAR",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CustomCircleAvatar(
              image_name: 'assets/images/2.png',
            ),
            CustomShapeCircle(),
          ],
        ),
      ),
    );
  }
}
