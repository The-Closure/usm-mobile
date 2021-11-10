import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USM'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  "assets/images/usm.png",
                  fit: BoxFit.scaleDown,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Center(
                  child: Text(
                    "WELCOME! ",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        color: Color.fromARGB(255, 67, 66, 93),
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Hero(
                  tag: 'LOGIN',
                  child: MaterialButton(
                    onPressed: () => Navigator.of(context).pushNamed('/login'),
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(1.6),
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Roboto"),
                      ),
                    ),
                    color: Color.fromARGB(255, 67, 66, 93),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  transitionOnUserGestures: false,
                  tag: "SIGNUP",
                  child: MaterialButton(
                    onPressed: () => Get.toNamed(
                      '/register',
                    ),
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(1.6),
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "Roboto"),
                      ),
                    ),
                    color: Color.fromARGB(255, 67, 66, 93),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
