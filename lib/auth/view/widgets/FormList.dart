import 'package:flutter/material.dart';
import 'package:usm_mobile/auth/bloc/auth_bloc.dart';
import 'package:usm_mobile/auth/view/widgets/CommunitySelector.dart';
import 'package:usm_mobile/auth/view/widgets/USMInputField.dart';
import 'package:usm_mobile/auth/view/widgets/USMMaterialButton.dart';

class RegisterFormBase extends InheritedWidget {
  AuthBloc authBloc;
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController communityController = TextEditingController();
  dynamic chosenValue = 'loading';
  RegisterFormBase({Key key, this.child}) : super(key: key, child: child);

  final Widget child;

  static RegisterFormBase of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RegisterFormBase>();
  }

  @override
  bool updateShouldNotify(RegisterFormBase oldWidget) {
    return true;
  }
}

class SignInFormBase extends InheritedWidget {
  final AuthBloc authBloc;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  SignInFormBase({Key key, this.child, this.authBloc})
      : super(key: key, child: child);

  final Widget child;

  static SignInFormBase of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SignInFormBase>();
  }

  @override
  bool updateShouldNotify(SignInFormBase oldWidget) {
    return true;
  }
}

class RegisterForm extends StatefulWidget {
  RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        USMInputField(
          textEditingController:
              RegisterFormBase.of(context).usernameController,
          hint: 'Enter your full name',
          label: 'Name : ',
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 8)),
        USMInputField(
          textEditingController: RegisterFormBase.of(context).emailController,
          hint: 'Enter your email',
          label: 'Email : ',
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 8)),
        USMInputField(
          textEditingController:
              RegisterFormBase.of(context).passwordController,
          secureText: true,
          hint: 'Enter your password',
          label: 'Password : ',
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 8)),
        USMInputField(
          textEditingController: RegisterFormBase.of(context).ageController,
          hint: 'Enter your age',
          label: 'Age : ',
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 8)),
        CommunitySelector(),
        USMMaterialButton(
          tag: 'SIGNUP',
          label: 'sign up',
        )
      ],
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.symmetric(vertical: 8)),
        USMInputField(
          textEditingController: SignInFormBase.of(context).emailController,
          hint: 'Enter your email',
          label: 'Email : ',
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 8)),
        USMInputField(
          textEditingController: SignInFormBase.of(context).passwordController,
          secureText: true,
          hint: 'Enter your password',
          label: 'Password : ',
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 8)),
        USMMaterialButton(
          tag: 'LOGIN',
          label: 'login',
        )
      ],
    );
  }
}
