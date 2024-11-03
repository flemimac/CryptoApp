import 'package:flutter/material.dart';
import 'package:flutter_learn/router/router.dart';
import 'package:flutter_learn/theme/theme.dart';

class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCurrencuestList',
      theme: dakrTheme,
      routes: routes,
    );
  }
}