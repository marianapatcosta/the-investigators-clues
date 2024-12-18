import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/widgets/index.dart' show ModalContentWrapper;

class ShowToken extends StatelessWidget {
  const ShowToken({
    super.key,
    this.title,
    this.infoToken,
    this.token,
    this.tokenText,
    this.actionWidget,
  });

  final String? title;
  final String? infoToken;
  final Widget? token;
  final Widget? actionWidget;
  final String? tokenText;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return ModalContentWrapper(
      title: title,
      content: Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (actionWidget != null)
                Align(
                  alignment: Alignment.topRight,
                  child: actionWidget,
                ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (infoToken != null)
                          Text(
                            infoToken!,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 48),
                            textAlign: TextAlign.center,
                          ),
                        if (token != null) token!,
                        if (tokenText != null)
                          Container(
                            margin: const EdgeInsets.only(top: 12),
                            width: kCharacterTokenSizeLarge * 1.5,
                            child: Text(
                              tokenText!,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 22, height: 1.1),
                              textAlign: TextAlign.center,
                            ),
                          ),
                      ],
                    ),
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
                  icon: const Icon(Icons.close),
                  label: Text(t.close),
                ),
              )
            ]),
      ),
      isNotScrollable: true,
    );
  }
}
