import 'package:animales_flutter/exp_chest.dart';

class LocalDatasource {
  static final LocalDatasource _instance = LocalDatasource._internal();

  LocalDatasource._internal();

  static LocalDatasource get instance => _instance;

  List<Animal> getAnimales() {
    return [
      Animal(
        idAnimal: 1,
        tamano: 2.5,
        nombre: "León",
        urlImg:
            "https://www.ngenespanol.com/wp-content/uploads/2023/08/dia-mundial-del-leon-curiosidades-sobre-el-rey-de-la-sabana.jpg",
        categoria: getCategoriasAnimal()[0],
        habitad: getHabitadsAnimal()[0],
        alimentacion: getAlimentacionAnimal()[0],
        caracteristicas:
            "Gran melena en los machos, fuerte sentido de territorialidad, vive en manadas.",
      ),
      Animal(
        idAnimal: 2,
        tamano: 4.0,
        nombre: "Elefante",
        urlImg:
            "https://cdn0.bioenciclopedia.com/es/posts/9/2/0/elefante_29_600.jpg",
        categoria: getCategoriasAnimal()[0],
        habitad: getHabitadsAnimal()[0],
        alimentacion: getAlimentacionAnimal()[1],
        caracteristicas:
            "Orejas grandes para disipar calor, trompa multifuncional, forma manadas matriarcales.",
      ),
      Animal(
        idAnimal: 3,
        tamano: 4.0,
        nombre: "Águila",
        urlImg:
            "https://content.nationalgeographic.com.es/medio/2024/06/18/planeo-de-un-aguila-calva_7b6b9957_240618121151_1280x854.jpg",
        categoria: getCategoriasAnimal()[1],
        habitad: getHabitadsAnimal()[2],
        alimentacion: getAlimentacionAnimal()[2],
        caracteristicas:
            "Excelente visión, poderosa cazadora, símbolo de poder y libertad.",
      )
    ];
  }

  List<CategoriaAnimal> getCategoriasAnimal() {
    return [
      CategoriaAnimal(idCategoria: 0, categoria: 'Mamífero'),
      CategoriaAnimal(idCategoria: 1, categoria: 'Ave'),
      CategoriaAnimal(idCategoria: 2, categoria: 'Pez'),
    ];
  }

  List<AlimentacionAnimal> getAlimentacionAnimal() {
    return [
      AlimentacionAnimal(idAlimentacion: 0, alimentacion: 'Carnívoro'),
      AlimentacionAnimal(idAlimentacion: 1, alimentacion: 'Herbívoro'),
      AlimentacionAnimal(
          idAlimentacion: 2, alimentacion: 'Carnívoro (aves y roedores)'),
      AlimentacionAnimal(
          idAlimentacion: 3, alimentacion: 'Carnívoro (peces, krill)'),
      AlimentacionAnimal(idAlimentacion: 4, alimentacion: 'Carnívoro (peces)'),
      AlimentacionAnimal(
          idAlimentacion: 5, alimentacion: 'Carnívoro (peces, focas)'),
    ];
  }

  List<HabitadAnimal> getHabitadsAnimal() {
    return [
      HabitadAnimal(idHabitad: 0, habitad: 'Sabana'),
      HabitadAnimal(idHabitad: 1, habitad: 'Bosques'),
      HabitadAnimal(idHabitad: 2, habitad: 'Montañas'),
      HabitadAnimal(idHabitad: 3, habitad: 'Ártico'),
      HabitadAnimal(idHabitad: 4, habitad: 'Antártida'),
      HabitadAnimal(idHabitad: 5, habitad: 'Australia'),
      HabitadAnimal(idHabitad: 6, habitad: 'Océano'),
    ];
  }
}
