class Sprites {
  final String? backDefault;
  final String? backFemale;
  final String? backShiny;
  final String? backShinyFemale;
  final String? frontDefault;
  final String? frontFemale;
  final String? frontShiny;
  final String? frontShinyFemale;
  final String? dreamWorld;

  const Sprites(
      {this.backDefault,
      this.backFemale,
      this.backShiny,
      this.backShinyFemale,
      this.frontDefault,
      this.frontFemale,
      this.frontShiny,
      this.frontShinyFemale,
      this.dreamWorld});

  factory Sprites.fromJson(Map<dynamic, dynamic> json) {
    final dreamWordMap =
        (json['other'] as Map<dynamic, dynamic>)['dream_world'];
    final svgImage = (dreamWordMap as Map<dynamic, dynamic>)['front_default'];
    return Sprites(
        backDefault: json['back_default'],
        backFemale: json['back_female'],
        backShiny: json['back_shiny'],
        backShinyFemale: json['back_shiny_female'],
        frontDefault: json['front_default'],
        frontFemale: json['front_female'],
        frontShiny: json['front_shiny'],
        frontShinyFemale: json['front_shiny_female'],
        dreamWorld: svgImage);
  }
}
