import 'dart:io';

import 'package:get/get.dart';
import '../Repositories/BoardRepo.dart';
import '../Repositories/UserRepo.dart';
import '../Repositories/communityRepo.dart';

class SearchController extends GetxController {
  bool user = true;
  bool board = true;
  bool community = true;

  List<dynamic> search_result = [];

  BoardRepo boardRepo = BoardRepo();
  UserRepo userRepo = UserRepo();
  CommunityRepo communityRepo = CommunityRepo();

  searchControl(String value) async {
    search_result = [];
    if (value != '') {
      if (user) {
        search_result += await userRepo.search(value);
      }
      if (board) {
        search_result += await boardRepo.search(value);
      }
      if (community) {
        search_result += await communityRepo.search(value);
      }
    }

    update();
  }
}
