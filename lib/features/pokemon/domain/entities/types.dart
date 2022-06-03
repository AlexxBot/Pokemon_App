/* enum Types {
  grass,
  fire,
  normal,
  bug,
  water,
} */

import 'package:flutter/material.dart';

class TypesColors {
  static Color getColor(String type) {
    switch (type) {
      case 'grass':
        return Colors.green.withOpacity(0.7);
      case 'fire':
        return Colors.redAccent.withOpacity(0.7);
      case 'normal':
        return Colors.yellowAccent.withOpacity(0.7);
      case 'bug':
        return Colors.lightGreenAccent.withOpacity(0.7);
      case 'water':
        return Colors.blueAccent.withOpacity(0.7);
      case 'poison':
        return Colors.deepPurpleAccent.withOpacity(0.7);
      case 'psychic':
        return Colors.purple.withOpacity(0.7);
      case 'rock':
        return Colors.brown.withOpacity(0.7);
      case 'ground':
        return Colors.brown.withOpacity(0.7);
      case 'electric':
        return Colors.yellow.withOpacity(0.7);
      case 'fairy':
        return Colors.pink.withOpacity(0.7);
      default:
        return Colors.grey.withOpacity(0.7);
    }
  }
}
