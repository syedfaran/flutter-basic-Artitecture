import 'package:flutter/material.dart ';
import 'package:flutter_arti/app_string/app_routing.dart';
import 'package:flutter_arti/app_theme/app_theme.dart';
import 'package:flutter_arti/homePage.dart';
import 'package:flutter_arti/routeGenerate.dart';

//app theming

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: AppTheme.light,
      initialRoute:  AppRouting.secondPage,  // ->'/',
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorObservers: [],
    );
  }
}

