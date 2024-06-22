import 'package:FaunaRojaCu/components/constant.dart';
import 'package:FaunaRojaCu/components/settings_controller.dart';
import 'package:flutter/material.dart';

class AcercaDe extends StatefulWidget {
  final SettingsController settingsController;
  const AcercaDe({super.key, required this.settingsController});

  @override
  State<AcercaDe> createState() => _AcercaDeState();
}

class _AcercaDeState extends State<AcercaDe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: widget.settingsController.themeMode == ThemeMode.light
            ? containerLightModeColor
            : containerDarkModeColor,
        borderRadius: BorderRadius.only(
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
                    'Acerca de',
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
              child: const Column(
                children: [
                  Text(
                    "FaunaRojaCu",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Versión: 1.0",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Desarrollada por:",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Susana Avelenda García",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Agradecimientos:",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Juan Antonio Plasencia Soler",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Alain Cruz Jiménez",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Proyecto Asociado al Programa Sectorial del Ministerio de Ciencia, Tecnología y Medio Ambiente de Cuba: PS211LH008-011 “Ecosistema de ciencia, tecnología e innovación para contribuir al cumplimiento de los Objetivos de Desarrollo Sostenible desde las instituciones de educación superior”.",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
