import 'dart:io';

import 'package:FaunaRojaCu/models/especie.dart';
import 'package:FaunaRojaCu/models/programa.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> openDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    final path = join(await getDatabasesPath(), 'espPeligro.db');

    var exists = await File(path).exists();

    if (!exists) {
      ByteData data = await rootBundle.load(join('assets/db', 'espPeligro.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Save copied asset to documents
      await File(path).writeAsBytes(bytes);
    }
    var theDb = await openDatabase(
      path,
    );
    return theDb;
  }

  static Future<List<EspecieModel>> especies(String query) async {
    Database db = await openDB();
    final List<Map<String, dynamic>> maps = await db.query('especies',
        where: 'nombre_especie LIKE ?', whereArgs: ['%$query%']);
    // Convert the List<Map<String, dynamic> into a List.
    return List.generate(
        maps.length,
        (i) => EspecieModel(
              id: maps[i]['id_especie'],
              imagen: maps[i]['imagen_especie'],
              nombre: maps[i]['nombre_especie'],
              nombreCientifico: maps[i]['nombre_cientifico'],
              descripcion: maps[i]['descripcion_especie'],
              estado: maps[i]['estado_conservacion'],
              amenaza: maps[i]['amenazas'],
              accion: maps[i]['acciones_conservacion'],
              favorito: maps[i]['favorito'],
            ));
  }

  static Future<List<EspecieModel>> especiesFav(String query) async {
    Database db = await openDB();
    final List<Map<String, dynamic>> maps = await db.query('especies',
        where: 'favorito = 1  AND nombre_especie LIKE ?',
        whereArgs: ['%$query%']);
    // Convert the List<Map<String, dynamic> into a List.
    return List.generate(
        maps.length,
        (i) => EspecieModel(
              id: maps[i]['id_especie'],
              imagen: maps[i]['imagen_especie'],
              nombre: maps[i]['nombre_especie'],
              nombreCientifico: maps[i]['nombre_cientifico'],
              descripcion: maps[i]['descripcion_especie'],
              estado: maps[i]['estado_conservacion'],
              amenaza: maps[i]['amenazas'],
              accion: maps[i]['acciones_conservacion'],
              favorito: maps[i]['favorito'],
            ));
  }

  static Future<void> addFav(int? itemId) async {
    Database db = await openDB();
    await db.update("especies", {"favorito": 1},
        where: "id_especie = ?", whereArgs: [itemId]);
  }

  static Future<void> removeFav(int? itemId) async {
    Database db = await openDB();
    await db.update("especies", {"favorito": 0},
        where: "id_especie = ?", whereArgs: [itemId]);
  }

  static Future<List<ProgramaModel>> programas(String query) async {
    Database db = await openDB();
    final List<Map<String, dynamic>> maps = await db.query('programa',
        where: 'nombre_programa LIKE ?', whereArgs: ['%$query%']);
    // Convert the List<Map<String, dynamic> into a List.
    return List.generate(
        maps.length,
        (i) => ProgramaModel(
              id: maps[i]['id_programa'],
              imagen: maps[i]['imagen'],
              nombre: maps[i]['nombre_programa'],
              descripcion: maps[i]['descripcion_programa'],
            ));
  }
}
