import 'package:flutter/material.dart';
import 'package:usm_mobile/auth/models/RegisterdUser.dart';

class Community extends StatelessWidget {
  const Community({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    RegisteredUser model = arguments['userDetails'] as RegisteredUser;
    if (arguments != null) print(arguments['userDetails']);
    model = arguments['userDetails'];
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name),
      ),
    );
  }
}
