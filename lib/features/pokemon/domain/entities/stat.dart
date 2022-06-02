class Stat {
  final String nameStat;
  final int? baseStat;

  const Stat({required this.nameStat, required this.baseStat});

  factory Stat.fromJson(Map<dynamic, dynamic> json) {
    final name = (json['stat'] as Map<dynamic, dynamic>)['name'];
    return Stat(
        nameStat: name, baseStat: int.tryParse(json['base_stat'].toString()));
  }
}
