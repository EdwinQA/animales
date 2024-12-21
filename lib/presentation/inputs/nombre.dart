import 'package:formz/formz.dart';

enum NombreError { empty }

class Nombre extends FormzInput<String, NombreError> {
  const Nombre.pure() : super.pure('');

  const Nombre.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == NombreError.empty) return 'El campo es requerido';

    return null;
  }

  @override
  NombreError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return NombreError.empty;

    return null;
  }
}
