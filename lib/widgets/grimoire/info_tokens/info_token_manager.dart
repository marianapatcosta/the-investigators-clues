import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/widgets/ui/form_action_bar.dart';
import 'package:my_botc_notes/widgets/ui/modal_content_wrapper.dart';
import 'package:my_botc_notes/widgets/grimoire/info_tokens/show_token.dart';

class InfoTokenManager extends StatefulWidget {
  const InfoTokenManager({
    super.key,
    required this.infoToken,
    required this.saveInfoToken,
  });

  final String infoToken;
  final void Function(String) saveInfoToken;

  @override
  State<InfoTokenManager> createState() {
    return _InfoTokenManagerState();
  }
}

class _InfoTokenManagerState extends State<InfoTokenManager> {
  late final TextEditingController _infoTokenController;
  bool _isEditMode = false;
  String _infoToken = '';

  void _onSave() {
    setState(() {
      _isEditMode = false;
      _infoToken = _infoTokenController.text;
    });
    widget.saveInfoToken(_infoTokenController.text);
  }

  @override
  void initState() {
    super.initState();
    _infoTokenController = TextEditingController(text: widget.infoToken);
    _isEditMode = widget.infoToken == '';
    _infoToken = widget.infoToken;
  }

  @override
  void dispose() {
    super.dispose();
    _infoTokenController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return _isEditMode
        ? ModalContentWrapper(
            title: t.editInfoToken,
            content: Expanded(
              child: Column(
                  mainAxisAlignment: _isEditMode
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    TextField(
                      controller: _infoTokenController,
                      maxLength: 250,
                      decoration: InputDecoration(label: Text(t.infoToken)),
                      maxLines: 3,
                      onTapOutside: (PointerDownEvent event) {
                        FocusScope.of(context).unfocus();
                      },
                    ),
                    const SizedBox(height: 72),
                    Align(
                      child: FormActionBar(
                        onSave: _onSave,
                        onCancel: () {
                          setState(() {
                            _isEditMode = false;
                            if (_infoToken == '') {
                              Navigator.pop(context);
                            }
                          });
                        },
                      ),
                    )
                  ]),
            ),
            isFullScreen: true,
          )
        : ShowToken(
            infoToken: _infoToken,
            actionWidget: IconButton(
              onPressed: () {
                setState(() {
                  _isEditMode = true;
                });
              },
              icon: Icon(
                Icons.edit,
                semanticLabel: t.editInfoToken,
                size: 24,
              ),
            ),
          );
  }
}
