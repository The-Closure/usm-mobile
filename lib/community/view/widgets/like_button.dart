import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usm_mobile/auth/models/RegisterdUser.dart';
import 'package:usm_mobile/community/bloc/like_bloc.dart';
import 'package:usm_mobile/community/models/like.dart';
import 'package:usm_mobile/community/models/like_request.dart';
import 'package:usm_mobile/community/models/post_response.dart';
import 'package:usm_mobile/community/view/widgets/user.dart';

class LikeButton extends StatelessWidget {
  LikeButton({
    Key key,
    @required this.post,
  }) : super(key: key);

  PostResponse post;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LikeBloc(),
      child: BlocConsumer<LikeBloc, LikeState>(
        listener: (context, state) {
          if (state is LikeAddedState) {
            ++post.likesCount;
            _addLiker();
            post.likeState = true;
          } else if (state is LikeDeletedState) {
            --post.likesCount;
            _removeLiker();
            post.likeState = false;
          } else if (state is LikeAddFaild)
            Get.snackbar('faild to add like', '');
          else if (state is LikeDeleteFaild)
            Get.snackbar('faild to delete like', '');
        },
        builder: (context, state) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  post.likeState
                      ? Icons.thumb_up
                      : Icons.thumb_up_off_alt_outlined,
                  color: Color.fromARGB(255, 67, 66, 93),
                ),
                onPressed: !post.likeState
                    ? () async {
                        BlocProvider.of<LikeBloc>(context).add(
                          AddLike(
                            request: LikeRequest(
                              postID: post.postID,
                              userID:
                                  await SharedPreferences.getInstance().then(
                                (value) => value.getInt('userID'),
                              ),
                            ),
                          ),
                        );
                      }
                    : () async {
                        BlocProvider.of<LikeBloc>(context).add(
                          DeleteLike(
                            request: LikeRequest(
                              postID: post.postID,
                              userID:
                                  await SharedPreferences.getInstance().then(
                                (value) => value.getInt('userID'),
                              ),
                            ),
                          ),
                        );
                      },
              ),
              GestureDetector(
                child: Text('${post.likesCount} likes'),
                onTap: () => _viewLikes(context),
              )
            ],
          );
        },
      ),
    );
  }

  void _viewLikes(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => post.likes.length == 0
          ? Center(
              child: Text('no likes'),
            )
          : Container(
              child: ListView.builder(
                itemCount: post.likes.length,
                itemBuilder: (context, index) => ListTile(
                  leading: User(
                    img: post.likes[index].likerImg,
                  ),
                  title: Text(post.likes[index].likerName),
                ),
              ),
            ),
    );
  }

  void _addLiker() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    post.likes.add(
      Likes(
        likerId: sharedPreferences.getInt('userID'),
        likerName: sharedPreferences.getString('user_name'),
        likerImg: sharedPreferences.getString('user_img'),
      ),
    );
  }

  void _removeLiker() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    post.likes.removeWhere(
        (element) => element.likerId == sharedPreferences.getInt('userID'));
  }
}
