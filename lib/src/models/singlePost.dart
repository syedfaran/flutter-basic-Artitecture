class SinglePostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  SinglePostModel({this.userId, this.id, this.title, this.body});

  SinglePostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}


class SinglePostResponse {
  final SinglePostModel success;
  final String error;

  SinglePostResponse(this.success, this.error);

  SinglePostResponse.fromJson(Map<String, dynamic> json)
      : success =SinglePostModel.fromJson(json),
        error = "";

  SinglePostResponse.withError(String errorValue)
      : success = SinglePostModel(id: null,body: null,title: null,userId: null),
        error = errorValue;
}