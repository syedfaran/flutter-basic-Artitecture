import 'dart:convert';

import 'package:flutter_arti/src/models/singlePost.dart';
import 'package:http/http.dart' as http;

class NetworkClient {
  static const api = 'https://jsonplaceholder.typicode.com/posts/1';

  Future<SinglePostResponse> getData() async {
    //
    try {
      http.Response response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
          headers: {
            "Content-type": "application/json",
          });
      print(response.body);
      return SinglePostResponse.fromJson(jsonDecode(response.body));
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return SinglePostResponse.withError("$error");
    }
  }
}
