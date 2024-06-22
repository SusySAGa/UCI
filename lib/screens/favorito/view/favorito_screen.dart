import 'package:FaunaRojaCu/components/constant.dart';
import 'package:FaunaRojaCu/components/settings_controller.dart';
import 'package:FaunaRojaCu/db/db_helper.dart';
import 'package:FaunaRojaCu/models/especie.dart';
import 'package:FaunaRojaCu/screens/especie/view/detalle_especie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListaFavorito extends StatefulWidget {
  final SettingsController settingsController;
  const ListaFavorito({super.key, required this.settingsController});

  @override
  State<ListaFavorito> createState() => _MiLista();
}

class _MiLista extends State<ListaFavorito> {
  List<EspecieModel> especies = [];

  TextEditingController _searchController = TextEditingController();
  String buscar = "";

  @override
  void initState() {
    cargaAnimales();
    super.initState();
  }

  cargaAnimales() async {
    List<EspecieModel> auxAnimal = await DbHelper.especiesFav(buscar);

    setState(() {
      especies = auxAnimal;
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
                  itemCount: especies.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: SizedBox(
                        height: 140,
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
                                        color: secundaryColor.withOpacity(0.3),
                                        offset: Offset(0, 5),
                                        blurRadius: 5.0,
                                        spreadRadius: 0)
                                  ],
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: secundaryColor),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 5,
                            child: Container(
                              width: 125,
                              height: 125,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(especies[i].imagen ??
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
                            top: 50,
                            child: Container(
                              height: 60,
                              width: 160,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      especies[i].nombre,
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
                                            DetalleEspecie(
                                                especieModel: especies[i],
                                                settingsController:
                                                    widget.settingsController),
                                      ));
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            left: 260,
                            top: 15,
                            child: IconButton(
                                onPressed: () {
                                  if (especies[i].favorito == 1) {
                                    DbHelper.removeFav(especies[i].id);
                                  } else {
                                    DbHelper.addFav(especies[i].id);
                                  }
                                  cargaAnimales();
                                },
                                icon: Icon(
                                    especies[i].favorito == 1
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: selectedColor)),
                          )
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
