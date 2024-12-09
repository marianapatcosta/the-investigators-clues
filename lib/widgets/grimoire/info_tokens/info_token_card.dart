import 'package:flutter/material.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/index.dart' show InfoToken;
import 'package:my_botc_notes/utils.dart';

const textShadows = <Shadow>[
  Shadow(
    offset: Offset(3.0, 3.0),
    blurRadius: 3.0,
    color: Colors.black,
  ),
  Shadow(
    offset: Offset(3.0, 3.0),
    blurRadius: 8.0,
    color: Colors.black87,
  ),
];

class InfoTokenCard extends StatelessWidget {
  const InfoTokenCard({
    super.key,
    required this.infoToken,
  });

  final InfoToken infoToken;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final getTranslationKey = getTranslationKeyGetter(context);

    return Card(
      child: Container(
        width: kInfoCardWidth,
        height: kInfoCardHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            infoToken.color,
            infoToken.color.withOpacity(0.75),
          ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            SizedBox(
              width: kInfoCardWidth,
              height: kInfoCardHeight,
              child: Opacity(
                opacity: 0.5,
                child: Image.asset("assets/images/card_border.png",
                    color: Colors.orange[100]),
              ),
            ),
            if (infoToken.imageName != null)
              Align(
                alignment: Alignment.topCenter,
                child: Opacity(
                  opacity: 0.5,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 36, left: 14.0, right: 14.0),
                    child: Image.asset(
                        "assets/images/${infoToken.imageName}.png",
                        color: Colors.orange[100]),
                  ),
                ),
              ),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                  bottom: 0,
                ),
                child: Align(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '${(getTranslationKey(infoToken.regularPart1) ?? infoToken.regularPart1).toUpperCase()}\n',
                          style: theme.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: Colors.white,
                            shadows: textShadows,
                          ),
                        ),
                        TextSpan(
                          text:
                              '${(getTranslationKey(infoToken.bold) ?? infoToken.bold).toUpperCase()}${getTranslationKey(infoToken.regularPart2) != '' ? '\n' : ''}',
                          style: theme.textTheme.titleLarge!.copyWith(
                            height: 1.25,
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Colors.amber[100],
                            shadows: textShadows,
                          ),
                        ),
                        TextSpan(
                          text:
                              '${(getTranslationKey(infoToken.regularPart2) ?? infoToken.regularPart2).toUpperCase()}',
                          style: theme.textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: Colors.white,
                            shadows: textShadows,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
