import 'package:flutter_arti/src/models/singlePost.dart';
import 'package:flutter_arti/src/resources/networkClient.dart';

class Repository {
  final NetworkClient _jsonProvider = NetworkClient();

  Future<SinglePostResponse> fetchData() async => await _jsonProvider.getData();
}