// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

final dakrTheme = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        scaffoldBackgroundColor: const Color.fromARGB(255, 36, 34, 34),
        dividerColor: Colors.white24,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 36, 34, 34),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w700,)),
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.w500,
            fontSize: 20
            ),
            labelSmall: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontWeight: FontWeight.w700,
              fontSize: 14),
        )
);