import 'package:dartz/dartz.dart';
import 'package:flutter_arti/src/models/singlePost.dart';
import 'package:flutter_arti/src/resources/remote_data_source.dart';

import '../shared.dart';

abstract class Repository {
  Future<Either<Failure, SinglePostModel>> getSinglePost();
  Future<Either<Failure, SinglePostModel>> getSearchPost(int number);
}

class RepoImplementation extends Repository {
  final RemoteDataSource _remote = RemoteDataSource();

  @override
  Future<Either<Failure, SinglePostModel>> getSearchPost(int number) {
    return Task(() => _remote.searchPost(number))
        .attempt()
        .map(
      // Grab only the *left* side of Either<Object, Post>
            (either) => either.leftMap((obj) {
          // Cast the Object into a Failure
          return obj as Failure;
        }))
        .run();
  }

  @override
  Future<Either<Failure, SinglePostModel>> getSinglePost() {
    return Task(() => _remote.getPost())
        .attempt()
        .map(
      // Grab only the *left* side of Either<Object, Post>
            (either) => either.leftMap((obj) {
          // Cast the Object into a Failure
          return obj as Failure;
        }))
        .run();
  }
}
