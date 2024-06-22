import 'package:FaunaRojaCu/components/constant.dart';
import 'package:FaunaRojaCu/components/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AjustesApp extends StatefulWidget {
  final SettingsController settingsController;
  const AjustesApp({super.key, required this.settingsController});

  @override
  State<AjustesApp> createState() => _AjustesAppState();
}

class _AjustesAppState extends State<AjustesApp> {
  double _tamannoLetra = 20.0;

  @override
  void initState() {
    super.initState();
    _loadFontSize();
  }

  Future<void> _loadFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    final fontSize = prefs.getDouble('fontSize');
    if (fontSize != null) {
      setState(() {
        _tamannoLetra = fontSize;
      });
    }
  }

  Future<void> _saveFontSize(double fontSize) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSize', fontSize);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: widget.settingsController.themeMode == ThemeMode.light
            ? containerLightModeColor
            : containerDarkModeColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 35, right: 25),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Ajustes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: Column(
                children: [
                  //tamaño de letra
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Tamaño de letra",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),

                  Slider(
                      value: _tamannoLetra,
                      activeColor: primaryColor,
                      inactiveColor: Colors.black,
                      min: 10,
                      max: 30,
                      onChanged: (value) {
                        setState(() {
                          _tamannoLetra = value;
                          _saveFontSize(value);
                        });
                      }),

                  const SizedBox(
                    height: 15,
                  ),

                  //ejemplo de tamaño de letra
                  Text(
                    "Ejemplo",
                    style: TextStyle(
                      fontSize: _tamannoLetra,
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  //modos
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            widget.settingsController.setThemeMode(
                              widget.settingsController.themeMode ==
                                      ThemeMode.light
                                  ? ThemeMode.dark
                                  : ThemeMode.light,
                            );
                          },
                          icon: Icon(
                            (widget.settingsController.themeMode ==
                                    ThemeMode.light)
                                ? Icons.nightlight
                                : Icons.sunny,
                            color: primaryColor,
                          )),
                      const SizedBox(
                        width: 35,
                      ),
                      Text(
                        (widget.settingsController.themeMode == ThemeMode.light)
                            ? 'Modo nocturno'
                            : 'Modo diurno',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
