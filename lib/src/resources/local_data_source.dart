import 'dart:convert';
import 'package:flutter_arti/src/models/singlePost.dart';
import 'package:flutter_arti/src/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  /// Gets the cached [SinglePostModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<SinglePostModel> getLastPost();

  Future<void> cachePost(SinglePostModel postModel);
}

const String CACHED_SINGLE_POST = 'CACHED_SINGLE_POST';

class LocalDataSourceImp extends LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<SinglePostModel> getLastPost() {
    final jsonString = sharedPreferences.getString(CACHED_SINGLE_POST);
    if(jsonString != null){
      return Future.value(SinglePostModel.fromJson(json.decode(jsonString)));
    }else{
      throw CacheException();
    }

  }

  @override
  Future<void> cachePost(SinglePostModel postModel) {
    return sharedPreferences.setString(
        CACHED_SINGLE_POST, json.encode(postModel.toJson()));
  }


}
