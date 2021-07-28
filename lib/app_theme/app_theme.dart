import 'package:flutter/material.dart';
import 'package:flutter_arti/app_theme/app_color.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light = lightTheme;
}

ThemeData lightTheme = ThemeData(
  primaryColor: AppColor.mainColor,
    brightness: Brightness.light,
    backgroundColor: Colors.amber,
    scaffoldBackgroundColor: AppColor.canvasColor,
    hintColor: Colors.teal,
    primaryColorLight: Colors.green,
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 60,color: AppColor.textColorOne),
      headline2: TextStyle(fontSize: 50),
      bodyText1: TextStyle(color: AppColor.textColorOne), //define your customize setting
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(AppColor.elevatedColor)),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(foregroundColor:MaterialStateProperty.all<Color>(AppColor.outLinedButton),
          overlayColor: MaterialStateProperty.all<Color>(AppColor.outLinedButton.withOpacity(0.1)),
      ),
    ),
    buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.primary, buttonColor: Colors.black));
