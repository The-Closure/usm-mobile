import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usm_mobile/auth/bloc/auth_bloc.dart';
import 'package:usm_mobile/auth/services/CommunityService.dart';
import 'package:usm_mobile/auth/view/widgets/FormList.dart';
import 'package:usm_mobile/auth/view/widgets/USMMaterialButton.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

//my name is obada  //
class _RegisterState extends State<Register> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/usm.png'),
                ),
              ),
              Expanded(
                flex: 4,
                child: ListView(
                  children: [
                    RegisterFormBase(
                      child: RegisterForm(),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
