import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/app.dart';
import 'package:pokemon_app/core/global/theme_provider.dart';
import 'package:pokemon_app/features/pokemon/presentation/bloc/pokemon_bloc.dart';
import 'package:provider/provider.dart';
import './injections.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<PokemonBloc>(create: (_) => di.sl<PokemonBloc>())
        ],
        child: ChangeNotifierProvider<ThemeProvider>(
            create: (_) => ThemeProvider(), child: const PokemonApp()));
  }
}
