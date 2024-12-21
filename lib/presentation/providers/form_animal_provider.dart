import 'package:animales_flutter/exp_chest.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

final animalFormProvider =
    StateNotifierProvider.autoDispose<AnimalFormNotifier, AnimalFormState>(
        (ref) {
  final createCallBack = ref.watch(animalesProvider.notifier).createAnimal;

  return AnimalFormNotifier(onSubmitCallback: createCallBack);
});

class AnimalFormNotifier extends StateNotifier<AnimalFormState> {
  final Future<bool> Function(Map<String, dynamic> animalLike)?
      onSubmitCallback;

  AnimalFormNotifier({
    this.onSubmitCallback,
  }) : super(AnimalFormState());

  Future<bool> onFormSubmit() async {
    if (!state.isFormValid ||
        state.alimentacion == null ||
        state.categoria == null ||
        state.habitad == null ||
        onSubmitCallback == null) return false;
    final animalLike = {
      'idAnimal': state.idAnimal,
      'nombre': state.nombre.value,
      'tamano': state.tamano.value,
      'categoria': state.categoria,
      'alimentacion': state.alimentacion,
      'habitad': state.habitad,
      'caracteristicas': state.caracteristicas,
      'urlImg': state.urlImg,
    };

    try {
      return await onSubmitCallback!(animalLike);
    } catch (e) {
      return false;
    }
  }

  void onNombreChanged(String value) {
    state = state.copyWith(
        nombre: Nombre.dirty(value),
        isFormValid: Formz.validate([
          Nombre.dirty(state.nombre.value),
          Tamano.dirty(state.tamano.value),
        ]));
  }

  void onTamanoChanged(String value) async {
    state = state.copyWith(
        tamano: Tamano.dirty(double.tryParse(value) ?? 0.0),
        isFormValid: Formz.validate([
          Nombre.dirty(state.nombre.value),
          Tamano.dirty(double.tryParse(value) ?? 0.0)
        ]));
  }

  void onCaracteristicasChanged(String caracteristicas) {
    state = state.copyWith(caracteristicas: caracteristicas);
  }

  void onCategoriaChanged(CategoriaAnimal categoriaAnimal) {
    state = state.copyWith(categoria: categoriaAnimal);
  }

  void onAlimentacionChanged(AlimentacionAnimal alimentacionAnimal) {
    state = state.copyWith(alimentacion: alimentacionAnimal);
  }

  void onHabitadChanged(HabitadAnimal habitadAnimal) {
    state = state.copyWith(habitad: habitadAnimal);
  }

  void onIdAnimalChanged(int idAnimal) {
    state = state.copyWith(idAnimal: idAnimal);
  }
}

class AnimalFormState {
  final bool isFormValid;
  final int? idAnimal;
  final Nombre nombre;
  final Tamano tamano;
  final CategoriaAnimal? categoria;
  final AlimentacionAnimal? alimentacion;
  final HabitadAnimal? habitad;
  final String caracteristicas;
  final String urlImg;

  AnimalFormState({
    this.isFormValid = false,
    this.idAnimal = 0,
    this.nombre = const Nombre.dirty(''),
    this.tamano = const Tamano.dirty(0),
    this.categoria,
    this.alimentacion,
    this.habitad,
    this.caracteristicas = '',
    this.urlImg = '',
  });

  AnimalFormState copyWith({
    bool? isFormValid,
    int? idAnimal,
    Nombre? nombre,
    Tamano? tamano,
    CategoriaAnimal? categoria,
    AlimentacionAnimal? alimentacion,
    HabitadAnimal? habitad,
    String? caracteristicas,
    String? urlImg,
  }) =>
      AnimalFormState(
        isFormValid: isFormValid ?? this.isFormValid,
        idAnimal: idAnimal ?? this.idAnimal,
        nombre: nombre ?? this.nombre,
        tamano: tamano ?? this.tamano,
        categoria: categoria ?? this.categoria,
        alimentacion: alimentacion ?? this.alimentacion,
        habitad: habitad ?? this.habitad,
        caracteristicas: caracteristicas ?? this.caracteristicas,
        urlImg: urlImg ?? this.urlImg,
      );
}
