import 'package:FaunaRojaCu/components/constant.dart';
import 'package:FaunaRojaCu/components/settings_controller.dart';
import 'package:FaunaRojaCu/models/especie.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetalleEspecie extends StatefulWidget {
  final SettingsController settingsController;
  const DetalleEspecie(
      {super.key,
      required this.especieModel,
      required this.settingsController});

  final EspecieModel especieModel;

  @override
  State<DetalleEspecie> createState() => _DetalleEspecieState();
}

class _DetalleEspecieState extends State<DetalleEspecie> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      widget.especieModel.imagen ?? "assets/icon/logo.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 350,
              child: Container(
                height: MediaQuery.of(context).size.height - 350,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: widget.settingsController.themeMode == ThemeMode.light
                      ? containerLightModeColor
                      : containerDarkModeColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.especieModel.nombre,
                          style: TextStyle(
                            fontSize: _tamannoLetra,
                          ),
                        ),
                        Text(
                          widget.especieModel.nombreCientifico,
                          style: TextStyle(
                            fontSize: _tamannoLetra,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Estado de conservación:",
                          style: TextStyle(
                            fontSize: _tamannoLetra,
                          ),
                        ),
                        const Divider(
                          color: primaryColor,
                          thickness: 2,
                        ),
                        Text(
                          widget.especieModel.estado,
                          style: TextStyle(
                            fontSize: _tamannoLetra,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Descripción:",
                          style: TextStyle(
                            fontSize: _tamannoLetra,
                          ),
                        ),
                        const Divider(
                          color: primaryColor,
                          thickness: 2,
                        ),
                        Text(
                          widget.especieModel.descripcion,
                          style: TextStyle(
                            fontSize: _tamannoLetra,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Amenazas:",
                          style: TextStyle(
                            fontSize: _tamannoLetra,
                          ),
                        ),
                        const Divider(
                          color: primaryColor,
                          thickness: 2,
                        ),
                        Text(
                          widget.especieModel.amenaza,
                          style: TextStyle(
                            fontSize: _tamannoLetra,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Acciones de conservación:",
                          style: TextStyle(
                            fontSize: _tamannoLetra,
                          ),
                        ),
                        const Divider(
                          color: primaryColor,
                          thickness: 2,
                        ),
                        Text(
                          widget.especieModel.accion,
                          style: TextStyle(
                            fontSize: _tamannoLetra,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30,
              top: 10,
              child: Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: secundaryColor,
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context, "/");
                      },
                      icon: const Icon(
                        Icons.arrow_left,
                        color: selectedColor,
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
