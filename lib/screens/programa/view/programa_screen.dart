import 'package:FaunaRojaCu/components/constant.dart';
import 'package:FaunaRojaCu/db/db_helper.dart';
import 'package:FaunaRojaCu/models/programa.dart';
import 'package:FaunaRojaCu/screens/programa/view/detalle_programa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListaPrograma extends StatefulWidget {
  const ListaPrograma({
    super.key,
  });
  @override
  State<ListaPrograma> createState() => _MiLista();
}

class _MiLista extends State<ListaPrograma> {
  List<ProgramaModel> programas = [];

  @override
  void initState() {
    cargaAnimales();
    super.initState();
  }

  cargaAnimales() async {
    List<ProgramaModel> auxAnimal = await DbHelper.programas();

    setState(() {
      programas = auxAnimal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                                color: secundaryColor.withOpacity(0.3),
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
                  top: 20,
                  child: Container(
                    alignment: Alignment.topLeft,
                    height: 100,
                    width: 150,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            programas[i].nombre,
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
                              builder: (BuildContext context) =>
                                  DetallePrograma(
                                programaModel: programas[i],
                              ),
                            ));
                      },
                    ),
                  ),
                ),
              ]),
            ),
          );
        });
  }
}
