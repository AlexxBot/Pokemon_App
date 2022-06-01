import 'package:flutter/foundation.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/sprites.dart';

class PokemonDetail {
  final String name;
  final int? height;
  final int? weight;
  final List<String> abilities;
  final List<String> types;
  Sprites? sprites;
  PokemonDetail(
      {required this.name,
      this.height,
      this.weight,
      this.abilities = const [],
      this.types = const [],
      this.sprites});

  factory PokemonDetail.fromJson(Map<dynamic, dynamic> json) {
    return PokemonDetail(
        name: json['name'].toString(),
        height: int.tryParse(json['height'].toString()),
        weight: int.tryParse(json['weight'].toString()),
        abilities: (json['abilities'] as List)
            .map((ability) =>
                (ability['ability'] as Map<dynamic, dynamic>)['name']
                    .toString())
            .toList(),
        types: (json['types'] as List)
            .map((ability) =>
                (ability['type'] as Map<dynamic, dynamic>)['name'].toString())
            .toList(),
        sprites: Sprites.fromJson(json['sprites']));
  }
}
