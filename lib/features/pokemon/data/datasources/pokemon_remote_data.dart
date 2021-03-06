import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon_app/core/error/exceptions.dart';
import 'package:pokemon_app/core/network/headers.dart';
import 'package:pokemon_app/core/network/network_info.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_detail.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_form.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemons.dart';
import 'package:pokemon_app/injections.dart';

abstract class PokemonRemoteData {
  Future<Pokemons> getList(String? url);
  Future<PokemonDetail> getPokemon(String url);
  Future<PokemonForm> getPokemonForm(String url);
}

class PokemonRemoteDataImple extends PokemonRemoteData {
  late final http.Client client;

  PokemonRemoteDataImple({required this.client});

  @override
  Future<Pokemons> getList(String? url) async {
    final uri = Uri.parse(url ?? sl<NetworkInfo>().url);
    final response = await client
        .get(uri, headers: sl<Headers>().headers)
        .timeout(Duration(seconds: sl<NetworkInfo>().timeOut),
            onTimeout: () => throw TimeOutException());
    if (response.statusCode == 200) {
      final pokemonsJson = jsonDecode(response.body);
      //final listPokemons = listJson['results'];
      final pokemons = Pokemons.fromJson(pokemonsJson);
      /*  final List<Pokemon> list = listPokemons
          .map<Pokemon>((pokemon) => Pokemon.fromJson(pokemon))
          .toList(); */
      final n = pokemons.list.length;
      for (int i = 0; i < n; i++) {
        pokemons.list[i].detail = await getPokemon(pokemons.list[i].url);
        /* ReceivePort port = ReceivePort();
        final isolate =
            await Isolate.spawn<String>(getPokemon, pokemons.list[i].url);
        final detail = await port.first;
        isolate.kill(priority: Isolate.immediate);
        pokemons.list[i].detail = detail; */
      }
      return pokemons;
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
    } /* else {
      throw ApiResponseException(statusCode: response.statusCode);
    } */
    return PokemonDetail(name: '');
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
