import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color.fromARGB(255, 61, 103, 255);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Color Primario
    primaryColor: primary,

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      iconTheme: IconThemeData(
        color: primary,
      ),
    ),

    // TextButton Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: primary),
    ),

    // FloatingActionsBottons
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
    ),

    // ElevationButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primary,
        shape: const StadiumBorder(),
        elevation: 10,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle:
          TextStyle(color: primary, fontWeight: FontWeight.w800),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromARGB(195, 158, 158, 158),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: primary,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),
  );

  static const TextStyle titleScreen = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  // Tap Homw Screen Style
  static const TabStyle tabStyle = TabStyle.reactCircle;

  // Option Menu Style
  static final BoxDecoration optionMenuDecoration = BoxDecoration(
    color: Colors.grey.shade200,
    borderRadius: BorderRadius.circular(10),
    boxShadow: const [
      BoxShadow(
        color: Colors.grey,
        offset: Offset(0, 4),
        blurRadius: 5,
      ),
    ],
  );

  // Title Option Menu style
  static const TextStyle titleOptionHomeMenu = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w800,
  );
}
