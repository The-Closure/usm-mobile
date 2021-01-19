import 'package:get/get.dart';
import 'package:usm_app/View/pages/Login.dart';
import 'package:usm_app/View/pages/board_page.dart';
import 'package:usm_app/View/pages/community_page.dart';
import 'package:usm_app/View/pages/interface_pro.dart';
import 'package:usm_app/View/pages/interface_setting.dart';
import 'package:usm_app/View/pages/search_page.dart';
import 'package:usm_app/View/pages/university_search.dart';

class Routers {
  static final route = [
    GetPage(
      name: '/Login',
      page: () => Login(),
    ),
    GetPage(
      name: '/Profile',
      page: () => InterFacePro(
        selected: 3,
      ),
    ),
    GetPage(
      name: '/home',
      page: () => Community_Page(),
    ),
    GetPage(name: '/Search', page: () => Search_Page()),
    GetPage(name: '/setting', page: () => InterfaceSetting()),
    GetPage(name: '/university', page: () => University_Search()),
    GetPage(name: '/Board', page: () => Board_Page()),
  ];
}
