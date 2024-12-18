import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_botc_notes/constants.dart';
import 'package:my_botc_notes/models/index.dart'
    show Character, GameSetup, Team;
import 'package:my_botc_notes/utils.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show
        FormActionBar,
        GameSetupTableItem,
        ModalContentWrapper,
        SelectScriptCharacterButton;

const double _gameSetupIconSize = 20;

class ScriptCharactersSelector extends StatefulWidget {
  const ScriptCharactersSelector({
    super.key,
    required this.title,
    required this.numberOfCharactersToSelect,
    required this.characters,
    required this.initialSelectedCharacters,
    this.gameSetup,
    this.allowMoreThanOneOfSameCharacter = false,
    required this.saveCharacters,
  });

  final String title;
  final int numberOfCharactersToSelect;
  final List<Character> characters;
  final List<Character> initialSelectedCharacters;
  final GameSetup? gameSetup;
  final bool allowMoreThanOneOfSameCharacter;
  final Function(List<Character>) saveCharacters;

  @override
  State<ScriptCharactersSelector> createState() {
    return _ScriptCharactersSelectorState();
  }
}

class _ScriptCharactersSelectorState extends State<ScriptCharactersSelector> {
  List<Character> _selectedCharacters = [];

  bool get displayCharactersPerTeam {
    return widget.gameSetup != null;
  }

  Map<Team, List<Character>> get charactersByTeam {
    if (!displayCharactersPerTeam) {
      return {};
    }
    return getCharactersByTeam(widget.characters);
  }

  Map<Team, List<Character>> get selectedCharactersByTeam {
    if (!displayCharactersPerTeam) {
      return {};
    }
    return getCharactersByTeam(_selectedCharacters);
  }

  void __resetCharacters() {
    setState(() {
      _selectedCharacters = [];
    });
  }

  void _getRandomCharacters() {
    if (displayCharactersPerTeam) {
      final List<Character> randomCharacters = [];

      for (final item in charactersByTeam.entries) {
        final shuffledCharacters = [...item.value]..shuffle();
        randomCharacters.addAll(shuffledCharacters
            .take(widget.gameSetup!.getValueFromTeam(item.key))
            .toList());
      }

      final randomCharactersIds =
          randomCharacters.map((character) => character.id).toList();

      final orderedShuffledCharacters = widget.characters
          .where((character) => randomCharactersIds.contains(character.id))
          .toList();

      setState(() {
        _selectedCharacters = orderedShuffledCharacters;
      });
    } else {
      final shuffledAllCharacters = [...widget.characters]..shuffle();

      final shuffledCharacters = shuffledAllCharacters
          .take(widget.numberOfCharactersToSelect)
          .toList();

      final shuffledCharactersIds =
          shuffledCharacters.map((character) => character.id).toList();

      final orderedShuffledCharacters = widget.characters
          .where((character) => shuffledCharactersIds.contains(character.id))
          .toList();

      setState(() {
        _selectedCharacters = orderedShuffledCharacters;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedCharacters = [...widget.initialSelectedCharacters];
  }

  void _onUpdateIsSelected(Character character, int numberOfTokens) {
    setState(() {
      if (_getIsCharacterSelected(character)) {
        _selectedCharacters.removeWhere(
            (selectedCharacter) => selectedCharacter.id == character.id);
      }

      if (numberOfTokens > 0) {
        final charactersToAdd =
            List.generate(numberOfTokens, (index) => character);
        _selectedCharacters.addAll(charactersToAdd);
      }
    });
  }

  bool _getIsCharacterSelected(Character character) {
    return _selectedCharacters
        .where((selectedCharacter) => selectedCharacter.id == character.id)
        .isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ModalContentWrapper(
      title: widget.title,
      isNotScrollable: false,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                children: [
                  OutlinedButton(
                    onPressed: _getRandomCharacters,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      minimumSize: Size.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(
                          width: 1.0, color: theme.colorScheme.primary),
                    ),
                    child: Text('Random',
                        style: theme.textTheme.titleSmall!.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold)),
                  ),
                  TextButton(
                      onPressed: __resetCharacters,
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Text('Reset',
                          style: theme.textTheme.titleSmall!.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold))),
                ],
              ),
              Text(
                'Total ${_selectedCharacters.length} / ${widget.numberOfCharactersToSelect}',
                style: theme.textTheme.titleSmall!.copyWith(
                    color: _selectedCharacters.length >
                            widget.numberOfCharactersToSelect
                        ? Colors.red.shade600
                        : null),
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          if (!displayCharactersPerTeam) ...[
            const SizedBox(
              height: 6,
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final character in widget.characters)
                  SelectScriptCharacterButton(
                    character: character,
                    isSelected: _getIsCharacterSelected(character),
                    allowMoreThanOne: widget.allowMoreThanOneOfSameCharacter,
                    updateIsSelected: (numberOfTokens) =>
                        _onUpdateIsSelected(character, numberOfTokens),
                  )
              ],
            ),
            const SizedBox(
              height: 12,
            )
          ] else
            for (final item in charactersByTeam.entries)
              if (item.value.isNotEmpty) ...[
                Row(
                  children: [
                    Text(getLabelFromTeam(item.key),
                        style: Theme.of(context).textTheme.titleSmall),
                    const SizedBox(
                      width: 12,
                    ),
                    GameSetupTableItem(
                      text:
                          '${selectedCharactersByTeam[item.key]!.length} / ${widget.gameSetup!.getValueFromTeam(item.key)}',
                      icon: Icon(
                        item.key == Team.townsfolk
                            ? Icons.people
                            : Icons.person,
                        size: _gameSetupIconSize,
                        color: teamsColors[item.key] as Color,
                        semanticLabel:
                            '${selectedCharactersByTeam[item.key]!.length} / ${charactersByTeam[item.key]!.length} ${item.key}',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final character in item.value)
                      SelectScriptCharacterButton(
                        character: character,
                        frequency: selectedCharactersByTeam[item.key]!
                            .where((char) => character.id == char.id)
                            .toList()
                            .length,
                        isSelected: _getIsCharacterSelected(character),
                        allowMoreThanOne:
                            widget.allowMoreThanOneOfSameCharacter,
                        updateIsSelected: (numberOfTokens) =>
                            _onUpdateIsSelected(character, numberOfTokens),
                      )
                  ],
                ),
                const SizedBox(
                  height: 12,
                )
              ],
          const SizedBox(
            height: 8,
          ),
          FormActionBar(
            onSave: () {
              widget.saveCharacters(_selectedCharacters);
              Navigator.pop(context);
            },
            onCancel: () {
              _selectedCharacters = [];
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
