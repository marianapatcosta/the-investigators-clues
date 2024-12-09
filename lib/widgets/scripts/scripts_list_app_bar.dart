import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/styles.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart' show ButtonTab, Search;

const double _rowHeight = 44;

class ScriptsListAppBar extends StatelessWidget {
  const ScriptsListAppBar({
    super.key,
    required this.showOnlyFavorites,
    required this.searchController,
    required this.toggleShowOnlyFavorites,
    required this.onChange,
    required this.clearSearch,
    this.areFiltersDisabled = false,
  });

  final bool showOnlyFavorites;
  final bool areFiltersDisabled;
  final TextEditingController searchController;
  final void Function() toggleShowOnlyFavorites;
  final void Function(String)? onChange;
  final void Function() clearSearch;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final width = MediaQuery.of(context).size.width;

    return SliverAppBar(
      automaticallyImplyLeading: isScreenSmallerThanX(width, ScreenSize.l),
      title: Text(t.scriptsList),
      centerTitle: false,
      floating: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ButtonTab(
                      childLabel: Icon(
                        showOnlyFavorites
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        size: 20,
                        color: showOnlyFavorites
                            ? kDarkColorScheme.primary
                            : Colors.white,
                      ),
                      isSelected: showOnlyFavorites,
                      isSmallSize: true,
                      onPressed:
                          areFiltersDisabled ? null : toggleShowOnlyFavorites,
                    ),
                    const SizedBox(width: 6),
                    ButtonTab(
                      label: t.all,
                      isSelected: !showOnlyFavorites,
                      isSmallSize: true,
                      onPressed:
                          areFiltersDisabled ? null : toggleShowOnlyFavorites,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Search(
                    searchController: searchController,
                    height: _rowHeight,
                    onChange: onChange,
                    onClear: clearSearch,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
