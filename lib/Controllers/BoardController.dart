import 'package:get/get.dart';
import '../Models/BoardModel.dart';
import '../Repositories/BoardRepo.dart';

class BoardController extends GetxController {
  //BoardModel b = BoardModel(name: 'test');
  List<dynamic> board_list = [];

  //   @override
  // void onInit() async {
  //   search_result = await BoardRepo().search('');
  //   super.onInit();
  // }

 
  BoardRepo boardRepo = Get.put(BoardRepo(), tag: 'boardRepo');

  getBoard(int id ) async {
    board_list = await boardRepo.getUserBoards(id);
  }

  // searchControl(String value) async {
  //   search_result = await boardRepo.search(value);
  //   update();
  // }
}
