import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white70,
    fontFamily: 'Muli',
    appBarTheme: _appBarTheme(),
  );
}

AppBarTheme _appBarTheme() {
  return const AppBarTheme(
      color: Colors.white10,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.amber),
      titleTextStyle: TextStyle(
        color: Colors.cyanAccent,
        fontSize: 20,
      )
  );
}
