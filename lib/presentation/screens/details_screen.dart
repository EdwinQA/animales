import 'package:animales_flutter/exp_chest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsScreen extends StatelessWidget {
  static const name = 'details-screen';
  final String animalId;
  const DetailsScreen({super.key, required this.animalId});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final Animal animal = ref
            .watch(animalesProvider)
            .animales
            .firstWhere((a) => a.idAnimal.toString() == animalId);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              animal.nombre,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColorDark,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: _AnimalView(animal: animal),
        );
      },
    );
  }
}

class _AnimalView extends StatelessWidget {
  final Animal animal;
  const _AnimalView({required this.animal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CustomAnimalImagen(urlImg: animal.urlImg),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                CustomRichTextWidget(
                  label: 'Categoria: ',
                  message: animal.categoria.categoria,
                ),
                const SizedBox(height: 20),
                CustomRichTextWidget(
                  label: 'Tamaño: ',
                  message: animal.tamano.toString(),
                ),
                const SizedBox(height: 20),
                CustomRichTextWidget(
                  label: 'Alimentacion: ',
                  message: animal.alimentacion.alimentacion,
                ),
                const SizedBox(height: 20),
                CustomRichTextWidget(
                  label: 'Habitad: ',
                  message: animal.habitad.habitad,
                ),
                const SizedBox(height: 20),
                CustomRichTextWidget(
                  label: 'Caracteristicas: ',
                  message: '${animal.caracteristicas} ',
                ),
                const SizedBox(height: 20),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
