import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/router.dart';

import 'core/global/theme_provider.dart';

class PokemonApp extends StatelessWidget {
  const PokemonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon App',
      /* theme: ThemeData(
        primarySwatch: Colors.blue,
      ), */
      theme: context.watch<ThemeProvider>().getTheme(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
