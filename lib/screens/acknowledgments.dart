import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart' show Acknowledgments, Layout;

class AcknowledgmentsScreen extends StatelessWidget {
  const AcknowledgmentsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;

    return Layout(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: isScreenSmallerThanX(width, ScreenSize.l),
          title: Text(t.acknowledgments),
          centerTitle: false,
        ),
        body: const SafeArea(
          child: SingleChildScrollView(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Acknowledgments()),
          ),
        ),
      ),
    );
  }
}
