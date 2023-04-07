import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      titleSpacing: 20,
      backgroundColor: Colors.white,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(color: Colors.black)),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
    // selectedItemColor: Theme.of(context).colorScheme.secondary,
    elevation: 20,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color.fromRGBO(98, 0, 238, 1),
    secondary: const Color.fromRGBO(3, 218, 197, 1),
  ),
  // fontFamily: 'Janna',
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
      titleSpacing: 20,
      backgroundColor: HexColor('333739'),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: HexColor('333739'),
        statusBarIconBrightness: Brightness.light,
      ),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      iconTheme: const IconThemeData(color: Colors.white)),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Colors.grey,
    backgroundColor: HexColor('333739'),
    // selectedItemColor: Theme.of(context).colorScheme.secondary,
    elevation: 20,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color.fromRGBO(98, 0, 238, 1),
    secondary: const Color.fromRGBO(3, 218, 197, 1),
  ),
  // fontFamily: 'Janna',
);
