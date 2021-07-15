import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usm_mobile/auth/bloc/auth_bloc.dart';
import 'package:usm_mobile/auth/services/AuthService.dart';
import 'package:usm_mobile/auth/services/CommunityService.dart';
import 'package:usm_mobile/auth/view/widgets/FormList.dart';

class CommunitySelector extends StatefulWidget {
  CommunitySelector({Key key}) : super(key: key);

  @override
  _CommunitySelectorState createState() => _CommunitySelectorState();
}

class _CommunitySelectorState extends State<CommunitySelector> {
  AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    return communitySelector();
  }

  BlocProvider<AuthBloc> communitySelector() {
    return BlocProvider(
      create: (context) {
        authBloc = AuthBloc(communityService: CommunityServiceImpl());
        authBloc.add(FetchCommunityEvent());
        return authBloc;
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is CommunityLoadedState) {
            return DropdownButtonFormField(
              validator: (value) => RegisterFormBase.of(context)
                  .registerValidation
                  .validateCommunity(value),
              onChanged: (value) {
                setState(() {
                  RegisterFormBase.of(context).chosenValue = value;
                });
              },
              isExpanded: true,
              value: RegisterFormBase.of(context).chosenValue == 'loading'
                  ? '-1'
                  : RegisterFormBase.of(context).chosenValue,
              items: [
                    DropdownMenuItem<String>(
                      value: (-1).toString(),
                      child: Text(
                        'select community',
                        style: TextStyle(color: Colors.grey.shade300),
                      ),
                    )
                  ] +
                  state.communities
                      .map((e) => {'name': e.name, 'id': e.id})
                      .toList()
                      .map((value) {
                    return DropdownMenuItem<String>(
                      value: value['id'].toString(),
                      child: Text(value['name']),
                    );
                  }).toList(),
            );
          } else if (state is CommunityLoadingState || state is AuthInitial) {
            return DropdownButton<String>(
              onChanged: (value) {
                setState(() {
                  RegisterFormBase.of(context).chosenValue = value;
                });
              },
              isExpanded: true,
              value: RegisterFormBase.of(context).chosenValue,
              items: [
                DropdownMenuItem(value: 'loading', child: Text('loading')),
              ],
            );
          } else {
            return TextButton(
                onPressed: () => authBloc.add(FetchCommunityEvent()),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.refresh,
                        color: Colors.grey,
                      ),
                      Text(
                        'reload',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  color: Colors.transparent,
                ));
          }
        },
      ),
    );
  }
}
