import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:usm_mobile/auth/bloc/auth_bloc.dart';
import 'package:usm_mobile/auth/models/RegisterFormModel.dart';
import 'package:usm_mobile/auth/services/AuthService.dart';
import 'package:usm_mobile/auth/view/widgets/FormList.dart';
import 'package:usm_mobile/main.dart';

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
            if (state is ProcessingRegisterState) {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  backgroundColor: Color.fromARGB(255, 67, 66, 93),
                ),
              );
            } else if (state is FaildRegisterState) {
              Get.snackbar('faild to register', '${state.message}');
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
              // Get.offNamed('/community', arguments: {
              //   'userDetails': state.registeredUser,
              //   'communityId': state.communityId
              // });
            }
          },
        ),
      ),
    );
  }
}
