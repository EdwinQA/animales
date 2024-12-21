import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:animales_flutter/exp_chest.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final animalService = Provider.of<AnimalServices>(context);

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Animales',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          backgroundColor: Theme.of(context).primaryColorDark),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Agregar animal'),
        icon: const Icon(Icons.add),
        onPressed: () => context.push('/${FormScreen.name}'),
      ),
      body: const _AnimalesView(),
    );
  }
}

class _AnimalesView extends ConsumerStatefulWidget {
  const _AnimalesView();

  @override
  _AnimalesViewState createState() => _AnimalesViewState();
}

class _AnimalesViewState extends ConsumerState {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    ref.read(animalesProvider.notifier).loadAnimales();
    ref.read(categoriasAnimalProvider.notifier).loadCategoriasAnimal();
    ref.read(alimentacionesAnimalProvider.notifier).loadAlimentacionesAnimal();
    ref.read(habitadsAnimalProvider.notifier).loadHabitadsAnimales();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animalesState = ref.watch(animalesProvider);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: animalesState.animales.length,
            itemBuilder: (context, index) {
              final animal = animalesState.animales[index];
              return FadeInRight(child: CustomCardAnimalWidget(animal: animal));
            },
          ),
        ),
      ],
    );
  }
}
