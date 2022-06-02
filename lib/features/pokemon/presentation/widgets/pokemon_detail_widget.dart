import 'package:flutter/material.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/core/widgets/tab_header_widget.dart';
import 'package:pokemon_app/core/widgets/text_pair_widget.dart';
import 'package:pokemon_app/core/widgets/text_widget.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_detail.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/types.dart';
import 'package:pokemon_app/features/pokemon/presentation/widgets/Detail/about_widget.dart';
import 'package:pokemon_app/features/pokemon/presentation/widgets/Detail/forms_widget.dart';
import 'package:pokemon_app/features/pokemon/presentation/widgets/Detail/moves_widget.dart';
import 'package:pokemon_app/features/pokemon/presentation/widgets/Detail/stats_widget.dart';

class PokemonDetailWidget extends StatefulWidget {
  final PokemonDetail detail;
  const PokemonDetailWidget({Key? key, required this.detail}) : super(key: key);

  @override
  State<PokemonDetailWidget> createState() => _PokemonDetailWidgetState();
}

class _PokemonDetailWidgetState extends State<PokemonDetailWidget>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final double realHeigth;
  late final double realWeigth;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    realHeigth = (widget.detail.height ?? 1) / 10.0;
    realWeigth = (widget.detail.weight ?? 1) / 10.0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadiusTabBar),
                  topRight: Radius.circular(borderRadiusTabBar))),
          padding: const EdgeInsets.symmetric(
              vertical: vspaceL, horizontal: hspaceL),
          child: TabBar(
              //isScrollable: true,
              controller: _tabController,
              unselectedLabelColor: Theme.of(context).primaryColor,
              indicatorWeight: 3.0,
              indicatorColor: Theme.of(context).primaryColor,
              labelColor: Theme.of(context).primaryColor,
              tabs: [
                TabHeaderWidget(
                    title: 'About', color: Theme.of(context).primaryColor),
                TabHeaderWidget(
                    title: 'Stats', color: Theme.of(context).primaryColor),
                TabHeaderWidget(
                    title: 'Forms', color: Theme.of(context).primaryColor),
                TabHeaderWidget(
                    title: 'Moves', color: Theme.of(context).primaryColor)
              ]),
        ),
        Expanded(
          child: TabBarView(
            children: [
              AboutWidget(detail: widget.detail),
              StatsWidget(
                  stats: widget.detail.stats!,
                  color: TypesColors.getColor(
                    widget.detail.types[0],
                  )),
              FormsWidget(sprites: widget.detail.sprites!),
              MovesWidget(
                  moves: widget.detail.moves!,
                  color: TypesColors.getColor(
                    widget.detail.types[0],
                  ))
            ],
            controller: _tabController,
          ),
        ),
      ],
    );
  }
}
