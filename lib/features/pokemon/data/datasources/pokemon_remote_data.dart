import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_app/core/error/exceptions.dart';
import 'package:pokemon_app/core/network/headers.dart';
import 'package:pokemon_app/core/network/network_info.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon_app/injections.dart';

abstract class PokemonRemoteData {
  Future<List<Pokemon>> getList();
}

class PokemonRemoteDataImple extends PokemonRemoteData {
  late final http.Client client;

  PokemonRemoteDataImple({required this.client});

  @override
  Future<List<Pokemon>> getList() async {
    final uri = Uri.parse(sl<NetworkInfo>().url);
    final response = await client
        .get(uri, headers: sl<Headers>().headers)
        .timeout(Duration(seconds: sl<NetworkInfo>().timeOut),
            onTimeout: () => throw TimeOutException());
    if (response.statusCode == 200) {
      final listJson = jsonDecode(response.body);
      final listPokemons = listJson['results'];
      final list = listPokemons
          .map<Pokemon>((pokemon) => Pokemon.fromJson(pokemon))
          .toList();
      return list;
    } else {
      throw ApiResponseException(statusCode: response.statusCode);
    }
  }
}
