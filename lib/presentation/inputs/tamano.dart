import 'package:formz/formz.dart';

enum TamanoError { empty, value }

class Tamano extends FormzInput<double, TamanoError> {
  const Tamano.pure() : super.pure(0.0);

  const Tamano.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (displayError == TamanoError.empty) return 'El campo es requerido';
    if (displayError == TamanoError.value) {
      return 'Tiene que ser un número mayor a 0';
    }

    return null;
  }

  @override
  TamanoError? validator(double value) {
    if (value <= 0.0) return TamanoError.empty;

    return null;
  }
}
