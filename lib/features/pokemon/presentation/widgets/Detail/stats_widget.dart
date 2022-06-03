import 'package:flutter/material.dart';
import 'package:pokemon_app/core/global/size_constants.dart';
import 'package:pokemon_app/core/widgets/stat_widget.dart';
import 'package:pokemon_app/features/pokemon/domain/entities/stat.dart';

class StatsWidget extends StatelessWidget {
  final Color? color;
  final List<Stat> stats;
  const StatsWidget({Key? key, required this.stats, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: vspaceL, left: hspaceXXL),
      color: Colors.white,
      child: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: stats.map<StatWidget>((stat) {
          final doubleValue = stat.baseStat! * 1.0;
          return StatWidget(
              name: stat.nameStat, value: doubleValue, color: color);
        }).toList(),
      ),
    );
  }
}
