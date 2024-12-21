import 'package:animales_flutter/domain/entities/alimentacion_animal.dart';
import 'package:animales_flutter/domain/entities/categoria_animal.dart';
import 'package:animales_flutter/domain/entities/habitad_animal.dart';

class Animal {
  final int idAnimal;
  final double tamano;
  final String nombre, caracteristicas, urlImg;
  final CategoriaAnimal categoria;
  final AlimentacionAnimal alimentacion;
  final HabitadAnimal habitad;

  Animal(
      {required this.idAnimal,
      required this.tamano,
      required this.nombre,
      required this.categoria,
      required this.urlImg,
      required this.habitad,
      required this.alimentacion,
      required this.caracteristicas});
}
