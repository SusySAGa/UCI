import 'package:FaunaRojaCu/components/constant.dart';
import 'package:FaunaRojaCu/components/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Enlaces extends StatefulWidget {
  final SettingsController settingsController;
  const Enlaces({super.key, required this.settingsController});

  @override
  State<Enlaces> createState() => _EnlacesState();
}

class _EnlacesState extends State<Enlaces> {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 35, right: 25),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Enlaces',
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
                //enlace 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () async {
                          await launch(
                              'https://www.citma.gob.cu/'); // Abrir la URL en el navegador
                        },
                        icon: const Icon(
                          Icons.link,
                          color: primaryColor,
                        )),
                    const SizedBox(
                      width: 35,
                    ),
                    const Text(
                      'citma.gob.cu',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 30,
                ),

                //enlace 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () async {
                          await launch(
                              'https://www.iucnredlist.org/es/search/grid'); // Abrir la URL en el navegador
                        },
                        icon: const Icon(
                          Icons.link,
                          color: primaryColor,
                        )),
                    const SizedBox(
                      width: 35,
                    ),
                    const Text(
                      'iucnredlist.org',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
