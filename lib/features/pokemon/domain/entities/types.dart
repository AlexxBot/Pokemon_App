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
        return Colors.green.withOpacity(0.5);
      case 'fire':
        return Colors.redAccent.withOpacity(0.5);
      case 'normal':
        return Colors.yellowAccent.withOpacity(0.5);
      case 'bug':
        return Colors.lightGreenAccent.withOpacity(0.5);
      case 'water':
        return Colors.blueAccent.withOpacity(0.5);
      case 'poison':
        return Colors.deepPurpleAccent.withOpacity(0.5);
      default:
        return Colors.grey.withOpacity(0.5);
    }
  }
}
