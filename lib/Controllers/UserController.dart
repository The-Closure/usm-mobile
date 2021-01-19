import 'package:get/get.dart';
import 'package:usm/Models/user_model.dart';
import 'package:usm/Repositories/LocalFilesManagemenet.dart';
import 'package:usm/Repositories/UserRepo.dart';

class UserController extends GetxController {
  static UserController _userController;
  static UserController getInstance() {
    if (_userController == null)
      return _userController = UserController();
    else
      return _userController;
  }

  UserModel userinfo = UserModel();
  var userRepo = UserRepo();
  @override
  onInit() {
    super.onInit();
  }

  void _fetchData() async {
    userinfo = await userRepo.register();
    print(userinfo.toJson());
  }

  Future<bool> signinControl(String email, String password) async {
    userinfo = await userRepo.signin(email, password);
    if (userinfo.id == -1 || userinfo == null)
      return false;
    else {
      {
        LocalFileManager storage = LocalFileManager();
        await storage.writeData(userinfo);
        print("***************************************");
        print(storage.readData);
        print("***************************************");

        return true;
      }
    }
  }
}
