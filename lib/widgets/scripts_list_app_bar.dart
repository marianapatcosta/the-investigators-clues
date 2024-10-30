import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/search.dart';

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
  final ValueChanged<bool> toggleShowOnlyFavorites;
  final void Function(String)? onChange;
  final void Function() clearSearch;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return SliverAppBar(
      automaticallyImplyLeading: isScreenSmallerThanX(width, ScreenSize.l),
      title: Text(t.scriptsList),
      centerTitle: false,
      floating: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FilterChip(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      selected: showOnlyFavorites,
                      label: Icon(
                        Icons.favorite,
                        size: 20,
                        color: showOnlyFavorites
                            ? theme.colorScheme.surface
                            : null,
                      ),
                      selectedColor: theme.colorScheme.primary,
                      showCheckmark: false,
                      onSelected:
                          areFiltersDisabled ? null : toggleShowOnlyFavorites,
                    ),
                    const SizedBox(width: 8),
                    FilterChip(
                      selected: !showOnlyFavorites,
                      padding: const EdgeInsets.symmetric(
                          vertical: 9, horizontal: 10),
                      label: Text(
                        t.all,
                        style: const TextStyle().copyWith(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      selectedColor: theme.colorScheme.primary,
                      labelStyle: TextStyle(
                        color: !showOnlyFavorites
                            ? theme.colorScheme.surface
                            : null,
                      ),
                      showCheckmark: false,
                      onSelected:
                          areFiltersDisabled ? null : toggleShowOnlyFavorites,
                    ),
                  ],
                ),
                Search(
                  searchController: searchController,
                  onChange: onChange,
                  /*        onSubmit: _showOnlyFavorites
                            ? _filterFavoriteScripts
                            : _fetchScripts, */
                  onClear: clearSearch,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
