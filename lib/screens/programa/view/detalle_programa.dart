import 'package:FaunaRojaCu/components/constant.dart';
import 'package:FaunaRojaCu/models/programa.dart';
import 'package:flutter/material.dart';

class DetallePrograma extends StatelessWidget {
  DetallePrograma({super.key, required this.programaModel});
  final ProgramaModel programaModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                          programaModel.nombre,
                          style: TextStyle(
                            color: textPrimaryColor,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Descripción",
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
                          programaModel.descripcion,
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
