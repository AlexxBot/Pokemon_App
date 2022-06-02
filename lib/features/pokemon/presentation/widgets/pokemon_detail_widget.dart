import 'package:flutter/material.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/core/widgets/tab_header_widget.dart';
import 'package:pokemon_app/core/widgets/text_pair_widget.dart';
import 'package:pokemon_app/core/widgets/text_widget.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/pokemon_detail.dart';
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
              unselectedLabelColor: Colors.black,
              indicatorWeight: 3.0,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              tabs: const [
                TabHeaderWidget(title: 'About'),
                TabHeaderWidget(title: 'Stats'),
                TabHeaderWidget(title: 'Forms'),
                TabHeaderWidget(title: 'Moves')
              ]),
        ),
        Expanded(
          child: TabBarView(
            children: [
              AboutWidget(detail: widget.detail),
              StatsWidget(stats: widget.detail.stats!),
              FormsWidget(sprites: widget.detail.sprites!),
              MovesWidget(moves: widget.detail.moves!)
            ],
            controller: _tabController,
          ),
        ),
      ],
    );
  }
}
