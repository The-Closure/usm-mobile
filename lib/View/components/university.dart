import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usm_mobile/Controllers/UniversityController.dart';

class University extends StatefulWidget {
  University({Key key}) : super(key: key);

  @override
  _UniversityState createState() => _UniversityState();
}

class _UniversityState extends State<University> {
  final UniversityController uniController = Get.put(UniversityController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (uniController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
              itemCount: uniController.uniList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(top: 4),
                  child: FlatButton(
                    onPressed: () {},
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                  "https://via.placeholder.com/360"
                                      //uniController.uniList[index].image, //uncomment when backend has a working link
                                      ??
                                      AssetImage(
                                          'assets/images/damascus_logo.jpg'),
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      uniController.uniList[index].name,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      uniController.uniList[index].description,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey.withAlpha(128),
                          ),
                        ]),
                  ),
                );
              });
        }
      },
    );
  }
}
