//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_arti/myApp.dart';
import 'package:flutter_arti/src/repository/repository.dart';
import 'package:flutter_arti/src/resources/local_data_source.dart';
import 'package:flutter_arti/src/resources/remote_data_source.dart';
import 'package:flutter_arti/src/shared.dart';
import 'package:flutter_arti/src/DataProvider/single_PostProvider.dart';
import 'package:flutter_arti/src/DataProvider/postSearchProvider.dart';
import 'package:provider/provider.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(MultiProvider(providers: [
    FutureProvider<SharedPreferences>(create: (context)=>SharedPreferences.getInstance(), initialData: null),
    Provider(create: (context) => RemoteDataSourceImp()),
    ProxyProvider<SharedPreferences,LocalDataSourceImp>(update: (context,share,local)=>LocalDataSourceImp(sharedPreferences: share)),
    StreamProvider<DataConnectionStatus>.value(value: DataConnectionChecker().onStatusChange, initialData: DataConnectionStatus.disconnected),
    //FutureProvider<bool>.value(value: DataConnectionChecker().hasConnection, initialData: true),
    ProxyProvider3<DataConnectionStatus, RemoteDataSourceImp, LocalDataSourceImp, RepoImplementation>(update: (context, status, remote, local, repo) => RepoImplementation(status, remote, local)),
    ChangeNotifierProxyProvider<RepoImplementation,PostProvider>(create: (context) => PostProvider(Provider.of<RepoImplementation>(context,listen: false)),update: (context,repo, post)=>PostProvider(repo)),
    ChangeNotifierProxyProvider<RepoImplementation,PostSearchProvider>(create: (context) => PostSearchProvider(Provider.of<RepoImplementation>(context,listen: false)),update:(context,repo, post)=>PostSearchProvider(repo)),
  ], child: MyApp()));
}
