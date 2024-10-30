import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/widgets/character_image.dart';

class CharacterToken extends StatelessWidget {
  const CharacterToken({
    super.key,
    this.character,
    this.isLarge = false,
    this.isEvilEasterEgg = false,
  });

  final Character? character;
  final bool isLarge;
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

  Widget image() {
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
    final double size =
        isLarge ? kCharacterTokenLargeSize : kCharacterTokenSmallSize;

    return Stack(
      children: [
        Container(
          width: size,
          height: size,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 226, 165, 73),
              ),
              BoxShadow(
                color: Color.fromARGB(234, 239, 219, 171),
                spreadRadius: -3.0,
                blurRadius: 7.0,
              ),
            ],
          ),
          padding: EdgeInsets.all(isLarge ? 16 : 12.0),
          child: Opacity(
            opacity: 0.4,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/clockface.webp"),
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
              image: AssetImage('assets/images/left_leaf.webp'),
            ),
          ),
        if (showRightLeaf)
          const Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Image(
              image: AssetImage('assets/images/right_leaf.webp'),
            ),
          ),
        if (showOrangeLeaf)
          const Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Image(
              image: AssetImage('assets/images/orange_leaf.webp'),
            ),
          ),
        if (topLeafNumber > 0)
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Image(
              image: AssetImage(
                  'assets/images/top_leaf_${topLeafNumber.toString()}.webp'),
            ),
          ),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: SizedBox(width: size, child: image()),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: isLarge ? -3 : -2,
          child: CircularText(
            children: [
              TextItem(
                text: Text(
                  label != null ? label! : t.unknown,
                  style: theme.textTheme.titleMedium!.copyWith(
                      fontSize: isLarge ? 40 : 34,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
                space: isLarge ? 12 : 10,
                startAngle: 90,
                startAngleAlignment: StartAngleAlignment.center,
                direction: CircularTextDirection.anticlockwise,
              ),
            ],
            radius: 125,
            position: CircularTextPosition.inside,
          ),
        ),
      ],
    );
  }
}
