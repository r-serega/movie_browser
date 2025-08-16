import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey[300],
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(),
  );
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey[800],
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(),
  );
}

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: const Color(0xFF111111), //Colors.amber[800],
        secondaryHeaderColor: const Color(0xFF3A3A3A),
        // backgroundColor: Colors.white,
        dialogBackgroundColor: Colors.grey[200],
        cardColor: Colors.grey[100],
        scaffoldBackgroundColor: Colors.white,
        // scaffoldBackgroundColor: Colors.grey[300],
        dividerColor: Colors.black,
        canvasColor: Colors.blue,
        disabledColor: Colors.red,
        fontFamily: 'Montserrat', //3
        textTheme: ThemeData.light().textTheme,
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.lightBlue,
        ));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: Colors.white,
        secondaryHeaderColor: Colors.grey[100],
        // primaryColor: Colors.grey[800],
        scaffoldBackgroundColor: Colors.grey[800],
        // backgroundColor: Colors.black,
        dialogBackgroundColor: Colors.grey[800],
        cardColor: Colors.grey[700],
        dividerColor: Colors.white,
        canvasColor: Colors.blueGrey[100],
        disabledColor: Colors.red,
        fontFamily: 'Montserrat',
        textTheme: ThemeData.dark().textTheme,
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.lightGreen,
        ));
  }
}
