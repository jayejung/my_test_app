import 'package:flutter/material.dart';
import 'package:my_test_app/constants/consts.dart';
import 'package:my_test_app/screens/screens.dart';

void main() {
  runApp(MaterialApp(
    title: "My first App demo",
    initialRoute: '/',
    routes: {
      Consts.mainRoute: (context) => MainScreen(),
      Consts.qrReaderRoute: (context) => QrReaderScreen(),
    },
    theme: ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(Consts.mainColor),
        onPrimary: Colors.black,
        secondary: Colors.grey,
        onSecondary: Colors.grey,
        background: Colors.grey,
        onBackground: Colors.grey,
        surface: Colors.grey,
        onSurface: Colors.grey,
        error: Colors.grey,
        onError: Colors.grey,
      ),
    ),
  ));
}




