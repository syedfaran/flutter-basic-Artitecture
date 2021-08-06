import 'package:dartz/dartz.dart';
import 'package:flutter_arti/src/models/singlePost.dart';
import 'package:flutter_arti/src/resources/local_data_source.dart';
import 'package:flutter_arti/src/resources/remote_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared.dart';

typedef Future<SinglePost> _ConcreteOrRandomChooser();

abstract class Repository {
  Future<Either<Failure, SinglePost>> getSinglePost();

  Future<Either<Failure, SinglePost>> getSearchPost(int number);
}

class RepoImplementation extends Repository {
  final RemoteDataSourceImp _remote = RemoteDataSourceImp();

  @override
  Future<Either<Failure, SinglePost>> getSearchPost(int number)async {

   return _getTrivia((){
     return _remote.searchPost(number);
    });
    // return Task(() => _remote.searchPost(number))
    //     .attempt()
    //     .map(
    //         // Grab only the *left* side of Either<Object, Post>
    //         (either) => either.leftMap((obj) {
    //               // Cast the Object into a Failure
    //               return obj as Failure;
    //             }))
    //     .run();
  }

  @override
  Future<Either<Failure, SinglePost>> getSinglePost() {
    return _getTrivia((){
      return _remote.getPost();
    });
    // return Task(() => _remote.getPost())
    //     .attempt()
    //     .map(
    //         // Grab only the *left* side of Either<Object, Post>
    //         (either) => either.leftMap((obj) {
    //               // Cast the Object into a Failure
    //               return obj as Failure;
    //             }))
    //     .run();
  }

  /// ****************************************************************************/

  Future<Either<Failure, SinglePost>> _getTrivia(
      _ConcreteOrRandomChooser getConcreteOrRandom) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    LocalDataSourceImp _local = LocalDataSourceImp(sharedPreferences: preferences);
    if (true) {
      try {
        final remoteTrivia = await getConcreteOrRandom();
        print('faran $remoteTrivia');
        _local.cachePost(remoteTrivia as SinglePostModel);
        return Right(remoteTrivia);
      } on ServerException {
        print('faran failure');
        return Left(Failure('Server Failure'));
      }
    } else {
      try {
        final localTrivia = await _local.getLastPost();

        return Right(localTrivia);
      } on CacheException {
        return Left(Failure('Cache failure'));
      }
    }
  }
}
