import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:animales_flutter/exp_chest.dart';

final habitadsAnimalProvider =
    StateNotifierProvider<HabitadsAnimalesNotifier, HabitadsAnimalesState>((ref) {
  final animalesRepository = ref.watch(animalRepositoryProvider);
  return HabitadsAnimalesNotifier(animalesRepository: animalesRepository);
});

class HabitadsAnimalesNotifier extends StateNotifier<HabitadsAnimalesState> {
  final AnimalesRepository animalesRepository;
  HabitadsAnimalesNotifier({
    required this.animalesRepository,
  }) : super(HabitadsAnimalesState()) {
    loadHabitadsAnimales();
  }

  Future<void> loadHabitadsAnimales() async {
    if (state.isLoading) return;
    state = state.copyWith(isLoading: true);
    final habitadsAnimales = await animalesRepository.getListHabitads();
    state = state.copyWith(
      isLoading: false,
      habitadsAnimales: [...state.habitadsAnimales, ...habitadsAnimales],
    );
  }
}

class HabitadsAnimalesState {
  final bool isLoading;
  final List<HabitadAnimal> habitadsAnimales;

  HabitadsAnimalesState({
    this.isLoading = false,
    this.habitadsAnimales = const [],
  });

  HabitadsAnimalesState copyWith({
    bool? isLoading,
    List<HabitadAnimal>? habitadsAnimales,
  }) =>
      HabitadsAnimalesState(
        isLoading: isLoading ?? this.isLoading,
        habitadsAnimales: habitadsAnimales ?? this.habitadsAnimales,
      );
}
