class LikeRequest {
  int userID;
  int postID;

  LikeRequest({this.userID, this.postID});

  LikeRequest.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    postID = json['postID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['postID'] = this.postID;
    return data;
  }
}
