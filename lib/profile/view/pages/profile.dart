import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  _logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Get.offAllNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Container(
            child: Icon(
              Icons.search,
            ),
          ),
          onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Get.toNamed('/profile');
                }),
            IconButton(icon: Icon(Icons.home), onPressed: () {}),
            Spacer(),
            IconButton(
                icon: Icon(Icons.account_balance_outlined), onPressed: () {}),
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (ctxt) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              onPressed: _logout,
                              child: Text('logout')),
                        );
                      });
                }),
          ],
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
