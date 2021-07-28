import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arti/src/models/singlePost.dart';
import 'package:flutter_arti/src/repository/repository.dart';

import '../shared.dart';

class PostSearchProvider with ChangeNotifier{

  final _repo = RepoImplementation();
  NotifierState _state = NotifierState.initial;
  NotifierState get state => _state;
  void _setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  Either<Failure, SinglePostModel>? _post;
  Either<Failure, SinglePostModel> get  post=>_post!;
  void _setPost(Either<Failure, SinglePostModel> post) {
    _post = post;
    notifyListeners();
  }

  Future<void> getPost(int number)async{
    _setState(NotifierState.loading);
    await _repo.getSearchPost(number).then((value) => _setPost(value));
    _setState(NotifierState.loaded);
  }
}