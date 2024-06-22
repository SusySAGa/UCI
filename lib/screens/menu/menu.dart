import 'package:FaunaRojaCu/components/constant.dart';
import 'package:FaunaRojaCu/components/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:FaunaRojaCu/screens/menu/acercade.dart';
import 'package:FaunaRojaCu/screens/menu/ajustes.dart';
import 'package:FaunaRojaCu/screens/menu/enlaces.dart';

class MenuApp extends StatefulWidget {
  final SettingsController settingsController;
  const MenuApp({super.key, required this.settingsController});

  @override
  State<MenuApp> createState() => _MenuState();
}

class _MenuState extends State<MenuApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryColor,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: primaryColor,
            ),
            child: Text(
              'FaunaRojaCu',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            title: const Text('Inicio'),
            textColor: Colors.white,
            leading: const Icon(Icons.home),
            iconColor: Colors.white,
            onTap: () {
              // Update the state of the app.
              Navigator.pushNamed(context, '/home');
              // ...
            },
          ),
          ListTile(
            title: const Text('Ajustes'),
            textColor: Colors.white,
            leading: const Icon(Icons.settings),
            iconColor: Colors.white,
            onTap: () {
              // Update the state of the app.
              Scaffold.of(context).closeDrawer();
              showModalBottomSheet(
                  context: context,
                  enableDrag: false,
                  isDismissible: false,
                  backgroundColor: Colors.transparent,
                  builder: (context) => AjustesApp(
                      settingsController: widget.settingsController));
              //Scaffold.of(context)
              //.showBottomSheet((context) => const AjustesApp());
              // ...
            },
          ),
          ListTile(
            title: const Text('Acerca de'),
            textColor: Colors.white,
            leading: const Icon(Icons.info),
            iconColor: Colors.white,
            onTap: () {
              // Update the state of the app.
              Scaffold.of(context).closeDrawer();
              showModalBottomSheet(
                  context: context,
                  enableDrag: false,
                  isDismissible: false,
                  backgroundColor: Colors.transparent,
                  builder: (context) =>
                      AcercaDe(settingsController: widget.settingsController));
              // ...
            },
          ),
          ListTile(
            title: const Text('Enlaces de interés'),
            textColor: Colors.white,
            leading: const Icon(Icons.link),
            iconColor: Colors.white,
            onTap: () {
              // Update the state of the app.
              Scaffold.of(context).closeDrawer();
              showModalBottomSheet(
                  context: context,
                  enableDrag: false,
                  isDismissible: false,
                  backgroundColor: Colors.transparent,
                  builder: (context) =>
                      Enlaces(settingsController: widget.settingsController));
              // ...
            },
          ),
        ],
      ),
    );
  }
}
