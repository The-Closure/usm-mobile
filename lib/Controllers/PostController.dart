import 'package:get/get.dart';
import 'package:usm/Models/PostModel.dart';
import 'package:usm/Repositories/PostRepo.dart';

class PostController extends GetxController {
  List<Post> postsList = [];
  PostRepo postRepo = Get.put(PostRepo(), tag: 'postRepo');

  getPosts() async {
    postsList = await postRepo.getPosts();
    update();
  }
}
