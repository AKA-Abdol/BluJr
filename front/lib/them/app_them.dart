import 'package:flutter/material.dart';

mixin AppTheme {
  static ThemeData get light => ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
        fontFamily: 'Vazir',
        shadowColor: const Color(0xFFE0E0E0),
        highlightColor: const Color(0xFF5AB9E6),
        dividerColor: const Color.fromARGB(255, 140, 140, 140),
        cardColor: const Color.fromARGB(255, 161, 161, 161),
        primaryColor: const Color(0xFF002134),
        scaffoldBackgroundColor: Colors.white,
        disabledColor: const Color(0xFF9B9B9B),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF002134),
          centerTitle: true,
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF787878),
        ),
        primaryIconTheme: const IconThemeData(
          color: Color(0xFFff6600),
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          outline: Color(0xFFCDCDCD),
          primary: Color(0xFF002134),
          onPrimary: Colors.white,
          secondary: Color(0xFFff6600),
          onSecondary: Colors.white,
          error: Color(0xFFC84045),
          onError: Colors.white,
          background: Color(0xFFF2F2F2),
          onBackground: Color(0xFF474747),
          surface: Color(0xFFF2F2F2),
          onSurface: Color(0xFF474747),
          errorContainer: Color(0xFFDC362E),
          onErrorContainer: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFFff6600),
          unselectedItemColor: Color(0xFF9B9B9B),
          showUnselectedLabels: true,
        ),
        textButtonTheme: const TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(
              TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xFFff6600),
              ),
            ),
            foregroundColor: MaterialStatePropertyAll(
              Color(0xFFff6600),
            ),
          ),
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xFF474747),
          ),
          bodyMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF474747),
          ),
          bodyLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF474747),
          ),
          bodySmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Color(0xFF9F9F9F),
          ),
          titleSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xFF002E3D),
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF002E3D),
          ),
          displayLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF3A3A3A),
          ),
          displayMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF474747),
          ),
          displaySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF474747),
          ),
          labelSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      );
}
