import 'package:equatable/equatable.dart';

class SinglePost extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  SinglePost(this.userId, this.id, this.title, this.body);

  @override
  List<Object?> get props => [id, userId, title, body];
}

class SinglePostModel extends SinglePost {
  SinglePostModel(
      {required int userId,
      required int id,
      required String title,
      required String body})
      : super(userId, id, title, body);

  factory SinglePostModel.fromJson(Map<String, dynamic> json) {
    return SinglePostModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
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
