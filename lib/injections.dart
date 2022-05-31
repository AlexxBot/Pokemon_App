import 'package:get_it/get_it.dart';

import 'features/pokemon/presentation/bloc/pokemon_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => PokemonBloc());
}
