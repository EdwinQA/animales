import 'package:animales_flutter/exp_chest.dart';

class AnimalRepositoryImpl extends AnimalesRepository {
  final AnimalesDatasource datasource;

  AnimalRepositoryImpl(this.datasource);

  @override
  Future<List<Animal>> getListAnimales() {
    return datasource.getListAnimales();
  }

  @override
  Future<List<CategoriaAnimal>> getListCategorias() {
    return datasource.getListCategorias();
  }

  @override
  Future<List<HabitadAnimal>> getListHabitads() {
    return datasource.getListHabitads();
  }

  @override
  Future<List<AlimentacionAnimal>> getListTiposAlimentacion() {
    return datasource.getListTiposAlimentacion();
  }

  @override
    Future<Animal> createAnimal( Map<String,dynamic> animalLike){
    return datasource.createAnimal(animalLike);
  }
}
