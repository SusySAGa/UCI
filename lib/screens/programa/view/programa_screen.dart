import 'package:FaunaRojaCu/components/constant.dart';
import 'package:FaunaRojaCu/components/settings_controller.dart';
import 'package:FaunaRojaCu/db/db_helper.dart';
import 'package:FaunaRojaCu/models/programa.dart';
import 'package:FaunaRojaCu/screens/programa/view/detalle_programa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListaPrograma extends StatefulWidget {
  final SettingsController settingsController;
  const ListaPrograma({super.key, required this.settingsController});
  @override
  State<ListaPrograma> createState() => _MiLista();
}

class _MiLista extends State<ListaPrograma> {
  List<ProgramaModel> programas = [];

  TextEditingController _searchController = TextEditingController();
  String buscar = "";

  @override
  void initState() {
    cargaAnimales();
    super.initState();
  }

  cargaAnimales() async {
    List<ProgramaModel> auxAnimal = await DbHelper.programas(buscar);

    setState(() {
      programas = auxAnimal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: primaryColor),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  buscar = value;

                  cargaAnimales();
                },
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  border: InputBorder.none,
                  hintText: 'Buscar',
                  hintStyle: TextStyle(color: Colors.white),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: programas.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: SizedBox(
                        height: 130,
                        child: Stack(children: <Widget>[
                          Positioned(
                            left: 15,
                            top: 12,
                            child: Container(
                                width: 300,
                                height: 110,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              secundaryColor.withOpacity(0.3),
                                          offset: Offset(0, 5),
                                          blurRadius: 5.0,
                                          spreadRadius: 0)
                                    ],
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: secundaryColor)),
                          ),
                          Positioned(
                            left: 0,
                            top: 5,
                            child: Container(
                              width: 125,
                              height: 125,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(programas[i].imagen ??
                                      "assets/icon/logo.png"),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: primaryColor.withOpacity(0.3),
                                      offset: Offset(0, 5),
                                      blurRadius: 5.0,
                                      spreadRadius: 0)
                                ],
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 150,
                            top: 20,
                            child: Container(
                              alignment: Alignment.topLeft,
                              height: 80,
                              width: 150,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(
                                      programas[i].nombre,
                                      style: const TextStyle(
                                        color: textPrimaryColor,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 15,
                            top: 12,
                            child: Container(
                              width: 300,
                              height: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            DetallePrograma(
                                                programaModel: programas[i],
                                                settingsController:
                                                    widget.settingsController),
                                      ));
                                },
                              ),
                            ),
                          ),
                        ]),
                      ),
                    );
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
