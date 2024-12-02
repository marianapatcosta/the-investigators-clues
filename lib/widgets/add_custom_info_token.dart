import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/models/custom_info_token.dart';
import 'package:my_botc_notes/widgets/form_action_bar.dart';
import 'package:my_botc_notes/widgets/modal_content_wrapper.dart';
import 'package:my_botc_notes/widgets/number_slider.dart';

class AddCustomInfoToken extends StatefulWidget {
  const AddCustomInfoToken({
    super.key,
    required this.saveCustomInfoToken,
  });

  final void Function(CustomInfoToken) saveCustomInfoToken;

  @override
  State<AddCustomInfoToken> createState() {
    return _AddCustomInfoTokenState();
  }
}

class _AddCustomInfoTokenState extends State<AddCustomInfoToken> {
  final TextEditingController _customTokenController = TextEditingController();
  double _tokenSlotsNumber = 0;

  void _onSave() {
    widget.saveCustomInfoToken(CustomInfoToken(
        text: _customTokenController.text,
        tokenSlotsNumber:
            _tokenSlotsNumber > 0 ? _tokenSlotsNumber.toInt() : null));
  }

  @override
  void dispose() {
    super.dispose();
    _customTokenController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return ModalContentWrapper(
      isFullScreen: false,
      title: t.addCustomToken,
      content: Center(
          child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.only(right: 22),
                child: TextField(
                  controller: _customTokenController,
                  maxLength: 50,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(label: Text(t.text)),
                  maxLines: 2,
                  onTapOutside: (PointerDownEvent event) {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.tokenSlotsNumber,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  NumberSlider(
                    value: _tokenSlotsNumber,
                    onChange: (newValue) {
                      setState(() {
                        _tokenSlotsNumber = newValue;
                      });
                    },
                    min: 0,
                    max: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 42,
        ),
        FormActionBar(onSave: () {
          Navigator.of(context).pop();
          _onSave();
        }),
        const SizedBox(
          height: 42,
        ),
      ])),
    );
  }
}
