import 'package:flutter/material.dart';
import 'package:tech_titans/core/theme/noSplashFactory.dart';

abstract class ThemeBuilder {
  static const colorThemeList = [
    //Color(0xFFd8d8d8),
    Color(0xFFEAE7E2),
    //Color(0xFFb0bec5),
    //Color(0xFFFFFFFF),
    //Color(0xFFFCFCFC)
  ];
  static ThemeData buildThemeData(
      {required int themeColorIndex, required bool isDarkMode}) {
    return !isDarkMode
        ? lightTheme(isDarkMode, themeColorIndex)
        : darkTheme(isDarkMode, themeColorIndex);
  }

  static ThemeData lightTheme(bool isDarkMode, int themeColorIndex) {
    return ThemeData(
      primaryColor: Colors.white,
      primaryColorDark: Colors.grey[800],
      accentColor: Colors.grey[400],
      fontFamily: 'Open Sans',
      splashColor: Colors.white,
      canvasColor: Color(0xFFCECBC6),
      dividerTheme: DividerThemeData(
          color: Colors.grey[400], indent: 15, endIndent: 15, space: 0),
      splashFactory: NoSplashFactory(),
      primaryTextTheme: TextTheme(button: TextStyle(color: Colors.grey[800])),
      dialogBackgroundColor: Colors.white,
      dialogTheme: DialogTheme(backgroundColor: Colors.white),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          titleTextStyle: TextStyle(color: Colors.grey[800])),
      scaffoldBackgroundColor: colorThemeList[themeColorIndex],
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(color: Colors.white)))),
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      }),
    );
  }

  static ThemeData darkTheme(bool isDarkMode, int themeColorIndex) {
    return lightTheme(isDarkMode, themeColorIndex).copyWith(
        primaryColor: Colors.grey[800],
        primaryColorDark: Colors.white,
        scaffoldBackgroundColor: Color.fromRGBO(20, 20, 20, 1),
        dialogTheme: DialogTheme(backgroundColor: Colors.grey[800]),
        appBarTheme: AppBarTheme(
            color: Colors.transparent,
            brightness: Brightness.dark,
            titleTextStyle: TextStyle(color: Colors.grey[200])),
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 72.0,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(220, 220, 220, 1)),
          headline6: TextStyle(
              fontSize: 36.0,
              fontStyle: FontStyle.italic,
              color: Color.fromRGBO(220, 220, 220, 1)),
          bodyText1: TextStyle(
              fontSize: 36.0,
              fontStyle: FontStyle.italic,
              color: Color.fromRGBO(220, 220, 220, 1)),
          bodyText2: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Hind',
              color: Color.fromRGBO(220, 220, 220, 1)),
        ),
        dividerTheme: DividerThemeData(
            color: Colors.grey[600], indent: 15, endIndent: 15, space: 0),
        iconTheme: IconThemeData(color: Colors.white),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(color: Colors.white))),
        ));
  }
}