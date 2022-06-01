class Pokemon {
  final String name;
  final String url;

  Pokemon({required this.name, required this.url});

  factory Pokemon.fromJson(Map<dynamic, dynamic> json) {
    return Pokemon(name: json['name'].toString(), url: json['url']);
  }
}
