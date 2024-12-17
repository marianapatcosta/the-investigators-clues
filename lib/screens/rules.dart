import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart' show Layout;

class RulesScreen extends StatelessWidget {
  const RulesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Layout(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading:
                  isScreenSmallerThanX(width, ScreenSize.l),
              title: Text(t.rules),
              centerTitle: false,
              floating: true,
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              sliver: SliverToBoxAdapter(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.rulesOverview,
                        style:
                            theme.textTheme.titleMedium!.copyWith(height: 1.25),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Blood on the Clocktower ',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                  fontStyle: FontStyle.italic, height: 1.25),
                            ),
                            TextSpan(
                              text: t.rulesOverviewDesc,
                              style: theme.textTheme.bodyMedium!
                                  .copyWith(height: 1.25),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        t.rulesRoleTypes,
                        style:
                            theme.textTheme.titleMedium!.copyWith(height: 1.25),
                      ),
                      const SizedBox(height: 4),
                      _TextListItem(
                          title: 'Townsfolk',
                          description: t.rulesRoleTypesTownsfolk),
                      _TextListItem(
                          title: 'Outsiders',
                          description: t.rulesRoleTypesOutsiders),
                      _TextListItem(
                          title: 'Minions',
                          description: t.rulesRoleTypesMinions),
                      _TextListItem(
                          title: 'Demon', description: t.rulesRoleTypesDemon),
                      _TextListItem(
                          title: 'Travellers',
                          description: t.rulesRoleTypesTravellers),
                      const SizedBox(height: 16),
                      Text(
                        t.rulesSetup,
                        style:
                            theme.textTheme.titleMedium!.copyWith(height: 1.25),
                      ),
                      const SizedBox(height: 4),
                      _TextListItem(
                          title: t.rulesSetupTItle1,
                          description: t.rulesSetupDesc1),
                      _TextListItem(
                          title: t.rulesSetupTItle2,
                          description: t.rulesSetupDesc4),
                      _TextListItem(
                          title: t.rulesSetupTItle3,
                          description: t.rulesSetupDesc3),
                      _TextListItem(
                          title: t.rulesSetupTItle4,
                          description: t.rulesSetupDesc4),
                      const SizedBox(height: 16),
                      Text(
                        t.rulesPhases,
                        style:
                            theme.textTheme.titleMedium!.copyWith(height: 1.25),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        t.rulesPhasesDesc,
                        style:
                            theme.textTheme.bodyMedium!.copyWith(height: 1.25),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        t.rulesNightPhase,
                        style:
                            theme.textTheme.titleSmall!.copyWith(height: 1.25),
                      ),
                      const SizedBox(height: 4),
                      _TextListItem(description: t.rulesNightPhaseDesc1),
                      _TextListItem(description: t.rulesNightPhaseDesc2),
                      _TextListItem(
                          description: t.rulesNightPhaseDesc2A,
                          hasIndentation: true),
                      _TextListItem(
                          description: t.rulesNightPhaseDesc2B,
                          hasIndentation: true),
                      _TextListItem(description: t.rulesNightPhaseDesc3),
                      const SizedBox(height: 8),
                      Text(
                        t.rulesDayPhase,
                        style:
                            theme.textTheme.titleSmall!.copyWith(height: 1.25),
                      ),
                      const SizedBox(height: 4),
                      _TextListItem(description: t.rulesDayPhaseDesc1),
                      _TextListItem(description: t.rulesDayPhaseDesc2),
                      _TextListItem(description: t.rulesDayPhaseDesc3),
                      _TextListItem(
                          title: t.rulesDayPhaseDesc4Title,
                          description: t.rulesDayPhaseDesc4),
                      _TextListItem(description: t.rulesDayPhaseDesc5),
                      const SizedBox(height: 16),
                      Text(
                        t.rulesWinning,
                        style:
                            theme.textTheme.titleMedium!.copyWith(height: 1.25),
                      ),
                      const SizedBox(height: 4),
                      _TextListItem(
                          title: t.rulesWinningTitle1,
                          description: t.rulesWinningDesc1),
                      _TextListItem(
                          title: t.rulesWinningTitle2,
                          description: t.rulesWinningDesc2),
                      const SizedBox(height: 16),
                      Text(
                        t.rulesDrunkennessPoisoning,
                        style:
                            theme.textTheme.titleMedium!.copyWith(height: 1.25),
                      ),
                      const SizedBox(height: 4),
                      _TextListItem(
                          description: t.rulesDrunkennessPoisoningDesc1),
                      _TextListItem(
                          description: t.rulesDrunkennessPoisoningDesc2),
                      const SizedBox(height: 16),
                      Text(
                        t.rulesTips,
                        style:
                            theme.textTheme.titleMedium!.copyWith(height: 1.25),
                      ),
                      const SizedBox(height: 4),
                      _TextListItem(
                          title: t.rulesTipsTitle1,
                          description: t.rulesTipsDesc1),
                      _TextListItem(
                          title: t.rulesTipsTitle2,
                          description: t.rulesTipsDesc2),
                      _TextListItem(
                          title: t.rulesTipsTitle3,
                          description: t.rulesTipsDesc3),
                      const SizedBox(height: 16),
                      Text(
                        t.rulesConclusion,
                        style:
                            theme.textTheme.bodyMedium!.copyWith(height: 1.25),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TextListItem extends StatelessWidget {
  const _TextListItem({
    this.title,
    this.hasIndentation = false,
    required this.description,
  });

  final String? title;
  final bool hasIndentation;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasIndentation)
          const SizedBox(
            width: 12,
          ),
        Text(
          '-  ',
          style: theme.textTheme.bodyMedium!.copyWith(height: 1.5),
        ),
        Expanded(
          child: title != null
              ? RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '$title: ',
                        style: theme.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold, height: 1.25),
                      ),
                      TextSpan(
                        text: description,
                        style:
                            theme.textTheme.bodyMedium!.copyWith(height: 1.25),
                      )
                    ],
                  ),
                )
              : Text(
                  description,
                  style: theme.textTheme.bodyMedium!.copyWith(height: 1.25),
                ),
        ),
      ],
    );
  }
}
