import 'package:flutter/material.dart';

class Textfield_Builder extends StatefulWidget {
  final String label;
  final Color color;
  final bool hidetext;
  const Textfield_Builder(
      {Key key, this.label, this.color, this.hidetext})
      : super(key: key);

  @override
  _Textfield_BuilderState createState() => _Textfield_BuilderState();
}

class _Textfield_BuilderState extends State<Textfield_Builder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
          // validator: widget.validator,
          // onSaved: widget.onSaved,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.emailAddress,
          obscureText: widget.hidetext ?? false,
          decoration: InputDecoration(
              labelText: widget.label ?? 'default',
              labelStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)))),
    );
  }
}
