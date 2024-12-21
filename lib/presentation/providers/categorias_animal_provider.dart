import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animales_flutter/exp_chest.dart';

final categoriasAnimalProvider =
    StateNotifierProvider<CategoriasAnimalNotifier, CategoriasAnimalState>(
        (ref) {
  final animalesRepository = ref.watch(animalRepositoryProvider);
  return CategoriasAnimalNotifier(animalesRepository: animalesRepository);
});

class CategoriasAnimalNotifier extends StateNotifier<CategoriasAnimalState> {
  final AnimalesRepository animalesRepository;
  CategoriasAnimalNotifier({
    required this.animalesRepository,
  }) : super(CategoriasAnimalState()) {
    loadCategoriasAnimal();
  }

  Future<void> loadCategoriasAnimal() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);
    final categoriasAnimal = await animalesRepository.getListCategorias();
    state = state.copyWith(
      isLoading: false,
      categoriasAnimal: [...state.categoriasAnimal, ...categoriasAnimal],
    );
  }
}

class CategoriasAnimalState {
  final bool isLoading;
  final List<CategoriaAnimal> categoriasAnimal;

  CategoriasAnimalState({
    this.isLoading = false,
    this.categoriasAnimal = const [],
  });

  CategoriasAnimalState copyWith({
    bool? isLoading,
    List<CategoriaAnimal>? categoriasAnimal,
  }) =>
      CategoriasAnimalState(
        isLoading: isLoading ?? this.isLoading,
        categoriasAnimal: categoriasAnimal ?? this.categoriasAnimal,
      );
}
