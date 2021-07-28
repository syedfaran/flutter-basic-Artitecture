import 'dart:convert';
import 'dart:io';

import 'package:flutter_arti/src/models/singlePost.dart';
import 'package:http/http.dart' as http;

import '../shared.dart';

abstract class AbsRemoteDataSource<T> {
  Future<T> getPost();
  //Future<List<SinglePostModel>> getPostList();
  Future<T> searchPost(int number);
}

class RemoteDataSource extends AbsRemoteDataSource<SinglePostModel> {
  static const api = 'https://jsonplaceholder.typicode.com/posts/1';

  @override
  Future<SinglePostModel>  getPost()async{
    return _getPostFromUrl(api);
  }



  @override
  Future<SinglePostModel> searchPost(int number) {
    return _getPostFromUrl('https://jsonplaceholder.typicode.com/posts/$number');
  }

  Future<SinglePostModel> _getPostFromUrl(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
      });
      return SinglePostModel.fromJson(jsonDecode(response.body));
    } on SocketException {
      throw Failure('No Internet connection 😑');
    } on HttpException {
      throw Failure("Couldn't find the post 😱");
    } on FormatException {
      throw Failure("Bad response format 👎");
    }
  }
}
