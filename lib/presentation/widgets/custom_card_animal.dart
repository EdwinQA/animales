import 'package:animales_flutter/exp_chest.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomCardAnimalWidget extends StatelessWidget {
  final Animal animal;
  const CustomCardAnimalWidget({
    super.key,
    required this.animal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () => context.push('/${DetailsScreen.name}/${animal.idAnimal}'),
        child: Card(
          color: Theme.of(context).scaffoldBackgroundColor,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  animal.nombre,
                  style: const TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 5),
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CustomAnimalImagen(urlImg: animal.urlImg)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
