import 'package:animales_flutter/exp_chest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormScreen extends ConsumerWidget {
  static const name = 'form-screen';
  const FormScreen({super.key});

  void showSnackbar(BuildContext context, String mensaje) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(mensaje)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agregar Animal',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Theme.of(context).primaryColorDark,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ref.read(animalFormProvider.notifier).onIdAnimalChanged(
              ref.watch(animalesProvider).animales.length + 1);
          await ref
              .read(animalFormProvider.notifier)
              .onFormSubmit()
              .then((value) {
            if (!value) {
              // ignore: use_build_context_synchronously
              showSnackbar(context, 'Llena todos los campos');
              return;
            }
            // ignore: use_build_context_synchronously
            showSnackbar(context, 'Animal Agregado');
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          });
        },
        child: const Icon(Icons.save_as_outlined),
      ),
      body: const _AnimalInformation(),
    );
  }
}

class _AnimalInformation extends ConsumerStatefulWidget {
  const _AnimalInformation();

  @override
  _AnimalInformationState createState() => _AnimalInformationState();
}

class _AnimalInformationState extends ConsumerState {
  @override
  Widget build(BuildContext context) {
    final animalFormState = ref.watch(animalFormProvider);
    final categoriasAnimalState = ref.watch(categoriasAnimalProvider);
    final alimentacionesAnimalState = ref.watch(alimentacionesAnimalProvider);
    final habitadsAnimalState = ref.watch(habitadsAnimalProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CustomAnimalField(
                    isTopField: true,
                    label: 'Nombre',
                    initialValue: animalFormState.nombre.value,
                    errorMessage: animalFormState.nombre.errorMessage,
                    onChanged:
                        ref.read(animalFormProvider.notifier).onNombreChanged,
                  ),
                  const SizedBox(height: 20),
                  CustomAnimalField(
                      isTopField: true,
                      label: 'Tamano',
                      initialValue: '${animalFormState.tamano.value}',
                      errorMessage: animalFormState.tamano.errorMessage,
                      keyboardType: TextInputType.number,
                      onChanged: ref
                          .read(animalFormProvider.notifier)
                          .onTamanoChanged),
                  const SizedBox(height: 20),
                  CustomAnimalField(
                    isTopField: true,
                    label: 'Caracteristicas',
                    initialValue: animalFormState.caracteristicas,
                    onChanged: ref
                        .read(animalFormProvider.notifier)
                        .onCaracteristicasChanged,
                  ),
                  const SizedBox(height: 20),
                  CustomDropdown(
                    listaElementos: categoriasAnimalState.categoriasAnimal,
                    apunta: 1,
                  ),
                  const SizedBox(height: 20),
                  CustomDropdown(
                    listaElementos:
                        alimentacionesAnimalState.alimentacionesAnimal,
                    apunta: 2,
                  ),
                  const SizedBox(height: 20),
                  CustomDropdown(
                    listaElementos: habitadsAnimalState.habitadsAnimales,
                    apunta: 3,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
