import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:usm_mobile/auth/bloc/auth_bloc.dart';
import 'package:usm_mobile/auth/models/RegisterFormModel.dart';
import 'package:usm_mobile/auth/models/SignInModel.dart';
import 'package:usm_mobile/auth/services/AuthService.dart';
import 'package:usm_mobile/auth/view/widgets/FormList.dart';

class USMMaterialButton extends StatelessWidget {
  AuthBloc _authBloc;
  final String tag;
  final String label;
  USMMaterialButton({Key key, this.tag, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: BlocProvider(
        create: (context) =>
            (_authBloc = AuthBloc(authService: AuthServiceImpl())),
        child: BlocListener<AuthBloc, AuthState>(
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            onPressed: () {
              if (tag == 'SIGNUP') {
                if (RegisterFormBase.of(context)
                    .formKey
                    .currentState
                    .validate()) {
                  _authBloc.add(
                    RegisterEvent(
                      registerFormModel: RegisterFormModel(
                          name: RegisterFormBase.of(context)
                              .usernameController
                              .text,
                          email:
                              RegisterFormBase.of(context).emailController.text,
                          password: RegisterFormBase.of(context)
                              .passwordController
                              .text,
                          community: int.parse(
                              RegisterFormBase.of(context).chosenValue)),
                    ),
                  );
                } else {
                  Get.snackbar('message',
                      'check your register form or select community ');
                }
              } else if (tag == 'LOGIN') {
                _authBloc.add(SignInEvent(
                    signInModel: SignInModel(
                        email: SignInFormBase.of(context).emailController.text,
                        password: SignInFormBase.of(context)
                            .passwordController
                            .text)));
              }
            },
            height: 50,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(
              label,
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontFamily: "Roboto"),
            ),
            color: Color.fromARGB(255, 67, 66, 93),
          ),
          listener: (context, state) {
            if (state is ProcessingRegisterState ||
                state is SignInProcessState) {
              showDialog(
                  context: context,
                  builder: (ctxt) => Center(
                        child: CircularProgressIndicator(),
                      ),
                  barrierDismissible: false);
            } else if (state is FaildRegisterState ||
                state is FaildSignInState) {
              Navigator.pop(context);
              Get.snackbar('faild to register', '');
            } else if (state is SuccessfulRegisterState) {
              Get.offAllNamed('/community', predicate: (route) {
                if (Get.currentRoute == '/register')
                  return false;
                else
                  return true;
              }, arguments: {
                'userDetails': state.registeredUser,
                'communityId': state.communityId
              });
            } else if (state is SuccessfulSignInState) {
              Get.offAllNamed('/community', predicate: (route) {
                if (Get.currentRoute == '/login')
                  return false;
                else
                  return true;
              }, arguments: {
                'userDetails': state.registeredUser,
                'communityId': state.communityId
              });
            } else if (state is SignInNoCommunityState) {
              Get.offAllNamed('/noCommunity');
            }
          },
        ),
      ),
    );
  }
}
