import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Textfield_Builder.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        // height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
            ),
            Textfield_Builder(
              label: 'User Name',
            ),
            Textfield_Builder(
              label: 'Password',
              hidetext: true,
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.height * 0.06),
              child: FlatButton(
                onPressed: () => {},
                height: 30,
                minWidth: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                color: Color(0xff836FA9),
              ),
            )
          ],
        ),
      ),
    );
  }
}
