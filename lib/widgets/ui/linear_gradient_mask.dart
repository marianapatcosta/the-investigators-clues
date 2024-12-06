import 'package:flutter/material.dart';

class LinearGradientMask extends StatelessWidget {
  const LinearGradientMask({
    super.key,
    required this.colors,
    required this.child,
    this.stops,
  });

  final List<Color> colors;
  final Widget child;
  final List<double>? stops;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (shader) => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: colors,
        stops: stops ?? const [0.2, 1],
        tileMode: TileMode.mirror,
      ).createShader(shader),
      child: child,
    );
  }
}
