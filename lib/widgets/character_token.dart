import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/widgets/character_image.dart';

final tokenSizes = {
  TokenSize.small: {
    'size': kCharacterTokenSizeSmall,
    'fontSize': 34.0,
    'textSpace': 10.0,
    'padding': 16.0,
    'bottom': 2.0,
    'imageTop': 6.0,
  },
  TokenSize.medium: {
    'size': kCharacterTokenSizeMedium,
    'fontSize': 40.0,
    'textSpace': 12.0,
    'padding': 18.0,
    'bottom': 0.0,
    'imageTop': 15.0,
  },
  TokenSize.large: {
    'size': kCharacterTokenSizeLarge,
    'fontSize': 40.0,
    'textSpace': 12.0,
    'padding': 30.0,
    'bottom': 2.0,
    'imageTop': 30.0,
  },
};

class CharacterToken extends StatelessWidget {
  const CharacterToken({
    super.key,
    this.character,
    this.tokenText,
    this.tokenSize = TokenSize.small,
    this.isEvilEasterEgg = false,
  });

  final Character? character;
  final TokenSize tokenSize;
  final String? tokenText;
  final bool isEvilEasterEgg;

  bool get showLeftLeaf {
    if (character == null) {
      return false;
    }

    return character!.firstNight != null && character!.firstNight! > 0;
  }

  bool get showRightLeaf {
    if (character == null) {
      return false;
    }

    return character!.otherNight != null && character!.otherNight! > 0;
  }

  bool get showOrangeLeaf {
    if (character == null) {
      return false;
    }

    return character!.setup ?? false;
  }

  int get topLeafNumber {
    if (character == null) {
      return 0;
    }

    final top = (character!.reminders?.length ?? 0) +
        (character!.remindersGlobal?.length ?? 0);

    return top;
  }

  Widget? get image {
    if (tokenText != null) {
      return null;
    }

    if (isEvilEasterEgg) {
      return const Image(
        image: AssetImage('assets/images/evil.png'),
      );
    }

    if (character != null) {
      return CharacterImage(name: character!.name, image: character!.image);
    }

    return Image(
      image: const AssetImage('assets/images/unknown.png'),
      color: Colors.red.shade600,
    );
  }

  String? get label {
    if (isEvilEasterEgg) {
      return 'Evil';
    }

    if (character != null) {
      return character!.name;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = AppLocalizations.of(context);
    final sizes = tokenSizes[tokenSize]!;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: Container(
            width: sizes['size'],
            height: sizes['size'],
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 142, 96, 79),
                ),
                BoxShadow(
                  color: Color.fromARGB(255, 244, 210, 158),
                  spreadRadius: -4.0,
                  blurRadius: 7.0,
                ),
              ],
            ),
            padding: EdgeInsets.all(sizes['padding']!),
            child: Opacity(
              opacity: 0.2,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/clock.png"),
                  ),
                ),
              ),
            ),
          ),
        ),
        if (showLeftLeaf)
          const Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Image(
              image: AssetImage('assets/images/left_leaf.png'),
            ),
          ),
        if (showRightLeaf)
          const Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Image(
              image: AssetImage('assets/images/right_leaf.png'),
            ),
          ),
        if (showOrangeLeaf)
          const Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Image(
              image: AssetImage('assets/images/orange_leaf.png'),
            ),
          ),
        if (topLeafNumber > 0)
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Image(
              image: AssetImage(
                  'assets/images/top_leaf_${topLeafNumber.toString()}.png'),
            ),
          ),
/*         if (tokenSize == TokenSize.large && character != null)
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: sizes['size']!,
              height: sizes['size']!,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: sizes['size']! * 0.15,
                    horizontal: sizes['size']! * 0.1),
                child: Text(
                  character!.ability,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall!
                      .copyWith(height: 0.7, fontSize: 12),
                ),
              ),
            ),
          ), */
        if (tokenText != null)
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: Text(
                tokenText!,
                style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: sizes['fontSize']! * 1.25,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        if (image != null) ...[
          Positioned(
            left: 0,
            right: 0,
            top: sizes['imageTop']!,
            bottom: 0,
            child: SizedBox(width: sizes['size'], child: Center(child: image)),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: sizes['bottom'],
            child: CircularText(
              children: [
                TextItem(
                  text: Text(
                    label != null ? label! : t.unknown,
                    style: theme.textTheme.titleMedium!.copyWith(
                        fontSize: sizes['fontSize'],
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                  space: sizes['textSpace']!,
                  startAngle: 90,
                  startAngleAlignment: StartAngleAlignment.center,
                  direction: CircularTextDirection.anticlockwise,
                ),
              ],
              radius: 125,
              position: CircularTextPosition.inside,
            ),
          )
        ],
      ],
    );
  }
}
