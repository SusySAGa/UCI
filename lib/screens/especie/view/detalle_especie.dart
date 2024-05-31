import 'package:FaunaRojaCu/components/constant.dart';
import 'package:FaunaRojaCu/models/especie.dart';
import 'package:flutter/material.dart';

class DetalleEspecie extends StatelessWidget {
  DetalleEspecie({super.key, required this.especieModel});
  final EspecieModel especieModel;

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
              decoration: BoxDecoration(color: primaryColor),
            ),
            Positioned(
              top: 300,
              child: Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: backPrimaryColor),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          especieModel.nombre,
                          style: TextStyle(
                            color: textPrimaryColor,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          especieModel.nombreCientifico,
                          style: TextStyle(
                            color: textPrimaryColor,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Estado de conservación:",
                          style: TextStyle(
                            color: textPrimaryColor,
                            fontSize: 20,
                          ),
                        ),
                        Divider(
                          color: primaryColor,
                          thickness: 2,
                        ),
                        Text(
                          especieModel.estado,
                          style: TextStyle(
                            color: textPrimaryColor,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Descripción:",
                          style: TextStyle(
                            color: textPrimaryColor,
                            fontSize: 20,
                          ),
                        ),
                        Divider(
                          color: primaryColor,
                          thickness: 2,
                        ),
                        Text(
                          especieModel.descripcion,
                          style: TextStyle(
                            color: textPrimaryColor,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Amenazas:",
                          style: TextStyle(
                            color: textPrimaryColor,
                            fontSize: 20,
                          ),
                        ),
                        Divider(
                          color: primaryColor,
                          thickness: 2,
                        ),
                        Text(
                          especieModel.amenaza,
                          style: TextStyle(
                            color: textPrimaryColor,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Acciones de conservación:",
                          style: TextStyle(
                            color: textPrimaryColor,
                            fontSize: 20,
                          ),
                        ),
                        Divider(
                          color: primaryColor,
                          thickness: 2,
                        ),
                        Text(
                          especieModel.accion,
                          style: TextStyle(
                            color: textPrimaryColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 300,
              top: 250,
              child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: secundaryColor,
                  ),
                  child:
                      IconButton(onPressed: () {}, icon: Icon(Icons.favorite))),
            ),
            Positioned(
              left: 30,
              top: 10,
              child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: secundaryColor,
                  ),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/");
                      },
                      icon: Icon(Icons.arrow_left))),
            )
          ],
        ),
      ),
    );
  }
}
