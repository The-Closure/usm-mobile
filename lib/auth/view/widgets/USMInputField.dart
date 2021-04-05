import 'package:flutter/material.dart';

class USMInputField extends StatelessWidget {
  final bool secureText;
  final String label;
  final String hint;
  const USMInputField({Key key, this.secureText = false, this.hint, this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secureText,
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 20),
        labelText: label,
        border: OutlineInputBorder(),
        hintText: hint,
      ),
    );
  }
}
