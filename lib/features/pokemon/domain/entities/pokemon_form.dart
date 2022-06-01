import 'package:pokemon_app/features/pokemon/domain/entities/sprites.dart';

class PokemonForm {
  final String name;
  final Sprites sprites;
  PokemonForm({required this.name, required this.sprites});

  factory PokemonForm.fromJson(Map<dynamic, dynamic> json) {
    return PokemonForm(
        name: json['name'].toString(),
        sprites: Sprites.fromJson(json['sprites']));
  }
}
