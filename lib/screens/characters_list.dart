import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/data/characters.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show CharactersGrid, CharacterItem, CustomSafeArea, Layout, Search;

final kInitialCharactersByTeam = getCharactersByTeam(characters);

class CharactersListScreen extends StatefulWidget {
  const CharactersListScreen({
    super.key,
  });

  @override
  State<CharactersListScreen> createState() {
    return _CharactersListScreenState();
  }
}

class _CharactersListScreenState extends State<CharactersListScreen>
    with AutomaticKeepAliveClientMixin {
  Map<Team, List<Character>> _filteredCharactersByTeam =
      kInitialCharactersByTeam;
  final _searchController = TextEditingController();

  @override
  bool get wantKeepAlive => true;

  bool get hasCharactersToShow {
    return _filteredCharactersByTeam.values
        .expand((i) => i)
        .toList()
        .isNotEmpty;
  }

  void _filterCharacters(String inputValue) {
    final charactersByTeamCopy = {...kInitialCharactersByTeam};
    for (final key in charactersByTeamCopy.keys) {
      charactersByTeamCopy[key] = charactersByTeamCopy[key]!
          .where((char) =>
              char.name.toLowerCase().contains(inputValue.trim().toLowerCase()))
          .toList();
    }

    setState(() {
      _filteredCharactersByTeam = charactersByTeamCopy;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _filteredCharactersByTeam = kInitialCharactersByTeam;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Layout(
      child: Scaffold(
          body: CustomSafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading:
                  isScreenSmallerThanX(width, ScreenSize.l),
              floating: true,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(t.characters),
                  Search(
                    searchController: _searchController,
                    onChange: _filterCharacters,
                    onClear: _clearSearch,
                  ),
                ],
              ),
              centerTitle: false,
            ),
            !hasCharactersToShow
                ? SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text(
                        t.searchNoResults(t.characters.toLowerCase()),
                        style: theme.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        final item =
                            _filteredCharactersByTeam.entries.toList()[index];
                        return item.value.isEmpty
                            ? const SizedBox()
                            : ExpansionTile(
                                initiallyExpanded: item.value.isNotEmpty,
                                shape: const Border(),
                                title: Text(
                                  '${getLabelFromTeam(item.key)} (${item.value.length})',
                                  style: theme.textTheme.titleMedium,
                                ),
                                children: [
                                  if (isScreenBiggerThanX(width, ScreenSize.md))
                                    CharactersGrid(characters: item.value)
                                  else
                                    for (final character in item.value) ...[
                                      CharacterItem(character: character),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                ],
                              );
                      },
                      childCount: _filteredCharactersByTeam.entries.length,
                    ),
                  ),
          ],
        ),
      )),
    );
  }
}
