import 'package:flutter/foundation.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/move.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/sprites.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/stat.dart';

class PokemonDetail {
  final String name;
  final int? height;
  final int? weight;
  final int? baseExperience;
  final String? specie;
  final List<String> abilities;
  final List<String> types;
  final List<Move>? moves;
  final List<Stat>? stats;
  final Sprites? sprites;
  PokemonDetail(
      {required this.name,
      this.height,
      this.weight,
      this.baseExperience,
      this.specie,
      this.abilities = const [],
      this.types = const [],
      this.moves,
      this.stats,
      this.sprites});

  factory PokemonDetail.fromJson(Map<dynamic, dynamic> json) {
    return PokemonDetail(
        name: json['name'].toString(),
        height: int.tryParse(json['height'].toString()),
        weight: int.tryParse(json['weight'].toString()),
        baseExperience: int.tryParse(json['base_experience'].toString()),
        specie: (json['species'] as Map<dynamic, dynamic>)['name'].toString(),
        abilities: (json['abilities'] as List)
            .map((ability) =>
                (ability['ability'] as Map<dynamic, dynamic>)['name']
                    .toString())
            .toList(),
        types: (json['types'] as List)
            .map((ability) =>
                (ability['type'] as Map<dynamic, dynamic>)['name'].toString())
            .toList(),
        moves: (json['moves'] as List)
            .map<Move>((move) => Move.fromJson(move))
            .toList(),
        stats: (json['stats'] as List)
            .map<Stat>((stat) => Stat.fromJson(stat))
            .toList(),
        sprites: Sprites.fromJson(json['sprites']));
  }
}
