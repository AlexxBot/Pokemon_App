import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_detail.dart';

class Pokemon {
  final String name;
  final String url;
  PokemonDetail? detail;

  Pokemon({required this.name, required this.url, this.detail});

  factory Pokemon.fromJson(Map<dynamic, dynamic> json) {
    return Pokemon(name: json['name'].toString(), url: json['url']);
  }
}
