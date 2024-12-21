import 'package:animales_flutter/exp_chest.dart';

abstract class AnimalesRepository {
  Future<List<Animal>> getListAnimales();
  Future<List<CategoriaAnimal>> getListCategorias();
  Future<List<HabitadAnimal>> getListHabitads();
  Future<List<AlimentacionAnimal>> getListTiposAlimentacion();
  Future<Animal> createAnimal( Map<String,dynamic> animalLike);
}
