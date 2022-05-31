import 'package:flutter/material.dart';

import 'features/pokemon/presentation/pages/pokemon_detail_page.dart';
import 'features/pokemon/presentation/pages/pokemon_list_page.dart';

class RouteGenerator {
  static const String pokemonListPage = '/';
  static const String pokemonDetailPage = 'detail';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case pokemonListPage:
        return MaterialPageRoute(builder: (_) => const PokemonListPage());
      case pokemonDetailPage:
        return MaterialPageRoute(builder: (_) => const PokemonDetailPage());
      default:
        return MaterialPageRoute(builder: (_) => const PokemonListPage());
    }
  }
}
