import 'package:flutter/material.dart';
import 'package:flutter_arti/src/models/singlePost.dart';
import 'package:flutter_arti/src/resources/repository.dart';

class PostProvider with ChangeNotifier {
  Repository _repository = Repository();
  SinglePostResponse? _singlePostResponse;
  bool loading = false;

  Future<void> updateData() async {
    setLoading(true);
   await _repository.fetchData().then((value) {
     print(value.success.id);
     setLoading(false);
     setPost(value);
    });
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }


  void setPost(SinglePostResponse value) {
    _singlePostResponse = value;
    notifyListeners();
  }
   SinglePostResponse? get singlePost=>_singlePostResponse;
}
