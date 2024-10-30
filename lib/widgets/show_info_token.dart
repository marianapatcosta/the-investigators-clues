import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/widgets/form_action_bar.dart';
import 'package:my_botc_notes/widgets/modal_content_wrapper.dart';

class ShowInfoToken extends StatefulWidget {
  const ShowInfoToken({
    super.key,
    required this.infoToken,
    required this.saveInfoToken,
  });

  final String infoToken;
  final void Function(String) saveInfoToken;

  @override
  State<ShowInfoToken> createState() {
    return _ShowInfoTokenState();
  }
}

class _ShowInfoTokenState extends State<ShowInfoToken> {
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

    return ModalContentWrapper(
      title: _isEditMode ? t.editInfoToken : '',
      content: Expanded(
        child: Column(
            mainAxisAlignment: _isEditMode
                ? MainAxisAlignment.start
                : MainAxisAlignment.spaceBetween,
            children: [
              if (_isEditMode) ...[
                TextField(
                  controller: _infoTokenController,
                  maxLength: 250,
                  decoration: InputDecoration(label: Text(t.infoToken)),
                  maxLines: 3,
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
              ] else ...[
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
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
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      _infoToken,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 48),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 48),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 40),
                    ),
                    icon: const Icon(Icons.save),
                    label: Text(t.close),
                  ),
                )
              ],
            ]),
      ),
      isFullScreen: true,
    );
  }
}
