import 'package:FaunaRojaCu/components/constant.dart';
import 'package:flutter/material.dart';

class AjustesApp extends StatefulWidget {
  const AjustesApp({super.key});

  @override
  State<AjustesApp> createState() => _AjustesAppState();
}

class _AjustesAppState extends State<AjustesApp> {
  double _tamannoLetra = 20.0;
  bool clickedButton = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: const BoxDecoration(
        color: Colors.white,
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
                        style: TextStyle(fontSize: 20),
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
                        });
                      }),

                  const SizedBox(
                    height: 30,
                  ),

                  //modos
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              clickedButton = !clickedButton;
                            });
                          },
                          icon: Icon(
                            (clickedButton == true)
                                ? Icons.nightlight
                                : Icons.sunny,
                            color: primaryColor,
                          )),
                      const SizedBox(
                        width: 35,
                      ),
                      Text(
                        (clickedButton == true)
                            ? 'Modo nocturno'
                            : 'Modo diurno',
                        style: const TextStyle(
                          color: Colors.black,
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
