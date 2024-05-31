import 'package:FaunaRojaCu/bienvenida.dart';
import 'package:flutter/material.dart';
import 'package:FaunaRojaCu/components/theme_constants.dart';
import 'package:FaunaRojaCu/screens/home/view/home.dart';
import 'package:FaunaRojaCu/viewmodel/theme_manager.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: const Bienvenida(),
      routes: {
        '/home': (context) => const Home(),
      },
    );
  }
}
