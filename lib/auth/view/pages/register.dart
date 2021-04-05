import 'package:flutter/material.dart';
import 'package:usm_mobile/auth/view/widgets/FormList.dart';
import 'package:usm_mobile/auth/view/widgets/USMInputField.dart';
import 'package:usm_mobile/auth/view/widgets/USMMaterialButton.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _chosenValue = 'Google';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[Image.asset('assets/images/welcome.jpg')] +
                formList +
                [
                  DropdownButton<String>(
                    isExpanded: true,
                    value: _chosenValue,
                    items: <String>['Google', 'Apple', 'Amazon', 'Tesla']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      setState(() {
                        _chosenValue = value;
                      });
                    },
                  ),
                  USMMaterialButton(
                    tag: 'SIGNUP',
                  )
                ],
          ),
        ),
      ),
    );
  }
}
