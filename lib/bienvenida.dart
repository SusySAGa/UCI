import 'package:FaunaRojaCu/components/constant.dart';
import 'package:FaunaRojaCu/components/settings_controller.dart';
import 'package:FaunaRojaCu/screens/home/view/home.dart';
import 'package:flutter/material.dart';

class Bienvenida extends StatefulWidget {
  final SettingsController settingsController;
  const Bienvenida({super.key, required this.settingsController});

  @override
  State<Bienvenida> createState() => _BienvenidaState();
}

class _BienvenidaState extends State<Bienvenida> {
  @override
  void initState() {
    super.initState();
    var d = const Duration(seconds: 4);
    Future.delayed(d, () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Home(settingsController: widget.settingsController)),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 500,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icon/logo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(70),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    titleTextStyle: TextStyle(color: primaryColor),
                    title: Text(
                      "FaunaRojaCu ",
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      "Conozca la fauna endémica de Cuba en peligro de extinción",
                      style: TextStyle(fontSize: 20, color: primaryColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  CircularProgressIndicator(
                    color: primaryColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
