import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usm_mobile/auth/bloc/auth_bloc.dart';
import 'package:usm_mobile/auth/services/CommunityService.dart';
import 'package:usm_mobile/auth/view/widgets/FormList.dart';
import 'package:usm_mobile/auth/view/widgets/USMMaterialButton.dart';

class Register extends StatefulWidget {
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AuthBloc authBloc;
  String _chosenValue = 'loading';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[Image.asset('assets/images/welcome.jpg')] +
                registerFormList +
                [
                  BlocProvider(
                    create: (context) {
                      authBloc =
                          AuthBloc(communityService: CommunityServiceImpl());
                      authBloc.add(FetchCommunityEvent());
                      print('hi');
                      return authBloc;
                    },
                    child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is CommunityLoadedState) {
                          return DropdownButton(
                            onChanged: (value) {
                              setState(() {
                                _chosenValue = value;
                              });
                            },
                            isExpanded: true,
                            value: _chosenValue == 'loading'
                                ? state.communities[0].name
                                : _chosenValue,
                            items: state.communities
                                .map((e) => e.name)
                                .toList()
                                .map((value) {
                              return DropdownMenuItem<String>(
                                onTap: () => print(_chosenValue),
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          );
                        } else if (state is CommunityLoadingState ||
                            state is AuthInitial) {
                          return DropdownButton<String>(
                            onChanged: (value) {
                              setState(() {
                                _chosenValue = value;
                              });
                            },
                            isExpanded: true,
                            value: _chosenValue,
                            items: [
                              DropdownMenuItem(
                                  value: 'loading', child: Text('loading')),
                              DropdownMenuItem(
                                  value: 'google', child: Text('google')),
                              DropdownMenuItem(
                                  value: 'apple', child: Text('apple')),
                            ],
                          );
                        } else {
                          return DropdownButton<String>(
                            onChanged: (value) {
                              setState(() {
                                _chosenValue = value;
                              });
                            },
                            isExpanded: true,
                            value: _chosenValue,
                            items: [
                              DropdownMenuItem(
                                  value: 'loading', child: Text('loading')),
                              DropdownMenuItem(
                                  value: 'google', child: Text('google')),
                              DropdownMenuItem(
                                  value: 'hello', child: Text('hello')),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                  USMMaterialButton(
                    tag: 'SIGNUP',
                    label: 'sign up',
                  )
                ],
          ),
        ),
      ),
    );
  }
}
