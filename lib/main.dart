import 'package:FaunaRojaCu/bienvenida.dart';
import 'package:FaunaRojaCu/components/settings_controller.dart';
import 'package:FaunaRojaCu/components/settings_service.dart';
import 'package:flutter/material.dart';

import 'package:FaunaRojaCu/screens/home/view/home.dart';

import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();

  runApp(MyApp(settingsController: settingsController));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp(settingsController: settingsController));
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.settingsController});
  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          theme: settingsController.lightTheme, // Tema claro
          darkTheme: settingsController.darkTheme,
          themeMode: settingsController.themeMode,
          debugShowCheckedModeBanner: false,
          home: Bienvenida(settingsController: settingsController),
          routes: {
            '/home': (context) => Home(settingsController: settingsController),
          },
        );
      },
    );
  }
}
