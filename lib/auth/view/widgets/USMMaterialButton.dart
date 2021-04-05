import 'package:flutter/material.dart';

class USMMaterialButton extends StatelessWidget {
  final String tag;
  const USMMaterialButton({Key key, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: MaterialButton(
        onPressed: () => {},
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          'SIGN UP',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontFamily: "Roboto"),
        ),
        color: Color.fromARGB(255, 67, 66, 93),
      ),
    );
  }
}
