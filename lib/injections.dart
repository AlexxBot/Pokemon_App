import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as client;
import 'package:pokemon_app/features/pokemon/data/datasources/pokemon_remote_data.dart';
import 'package:pokemon_app/features/pokemon/data/repository/pokemon_repository_imple.dart';
import 'package:pokemon_app/features/pokemon/domain/repository/pokemon_repository.dart';

import 'core/network/headers.dart';
import 'core/network/network_info.dart';
import 'features/pokemon/domain/usecases/pokemon_use_case.dart';
import 'features/pokemon/presentation/bloc/pokemon_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => PokemonBloc(pokemonUseCase: sl()));

  sl.registerLazySingleton(() => PokemonUseCase(repository: sl()));

  sl.registerLazySingleton<PokemonRepository>(
      () => PokemonRepositoryImple(remoteData: sl(), networkInfo: sl()));

  sl.registerLazySingleton<PokemonRemoteData>(
      () => PokemonRemoteDataImple(client: sl()));

  sl.registerLazySingleton(() => Headers());

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(sl(), 'https://pokeapi.co/api/v2/pokemon'));

  sl.registerLazySingleton(() => client.Client());
  sl.registerLazySingleton(() => Connectivity());
}
