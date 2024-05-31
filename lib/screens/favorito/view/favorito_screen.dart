import 'package:FaunaRojaCu/components/constant.dart';
import 'package:FaunaRojaCu/db/db_helper.dart';
import 'package:FaunaRojaCu/models/especie.dart';
import 'package:FaunaRojaCu/screens/especie/view/detalle_especie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListaFavorito extends StatefulWidget {
  const ListaFavorito({
    super.key,
  });

  @override
  State<ListaFavorito> createState() => _MiLista();
}

class _MiLista extends State<ListaFavorito> {
  List<EspecieModel> especies = [];

  @override
  void initState() {
    cargaAnimales();
    super.initState();
  }

  cargaAnimales() async {
    List<EspecieModel> auxAnimal = await DbHelper.especiesFav();

    setState(() {
      especies = auxAnimal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                      boxShadow: [
                        BoxShadow(
                            color: primaryColor.withOpacity(0.3),
                            offset: Offset(0, 5),
                            blurRadius: 5.0,
                            spreadRadius: 0)
                      ],
                      shape: BoxShape.circle,
                      color: primaryColor,
                    ),
                  ),
                ),
                Positioned(
                  left: 150,
                  top: 50,
                  child: Container(
                    height: 100,
                    width: 160,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            especies[i].nombre,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            especies[i].nombreCientifico,
                            style: TextStyle(
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
                              builder: (BuildContext context) => DetalleEspecie(
                                especieModel: especies[i],
                              ),
                            ));
                      },
                    ),
                  ),
                ),
                Positioned(
                  left: 260,
                  top: 20,
                  child:
                      IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                )
              ]),
            ),
          );
        });
  }
}
