import 'package:animales_flutter/exp_chest.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animalRepositoryProvider = Provider<AnimalesRepository>((ref) {
  return AnimalRepositoryImpl(AnimalLocalDatasource());
});
