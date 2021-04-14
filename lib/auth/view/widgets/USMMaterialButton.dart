import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usm_mobile/auth/bloc/auth_bloc.dart';
import 'package:usm_mobile/auth/models/RegisterFormModel.dart';
import 'package:usm_mobile/auth/services/AuthService.dart';
import 'package:usm_mobile/auth/view/widgets/FormList.dart';
import 'package:usm_mobile/main.dart';

class USMMaterialButton extends StatelessWidget {
  final AuthBloc _authBloc =
      AuthBloc(authService: AuthServiceImpl(), navigatorKey: Keys.navigatorKey);
  final String tag;
  final String label;
  USMMaterialButton({Key key, this.tag, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: BlocProvider(
        create: (context) => (_authBloc),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is ProcessingRegisterState) {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  backgroundColor: Color.fromARGB(255, 67, 66, 93),
                ),
              );
            } else if (state is FaildRegisterState) {
              return MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  if (tag == 'SIGNUP') {
                    print("object");
                    print(
                        'chosen value : ${RegisterFormBase.of(context).chosenValue}');
                    print(
                        'email value : ${RegisterFormBase.of(context).emailController.text}');
                    _authBloc.add(
                      RegisterEvent(
                        registerFormModel: RegisterFormModel(
                            name: RegisterFormBase.of(context)
                                .usernameController
                                .text,
                            email: RegisterFormBase.of(context)
                                .emailController
                                .text,
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
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  label,
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, fontFamily: "Roboto"),
                ),
                color: Color.fromARGB(255, 67, 66, 93),
              );
            }
            return MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () {
                if (tag == 'SIGNUP') {
                  print("object");
                  print(
                      'chosen value : ${RegisterFormBase.of(context).chosenValue}');
                  print(
                      'email value : ${RegisterFormBase.of(context).emailController.text}');
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                label,
                style: TextStyle(
                    color: Colors.white, fontSize: 16, fontFamily: "Roboto"),
              ),
              color: Color.fromARGB(255, 67, 66, 93),
            );
          },
        ),
      ),
    );
  }
}
