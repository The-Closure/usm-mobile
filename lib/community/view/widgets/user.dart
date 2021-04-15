import 'package:flutter/material.dart';

class User extends StatelessWidget {
  final String img;

  const User({Key key, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 67, 66, 93),
        radius: 20,
        child: ClipOval(
          child: img == null
              ? Image.asset(
                  'assets/images/user.jpg',
                )
              : Image.network(
                  img,
                ),
        ),
      ),
    );
  }
}
