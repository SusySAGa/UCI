import 'dart:convert';

class EspecieModel {
  final int? id;
  final String nombre;
  final String nombreCientifico;
  final String descripcion;
  final String estado;
  final String amenaza;
  final String accion;
  final String? imagen;
  final int? favorito;

  EspecieModel({
    this.id,
    required this.nombre,
    required this.nombreCientifico,
    required this.descripcion,
    required this.estado,
    required this.amenaza,
    required this.accion,
    this.imagen,
    this.favorito,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_especie': id,
      'nombre_especie': nombre,
      'nombre_cientifico': nombreCientifico,
      'descripcion_especie': descripcion,
      'estado_conservacion': estado,
      'amenazas': amenaza,
      'acciones_conservacion': accion,
      'imagen_especie': imagen,
      'favorito': favorito,
    };
  }

  factory EspecieModel.fromMap(Map<String, dynamic> map) {
    return EspecieModel(
      id: map['id_especie']?.toInt() ?? 0,
      nombre: map['nombre_especie'] ?? '',
      nombreCientifico: map['nombre_cientifico'] ?? '',
      descripcion: map['descripcion_especie'] ?? '',
      estado: map['estado_conservacion'] ?? '',
      amenaza: map['amenazas'] ?? '',
      accion: map['acciones_conservacion'] ?? '',
      imagen: map['imagen_especie'] ?? '',
      favorito: map['favorito'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EspecieModel.fromJson(String source) =>
      EspecieModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EspecieModel(id_especie: $id, nombre_especie: $nombre, nombre_cientifico: $nombreCientifico, descripcion_programa: $descripcion, estado_conservacion:$estado, amenazas:$amenaza, acciones_conservacion:$accion, imagen: $imagen, favorito: $favorito)';
  }
}
