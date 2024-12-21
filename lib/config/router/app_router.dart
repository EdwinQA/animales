import 'package:go_router/go_router.dart';
import 'package:animales_flutter/exp_chest.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/details-screen/:id',
    name: DetailsScreen.name,
    builder: (context, state) {
      final animalId = state.pathParameters['id'] ?? 'no-id';
      return DetailsScreen(animalId: animalId);
    },
  ),
  GoRoute(
    path: '/form-screen',
    name: FormScreen.name,
    builder: (context, state) => const FormScreen(),
  )
]);
