import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/providers/index.dart';
import 'package:my_botc_notes/screens/index.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show ModalContentWrapper, NumberSlider;

const double _titleWidth = 130;
const double _checkboxWidth = 250;

class GrimoireSettings extends ConsumerStatefulWidget {
  const GrimoireSettings({
    super.key,
  });

  @override
  ConsumerState<GrimoireSettings> createState() {
    return _GrimoireSettingsState();
  }
}

class _GrimoireSettingsState extends ConsumerState<GrimoireSettings> {
  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsProvider);
    final t = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;
    final isLargeScreen = isScreenBiggerThanX(width, ScreenSize.md);
    final scalerDivisions = ((kMaxScale - kMinScale) / 0.1).toInt();

    final notesCheckbox = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          t.showPlayersNotes,
        ),
        const SizedBox(
          width: 8,
        ),
        Checkbox(
          value: settings.showPlayersNotes,
          onChanged: (bool? newValue) {
            ref.read(settingsProvider.notifier).toggleShowPlayersNotes();
          },
        ),
      ],
    );

    final votesNominationsCheckBox = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          t.showVotingPhase,
        ),
        const SizedBox(
          width: 8,
        ),
        Checkbox(
          value: settings.showVotingPhase,
          onChanged: (bool? newValue) {
            ref.read(settingsProvider.notifier).toggleShowVotingPhase();
          },
        ),
      ],
    );

    final gamePhaseCheckBox = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          t.showGamePhase,
        ),
        const SizedBox(
          width: 8,
        ),
        Checkbox(
          value: settings.showGamePhase,
          onChanged: (bool? newValue) {
            ref.read(settingsProvider.notifier).toggleShowGamePhase();
          },
        ),
      ],
    );

    final gameSetupCheckBox = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          t.showGameSetup,
        ),
        const SizedBox(
          width: 8,
        ),
        Checkbox(
          value: settings.showGameSetup,
          onChanged: (bool? newValue) {
            ref.read(settingsProvider.notifier).toggleShowGameSetup();
          },
        ),
      ],
    );

    return ModalContentWrapper(
      title: t.grimoireSettings,
      content: Container(
        margin: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: _titleWidth,
                  child: Text(t.playerTokens),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: NumberSlider(
                    value: settings.playerTokenScale,
                    onChange: (value) {
                      ref
                          .read(settingsProvider.notifier)
                          .setPlayerTokenScale(value);
                    },
                    min: 0.5,
                    max: 2,
                    divisions: scalerDivisions,
                    roundDisplayValue: false,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                SizedBox(
                  width: _titleWidth,
                  child: Text(t.reminderTokens),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: NumberSlider(
                    value: settings.reminderTokenScale,
                    onChange: (value) {
                      ref
                          .read(settingsProvider.notifier)
                          .setReminderTokenScale(value);
                    },
                    min: kMinScale,
                    max: kMaxScale,
                    divisions: scalerDivisions,
                    roundDisplayValue: false,
                  ),
                ),
              ],
            ),
            if (isLargeScreen) ...[
              Row(
                children: [
                  Expanded(child: notesCheckbox),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: votesNominationsCheckBox,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(child: gamePhaseCheckBox),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: gameSetupCheckBox,
                  ),
                ],
              ),
            ] else ...[
              SizedBox(width: _checkboxWidth, child: notesCheckbox),
              const SizedBox(
                height: 8,
              ),
              SizedBox(width: _checkboxWidth, child: votesNominationsCheckBox),
              const SizedBox(
                height: 8,
              ),
              SizedBox(width: _checkboxWidth, child: gamePhaseCheckBox),
              const SizedBox(
                height: 8,
              ),
              SizedBox(width: _checkboxWidth, child: gameSetupCheckBox),
            ],
          ],
        ),
      ),
    );
  }
}
