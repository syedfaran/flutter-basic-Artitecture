import 'package:flutter/material.dart';
import 'package:flutter_arti/myApp.dart';
import 'package:flutter_arti/src/shared.dart';
import 'package:flutter_arti/src/DataProvider/single_PostProvider.dart';
import 'package:flutter_arti/src/DataProvider/postSearchProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => PostProvider()),
    ChangeNotifierProvider(create: (context) => PostSearchProvider()),
  ], child: MyApp()));
}




