import 'package:pokemon_app/features/pokemon/domain/entities/pokemon.dart';

class Pokemons {
  final int count;
  final String? next;
  final String? previous;
  List<Pokemon> list;

  Pokemons({required this.count, this.next, this.previous, required this.list});

  factory Pokemons.fromJson(Map<dynamic, dynamic> json) {
    return Pokemons(
        count: int.parse(json['count'].toString()),
        next: json['next'],
        previous: json['previous'],
        list: (json['results'] as List)
            .map<Pokemon>((pokemon) => Pokemon.fromJson(pokemon))
            .toList());
  }
}
