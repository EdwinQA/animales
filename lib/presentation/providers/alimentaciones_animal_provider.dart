import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animales_flutter/exp_chest.dart';

final alimentacionesAnimalProvider =
    StateNotifierProvider<AlimenentacionesAnimalNotifier, AlimentacionesAnimalState>(
        (ref) {
  final animalesRepository = ref.watch(animalRepositoryProvider);
  return AlimenentacionesAnimalNotifier(alimentacionesAnimalRepository: animalesRepository);
});

class AlimenentacionesAnimalNotifier extends StateNotifier<AlimentacionesAnimalState> {
  final AnimalesRepository alimentacionesAnimalRepository;
  AlimenentacionesAnimalNotifier({
    required this.alimentacionesAnimalRepository,
  }) : super(AlimentacionesAnimalState()) {
    loadAlimentacionesAnimal();
  }

  Future<void> loadAlimentacionesAnimal() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);
    final alimentacionesAnimal = await alimentacionesAnimalRepository.getListTiposAlimentacion();
    state = state.copyWith(
      isLoading: false,
      alimentacionesAnimal: [...state.alimentacionesAnimal, ...alimentacionesAnimal],
    );
  }
}

class AlimentacionesAnimalState {
  final bool isLoading;
  final List<AlimentacionAnimal> alimentacionesAnimal;

  AlimentacionesAnimalState({
    this.isLoading = false,
    this.alimentacionesAnimal = const [],
  });

  AlimentacionesAnimalState copyWith({
    bool? isLoading,
    List<AlimentacionAnimal>? alimentacionesAnimal,
  }) =>
      AlimentacionesAnimalState(
        isLoading: isLoading ?? this.isLoading,
        alimentacionesAnimal: alimentacionesAnimal ?? this.alimentacionesAnimal,
      );
}
