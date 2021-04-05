import 'package:flutter/material.dart';
import 'package:usm_mobile/auth/view/widgets/USMInputField.dart';

List<Widget> formList = [
  USMInputField(
    hint: 'Enter your full name',
    label: 'Name : ',
  ),
  Padding(padding: EdgeInsets.symmetric(vertical: 8)),
  USMInputField(
    hint: 'Enter your email',
    label: 'Email : ',
  ),
  Padding(padding: EdgeInsets.symmetric(vertical: 8)),
  USMInputField(
    secureText: true,
    hint: 'Enter your password',
    label: 'Password : ',
  ),
  Padding(padding: EdgeInsets.symmetric(vertical: 8)),
  USMInputField(
    hint: 'Enter your age',
    label: 'Age : ',
  ),
  Padding(padding: EdgeInsets.symmetric(vertical: 8)),
  // USMInputField(
  //   hint: 'Select your community',
  //   label: 'community',
  // ),

  // Padding(padding: EdgeInsets.symmetric(vertical: 8)),
];
