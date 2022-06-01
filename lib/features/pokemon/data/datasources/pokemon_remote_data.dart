import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_app/core/error/exceptions.dart';
import 'package:pokemon_app/core/network/headers.dart';
import 'package:pokemon_app/core/network/network_info.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_detail.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_form.dart';
import 'package:pokemon_app/injections.dart';

abstract class PokemonRemoteData {
  Future<List<Pokemon>> getList();
  Future<PokemonDetail> getPokemon(String url);
  Future<PokemonForm> getPokemonForm(String url);
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
      final List<Pokemon> list = listPokemons
          .map<Pokemon>((pokemon) => Pokemon.fromJson(pokemon))
          .toList();
      final n = list.length;
      for (int i = 0; i < n; i++) {
        final detailResponse = await client
            .get(
              Uri.parse(list[i].url),
              headers: sl<Headers>().headers,
            )
            .timeout(Duration(seconds: sl<NetworkInfo>().timeOut),
                onTimeout: () => throw TimeOutException());
        if (detailResponse.statusCode == 200) {
          final pokemonJson = jsonDecode(detailResponse.body);
          final pokemonDetail = PokemonDetail.fromJson(pokemonJson);
          list[i].detail = pokemonDetail;
        }
      }
      return list;
    } else {
      throw ApiResponseException(statusCode: response.statusCode);
    }
  }

  @override
  Future<PokemonDetail> getPokemon(String url) async {
    final uri = Uri.parse(url);
    final response = await client
        .get(uri, headers: sl<Headers>().headers)
        .timeout(Duration(seconds: sl<NetworkInfo>().timeOut),
            onTimeout: () => throw TimeOutException());
    if (response.statusCode == 200) {
      final pokemonJson = jsonDecode(response.body);

      final pokemon = PokemonDetail.fromJson(pokemonJson);
      return pokemon;
    } else {
      throw ApiResponseException(statusCode: response.statusCode);
    }
  }

  @override
  Future<PokemonForm> getPokemonForm(String url) async {
    final uri = Uri.parse(url);
    final response = await client
        .get(uri, headers: sl<Headers>().headers)
        .timeout(Duration(seconds: sl<NetworkInfo>().timeOut),
            onTimeout: () => throw TimeOutException());
    if (response.statusCode == 200) {
      final pokemonJson = jsonDecode(response.body);
      final pokemon = PokemonForm.fromJson(pokemonJson);
      return pokemon;
    } else {
      throw ApiResponseException(statusCode: response.statusCode);
    }
  }
}
