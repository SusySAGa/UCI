import 'dart:io';

import 'package:FaunaRojaCu/models/especie.dart';
import 'package:FaunaRojaCu/models/programa.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';

class DbHelper {
  //static Future<Database> _openDB() async {
  //  return openDatabase(rootBundle.load(join('assets', 'dictionary')));
  //}

  static Future<Database> openDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'espPeligro.db');
    ByteData data = await rootBundle.load(join('assets/db', 'espPeligro.db'));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Save copied asset to documents
    await new File(path).writeAsBytes(bytes);
    var theDb = await openDatabase(path, version: 4, onUpgrade: _onUpgrade);
    return theDb;
  }

  static void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    var batch = db.batch();
    if (oldVersion < newVersion) {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, "espPeligro.db");
      ByteData data = await rootBundle.load(join('assets/db', 'espPeligro.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Save copied asset to documents
      await new File(path).writeAsBytes(bytes);
    }
    await batch.commit();
  }

  static Future<List<EspecieModel>> especies() async {
    Database db = await openDB();
    final List<Map<String, dynamic>> maps = await db.query('especies');
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

  static Future<List<EspecieModel>> especiesFav() async {
    Database db = await openDB();
    final List<Map<String, dynamic>> maps =
        await db.query('especies', where: 'favorito = 1');
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

  static Future<List<ProgramaModel>> programas() async {
    Database db = await openDB();
    final List<Map<String, dynamic>> maps = await db.query('programa');
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
