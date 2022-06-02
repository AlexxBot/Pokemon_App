class Move {
  final String? name;

  const Move({required this.name});

  factory Move.fromJson(Map<dynamic, dynamic> json) {
    final move = (json['move'] as Map<dynamic, dynamic>);
    return Move(name: move['name'].toString());
  }
}
