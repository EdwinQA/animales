import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animales_flutter/exp_chest.dart';

final animalesProvider =
    StateNotifierProvider<AnimalesNotifier, AnimalesState>((ref) {
  final animalesRepository = ref.watch(animalRepositoryProvider);
  return AnimalesNotifier(animalesRepository: animalesRepository);
});

class AnimalesNotifier extends StateNotifier<AnimalesState> {
  final AnimalesRepository animalesRepository;
  AnimalesNotifier({
    required this.animalesRepository,
  }) : super(AnimalesState()) {
    loadAnimales();
  }

  Future<bool> createAnimal(Map<String, dynamic> animalLike) async {
    try {
      state = state.copyWith(isLoading: true);
      Animal animal = await animalesRepository.createAnimal(animalLike);
      state = state.copyWith(
        isLoading: false,
        animales: [...state.animales, animal],
      );
      return true;
    } on Exception {
      return false;
    }
  }

  Future<void> loadAnimales() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);
    final animales = await animalesRepository.getListAnimales();
    state = state.copyWith(
      isLoading: false,
      animales: [...state.animales, ...animales],
    );
  }
}

class AnimalesState {
  final bool isLoading;
  final List<Animal> animales;

  AnimalesState({
    this.isLoading = false,
    this.animales = const [],
  });

  AnimalesState copyWith({
    bool? isLoading,
    List<Animal>? animales,
  }) =>
      AnimalesState(
        isLoading: isLoading ?? this.isLoading,
        animales: animales ?? this.animales,
      );
}
