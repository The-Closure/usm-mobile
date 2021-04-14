import 'package:flutter/material.dart';
import 'package:usm_mobile/auth/view/widgets/FormList.dart';

class USMInputField extends StatelessWidget {
  final bool secureText;
  final String label;
  final String hint;
  TextEditingController textEditingController;
  USMInputField(
      {Key key,
      this.secureText = false,
      this.hint,
      this.label,
      this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
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
