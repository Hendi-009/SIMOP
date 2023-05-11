import 'package:flutter/material.dart';

enum ThemeMode { light, dark }

class ThemeNotifier extends ChangeNotifier {
  ThemeData defaultTheme = ThemeData(
    primarySwatch: Colors.green,
    fontFamily: 'Poppins',
  );
  ThemeData _lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Color(0xFFFCFCFC),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF65A25E)),
      titleMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF65A25E)),
      titleSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF65A25E)),
      headlineSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF111111)),
      bodyLarge: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111111)),
      bodyMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF777777)),
      bodySmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF111111)),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color(0xFFFCFCFC),
      ),
      labelSmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF65A25E)),
    ),
  );
  ThemeData _darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF65A25E)),
      titleMedium: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: Color(0xFF65A25E)),
      titleSmall: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF65A25E)),
      headlineLarge: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF111111)),
      bodyLarge: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF111111)),
      bodyMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF777777)),
      bodySmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF111111)),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color(0xFFFCFCFC),
      ),
      labelSmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xFF65A25E)),
    ),
  );

  ThemeData _currentTheme = ThemeData.light();

  ThemeData get currentTheme => _currentTheme;

  ThemeMode _currentMode = ThemeMode.light;

  ThemeMode get currentMode => _currentMode;

  void toggleTheme() {
    _currentMode =
        _currentMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    _currentTheme = _currentMode == ThemeMode.light ? _lightTheme : _darkTheme;
    notifyListeners();
  }
}
