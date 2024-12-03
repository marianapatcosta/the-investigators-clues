import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowMoreButton extends StatelessWidget {
  const ShowMoreButton({
    super.key,
    required this.size,
    required this.showMore,
    required this.toggleShowMore,
  });

  final double size;
  final bool showMore;
  final void Function() toggleShowMore;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return SizedBox(
      width: size,
      height: size,
      child: TextButton(
          onPressed: toggleShowMore,
          child: Center(
            child: Text(
              showMore ? t.showMore : t.showLess,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleSmall!
                  .copyWith(fontWeight: FontWeight.bold, height: 0.8),
            ),
          )),
    );
  }
}
