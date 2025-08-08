import 'dart:ui';

import 'package:flutter/material.dart';

class Furniture {
  final String name;
  final String auteur;
  final double price;
  final String imageName;
  final int? selectedColorIndex;
  final List<String>? model3D;
  final String description;
  final List<Color> colors;

  Furniture({
    required this.name,
    required this.imageName,
    this.selectedColorIndex,
    this.model3D,
    required this.description,
    required this.auteur,
    required this.price,
    List<Color>? colors,
  }) : colors = colors ?? [Colors.red, Colors.blue];
}

final f = '''
Chaise orange, chaise blanche en plastic, chaise noir fourrure,
chaise rouge longue, couch bleu, chaise plastic orange
chaise orange vintage
''';
