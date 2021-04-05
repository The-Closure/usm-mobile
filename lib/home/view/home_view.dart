import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            "assets/images/welcome.jpg",
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
            child: MaterialButton(
              onPressed: () => {},
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(1.6),
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, fontFamily: "Roboto"),
                ),
              ),
              color: Color.fromARGB(255, 67, 66, 93),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              transitionOnUserGestures: false,
              tag: "SIGNUP",
              child: MaterialButton(
                onPressed: () => Navigator.of(context).pushNamed('/register'),
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
    );
  }
}
