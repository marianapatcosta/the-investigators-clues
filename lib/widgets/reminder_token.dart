import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/reminder.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/character_image.dart';

final tokenSizes = {
  TokenSize.small: {
    'size': kReminderTokenSizeSmall,
    'fontSize': 40.0,
    'textSpace': 9.0,
  },
  TokenSize.medium: {
    'size': kReminderTokenSizeMedium,
    'fontSize': 42.0,
    'textSpace': 9.0,
  },
  TokenSize.large: {
    'size': kReminderTokenSizeLarge,
    'fontSize': 44.0,
    'textSpace': 10.0,
  },
};

class ReminderToken extends StatelessWidget {
  const ReminderToken({
    super.key,
    required this.reminder,
    required this.character,
    this.tokenSize = TokenSize.small,
  });

  final Reminder reminder;
  final TokenSize tokenSize;
  final Character? character;

  @override
  Widget build(BuildContext context) {
    final sizes = tokenSizes[tokenSize]!;
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final isLargeScreen = isScreenBiggerThanX(width, ScreenSize.md);

    Widget image() {
      if (reminder.tokenId == 'evil') {
        return const Image(
          image: AssetImage('assets/images/evil.png'),
        );
      }

      if (reminder.tokenId == 'good') {
        return const Image(
          image: AssetImage('assets/images/good.png'),
        );
      }

      if (reminder.tokenId == 'arrow') {
        return Image(
          image: AssetImage(
              'assets/images/arrow_${isLargeScreen ? 'right' : 'down'}.png'),
        );
      }

      return CharacterImage(name: character!.name, image: character!.image);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: Container(
        width: sizes['size'],
        height: sizes['size'],
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 57, 36, 69),
            ),
            BoxShadow(
              color: Color.fromARGB(255, 69, 47, 82),
              spreadRadius: -3.0,
              blurRadius: 7.0,
            ),
          ],
        ),
        padding: const EdgeInsets.all(2),
        child: Stack(children: [
          Align(
            child: SizedBox(width: sizes['size']! * 0.75, child: image()),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CircularText(
              children: [
                TextItem(
                  text: Text(
                    reminder.reminder,
                    style: theme.textTheme.titleMedium!.copyWith(
                      fontSize: sizes['fontSize'],
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
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
          ),
        ]),
      ),
    );
  }
}
