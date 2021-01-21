import 'package:get/get.dart';
import 'package:usm_mobile/View/pages/community_page.dart';
import '../pages/Login.dart';
import '../pages/Search_Page.dart';
import '../pages/board_page.dart';
import '../pages/interface_pro.dart';
import '../pages/interface_setting.dart';
import '../pages/university_search.dart';

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
