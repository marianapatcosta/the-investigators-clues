import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/screens/index.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show ModalContentWrapper, NumberSlider;

const double _titleWidth = 130;
const double _checkboxWidth = 250;

class GrimoireSettings extends StatefulWidget {
  const GrimoireSettings({
    super.key,
    required this.playerTokenScale,
    required this.reminderTokenScale,
    required this.showPlayersNotes,
    required this.showVotingPhase,
    required this.showGamePhase,
    required this.showGameSetup,
    required this.onUpdatePlayerTokenScale,
    required this.onUpdateReminderTokenScale,
    required this.onUpdateShowPlayersNotes,
    required this.onUpdateShowVotesNominations,
    required this.onUpdateShowGamePhase,
    required this.onUpdateShowGameSetup,
  });

  final double playerTokenScale;
  final double reminderTokenScale;
  final bool showPlayersNotes;
  final bool showVotingPhase;
  final bool showGamePhase;
  final bool showGameSetup;
  final void Function(double) onUpdatePlayerTokenScale;
  final void Function(double) onUpdateReminderTokenScale;
  final void Function() onUpdateShowPlayersNotes;
  final void Function() onUpdateShowGameSetup;
  final void Function() onUpdateShowVotesNominations;
  final void Function() onUpdateShowGamePhase;

  @override
  State<GrimoireSettings> createState() {
    return _GrimoireSettingsState();
  }
}

class _GrimoireSettingsState extends State<GrimoireSettings> {
  late double _playerTokenScale;
  late double _reminderTokenScale;
  late bool _showPlayersNotes;
  late bool _showPlayersVotesNominations;
  late bool _showGamePhase;
  late bool _showGameSetup;

  @override
  void initState() {
    super.initState();
    _playerTokenScale = widget.playerTokenScale;
    _reminderTokenScale = widget.reminderTokenScale;
    _showPlayersNotes = widget.showPlayersNotes;
    _showPlayersVotesNominations = widget.showVotingPhase;
    _showGamePhase = widget.showGamePhase;
    _showGameSetup = widget.showGameSetup;
  }

  @override
  Widget build(BuildContext context) {
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
          value: _showPlayersNotes,
          onChanged: (bool? newValue) {
            setState(() {
              if (!_showPlayersNotes && _showPlayersVotesNominations) {
                _showPlayersVotesNominations = false;
              }
              _showPlayersNotes = !_showPlayersNotes;
              widget.onUpdateShowPlayersNotes();
            });
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
          value: _showPlayersVotesNominations,
          onChanged: (bool? newValue) {
            setState(() {
              if (!_showPlayersVotesNominations && _showPlayersNotes) {
                _showPlayersNotes = false;
              }
              _showPlayersVotesNominations = !_showPlayersVotesNominations;
              widget.onUpdateShowVotesNominations();
            });
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
          value: _showGamePhase,
          onChanged: (bool? newValue) {
            setState(() {
              _showGamePhase = !_showGamePhase;
              widget.onUpdateShowGamePhase();
            });
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
          value: _showGameSetup,
          onChanged: (bool? newValue) {
            setState(() {
              _showGameSetup = !_showGameSetup;
              widget.onUpdateShowGameSetup();
            });
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
                    value: _playerTokenScale,
                    onChange: (value) {
                      setState(() {
                        _playerTokenScale = value;
                        widget.onUpdatePlayerTokenScale(value);
                      });
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
                    value: _reminderTokenScale,
                    onChange: (value) {
                      setState(() {
                        _reminderTokenScale = value;
                        widget.onUpdateReminderTokenScale(value);
                      });
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
