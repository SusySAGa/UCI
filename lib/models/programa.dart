import 'dart:convert';

class ProgramaModel {
  final int? id;
  final String nombre;
  final String descripcion;
  final String? imagen;

  ProgramaModel({
    this.id,
    required this.nombre,
    required this.descripcion,
    this.imagen,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_programa': id,
      'nombre_programa': nombre,
      'descripcion_programa': descripcion,
      'imagen': imagen,
    };
  }

  factory ProgramaModel.fromMap(Map<String, dynamic> map) {
    return ProgramaModel(
      id: map['id_programa']?.toInt() ?? 0,
      nombre: map['nombre_programa'] ?? '',
      descripcion: map['descripcion_programa'] ?? '',
      imagen: map['imagen'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProgramaModel.fromJson(String source) =>
      ProgramaModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProgramaModel(id_programa: $id, nombre_programa: $nombre, descripcion_programa: $descripcion, imagen: $imagen)';
  }
}
