import 'package:flutter/material.dart';

class CharacterImage extends StatelessWidget {
  const CharacterImage({
    super.key,
    required this.name,
    required this.image,
    this.color,
  });

  final String image;
  final String name;
  final Color? color;

  bool get hasNetworkImage {
    return image.contains('http');
  }

  @override
  Widget build(BuildContext context) {
    return hasNetworkImage
        ? FadeInImage(
            imageSemanticLabel: name,
            image: NetworkImage(
              image,
            ),
            placeholder: const AssetImage('assets/images/botc_logo.png'),
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/images/botc_logo.png',
                  fit: BoxFit.cover);
            },
            fit: BoxFit.cover,
          )
        : Image.asset(
            image,
            fit: BoxFit.fitHeight,
            semanticLabel: name,
            color: color,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/images/botc_logo.png',
                  fit: BoxFit.cover);
            },
          );
  }
}
