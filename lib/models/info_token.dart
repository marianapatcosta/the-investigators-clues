import 'package:flutter/material.dart';

class InfoToken {
  InfoToken({
    required this.id,
    required this.label,
    required this.regularPart1,
    required this.bold,
    required this.regularPart2,
    this.color = const Color.fromRGBO(87, 52, 117, 1),
    this.imageName = 'stain',
    this.tokenSlots,
  });

  final String id;
  final String label;
  final String regularPart1;
  final String bold;
  final String regularPart2;
  final Color color;
  final String? imageName;
  List<dynamic>? tokenSlots;

  set setTokenSlots(List<dynamic>? newTokenSlots) {
    tokenSlots = newTokenSlots;
  }
}
