
class SinglePostModel {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  SinglePostModel({this.userId, this.id, this.title, this.body});

  factory SinglePostModel.fromJson(Map<String, dynamic> json) {
    return SinglePostModel(
        userId : json['userId'],
        id : json['id'],
        title : json['title'],
        body : json['body'],
    );
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