import 'package:flutter/material.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart' show Layout;

class TabsScreen extends StatefulWidget {
  const TabsScreen({
    super.key,
  });

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final tabsMetadata = getTabsMetadata(width);
    final getTranslationKey = getTranslationKeyGetter(context);

    return Layout(
      child: DefaultTabController(
        length: tabsMetadata.length,
        child: Scaffold(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              for (final tabMetadata in tabsMetadata) tabMetadata.screen
            ],
          ),
          bottomNavigationBar: TabBar(
            labelPadding: const EdgeInsets.all(0.0),
            dividerColor: Theme.of(context).colorScheme.surface,
            tabs: [
              for (final tabMetadata in tabsMetadata)
                Tab(
                  text: getTranslationKey(tabMetadata.titleKey),
                  icon: tabMetadata.icon != null
                      ? Icon(tabMetadata.icon)
                      : ImageIcon(tabMetadata.image),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
