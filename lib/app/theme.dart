import 'package:flutter/material.dart';

ThemeData darktheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
  ),

  //! TextTheme
  textTheme: TextTheme(
    //* text titleMedium
    bodySmall: TextStyle(
      shadows: List.filled(
        1,
        BoxShadow(color: Colors.black, offset: Offset(1, 1)),
      ),
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 20,
    ),
    //* text titleMedium
    bodyMedium: TextStyle(
      shadows: List.filled(
        1,
        BoxShadow(color: Colors.black, offset: Offset(1, 1)),
      ),
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 20,
    ),

    //*text bodyLarge
    bodyLarge: TextStyle(
      shadows: List.filled(
        1,
        BoxShadow(color: Colors.black, offset: Offset(1, 1)),
      ),
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontSize: 90,
    ),
  ),
);
