import 'package:animales_flutter/exp_chest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDropdown extends StatefulWidget {
  final List<dynamic> listaElementos;
  final bool isTopField; // La idea es que tenga bordes redondeados arriba
  final bool isBottomField;
  final int apunta;
  const CustomDropdown({
    super.key,
    required this.listaElementos,
    required this.apunta,
    this.isTopField = true,
    this.isBottomField = true,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        const borderRadius = Radius.circular(15);
        final String hint = widget.apunta == 1
            ? 'Seleccione una categoría'
            : widget.apunta == 2
                ? 'Seleccione una alimentacion'
                : 'Seleccione una habitad';
        final animalFormState = ref.watch(animalFormProvider);
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: widget.isTopField ? borderRadius : Radius.zero,
              topRight: widget.isTopField ? borderRadius : Radius.zero,
              bottomLeft: widget.isBottomField ? borderRadius : Radius.zero,
              bottomRight: widget.isBottomField ? borderRadius : Radius.zero,
            ),
            boxShadow: [
              if (widget.isBottomField)
                BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 5,
                    offset: const Offset(0, 3))
            ],
          ),
          child: DropdownButton<dynamic>(
            hint: Text(hint), // Estilo del hint
            value: widget.apunta == 1
                ? animalFormState.categoria
                : widget.apunta == 2
                    ? animalFormState.alimentacion
                    : animalFormState.habitad,
            onChanged: (dynamic newValue) {
              widget.apunta == 1
                  ? ref
                      .read(animalFormProvider.notifier)
                      .onCategoriaChanged(newValue!)
                  : widget.apunta == 2
                      ? ref
                          .read(animalFormProvider.notifier)
                          .onAlimentacionChanged(newValue!)
                      : ref
                          .read(animalFormProvider.notifier)
                          .onHabitadChanged(newValue!);
            },
            items: widget.listaElementos.map<DropdownMenuItem<dynamic>>(
              (dynamic elemento) {
                return DropdownMenuItem<dynamic>(
                  value: elemento,
                  child: Text(
                    widget.apunta == 1
                        ? elemento.categoria
                        : widget.apunta == 2
                            ? elemento.alimentacion
                            : elemento.habitad,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black54), // Estilo de cada item
                  ),
                );
              },
            ).toList(),
            iconEnabledColor: Colors.black, // Color del icono
            iconDisabledColor: Colors.black,
            isExpanded: true,
          ),
        );
      },
    );
  }
}
