import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show ModalContentWrapper, NumberSlider;

const double kTitleWidth = 130;

class TokenScaler extends StatefulWidget {
  const TokenScaler({
    super.key,
    required this.minScaleValue,
    required this.maxScaleValue,
    required this.onUpdatePlayerTokenScale,
    required this.onUpdateReminderTokenScale,
  });

  final double minScaleValue;
  final double maxScaleValue;
  final void Function(double) onUpdatePlayerTokenScale;
  final void Function(double) onUpdateReminderTokenScale;

  @override
  State<TokenScaler> createState() {
    return _TokenScalerState();
  }
}

class _TokenScalerState extends State<TokenScaler> {
  double _playerTokenScale = 1;
  double _reminderTokenScale = 1;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final divisions =
        ((widget.maxScaleValue - widget.minScaleValue) / 0.1).toInt();

    return ModalContentWrapper(
      title: t.scaleToken,
      content: Container(
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: kTitleWidth,
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
                    divisions: divisions,
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
                  width: kTitleWidth,
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
                    min: widget.minScaleValue,
                    max: widget.maxScaleValue,
                    divisions: divisions,
                    roundDisplayValue: false,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
