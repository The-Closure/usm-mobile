import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommunityFooter extends StatelessWidget {
  const CommunityFooter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Get.offAndToNamed('/profile');
                }),
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Get.offAndToNamed('/community');
                }),
            Spacer(),
            IconButton(
                icon: Icon(Icons.account_balance_outlined), onPressed: () {}),
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  shwoOptions(context);
                }),
          ],
        ),
      );
    });
  }

  Future<dynamic> shwoOptions(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (ctxt) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: _logout,
                child: Text('logout')),
          );
        });
  }

  _logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Get.offAllNamed('/home');
  }
}
