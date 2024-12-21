import 'package:animales_flutter/exp_chest.dart';

class AnimalLocalDatasource extends AnimalesDatasource {
  @override
  Future<List<Animal>> getListAnimales() async {
    return LocalDatasource.instance.getAnimales();
  }

  @override
  Future<List<CategoriaAnimal>> getListCategorias() async {
    return LocalDatasource.instance.getCategoriasAnimal();
  }

  @override
  Future<List<HabitadAnimal>> getListHabitads() async {
    return LocalDatasource.instance.getHabitadsAnimal();
  }

  @override
  Future<List<AlimentacionAnimal>> getListTiposAlimentacion() async {
    return LocalDatasource.instance.getAlimentacionAnimal();
  }

  @override
  Future<Animal> createAnimal(Map<String, dynamic> animalLike) async {
    // si se tuviese que mantener la info, se guarda aqui en un sharePreference.
    return Animal(
      idAnimal: animalLike['idAnimal'],
      nombre: animalLike['nombre'],
      tamano: animalLike['tamano'],
      caracteristicas: animalLike['caracteristicas'],
      categoria: animalLike['categoria'],
      alimentacion: animalLike['alimentacion'],
      habitad: animalLike['habitad'],
      urlImg: animalLike['urlImg'],
    );
  }
}
