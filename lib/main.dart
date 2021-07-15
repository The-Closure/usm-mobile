import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usm_mobile/auth/view/pages/login.dart';
import 'package:usm_mobile/auth/view/pages/register.dart';
import 'package:usm_mobile/community/bloc/comment_bloc.dart';
import 'package:usm_mobile/community/view/pages/community_info.dart';
import 'package:usm_mobile/community/view/pages/dep_community.dart';
import 'package:usm_mobile/community/view/pages/no_community.dart';
import 'package:usm_mobile/firebase/cloud_messaging/messaging_service.dart';
import 'package:usm_mobile/profile/view/pages/profile.dart';
import 'home/view/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await MessagingService().initMessaging();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  // sharedPreferences.clear();
  runApp(MyApp(
    home: sharedPreferences.getString("home") ?? "/home",
  ));
}

class MyApp extends StatelessWidget {
  final home;
  MyApp({Key key, @required this.home}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return bloc.MultiBlocProvider(
      providers: [
        bloc.BlocProvider(create: (context) => CommentBloc()),
      ],
      child: GetMaterialApp(
        getPages: [
          GetPage(
              name: '/home',
              page: () => HomeView(),
              transition: Transition.rightToLeft),
          GetPage(
              name: '/register',
              page: () => Register(),
              transition: Transition.leftToRight),
          GetPage(
              name: '/login', page: () => Login(), transition: Transition.fade),
          GetPage(
              name: '/community',
              page: () => DepCommunity(),
              transition: Transition.downToUp),
          GetPage(
              name: '/profile',
              page: () => Profile(),
              transition: Transition.downToUp),
          GetPage(
              name: '/noCommunity',
              page: () => NoCommunity(),
              transition: Transition.downToUp),
          GetPage(
              name: '/communityInfo',
              page: () => CommunityInfo(),
              transition: Transition.downToUp),
        ],
        debugShowCheckedModeBanner: false,
        initialRoute: home,
        theme: ThemeData(
            primarySwatch: createMaterialColor(Color.fromARGB(255, 67, 66, 93)),
            bottomAppBarColor: Color.fromARGB(255, 67, 66, 93),
            iconTheme: IconThemeData(color: Colors.white),
            primaryColor: Color.fromARGB(255, 67, 66, 93),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.white,
                foregroundColor: Color.fromARGB(255, 67, 66, 93)),
            appBarTheme: AppBarTheme(
              centerTitle: true,
            )),
      ),
    );
  }

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }
}
