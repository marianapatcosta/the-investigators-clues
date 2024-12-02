import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/utils.dart';

enum MenuItem {
  addTraveller,
  addFabled,
  showPlayersNotes,
  showVotesNominations,
  delete,
}

class GameMenu extends StatelessWidget {
  const GameMenu({
    super.key,
    required this.menuActions,
    this.showPlayersNotes = false,
    this.showPlayersVotesNominations = false,
  });

  final Map<MenuItem, void Function()> menuActions;
  final bool showPlayersNotes;
  final bool showPlayersVotesNominations;

  void _onSelectMenuItem(MenuItem item, BuildContext context) {
    final t = AppLocalizations.of(context);

    if (item == MenuItem.delete) {
      showDeleteGameDialog(context, t.deleteGameAreYouSure, () {
        menuActions[MenuItem.delete]!();
      });
      return;
    }

    menuActions[item]!();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return PopupMenuButton<MenuItem>(
      icon: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      onSelected: (item) => _onSelectMenuItem(item, context),
      offset: const Offset(40, 40),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
        PopupMenuItem<MenuItem>(
          value: MenuItem.addTraveller,
          child: ListTile(
            leading: const Icon(Icons.person),
            title: Text('${t.add} traveller'),
          ),
        ),
        PopupMenuItem<MenuItem>(
          value: MenuItem.addFabled,
          child: ListTile(
            leading: const Icon(Icons.star_border_purple500),
            title: Text('${t.add} fabled'),
          ),
        ),
        PopupMenuItem<MenuItem>(
          value: MenuItem.showPlayersNotes,
          child: ListTile(
            leading: const Icon(Icons.edit_note),
            title: Text(
                showPlayersNotes ? t.hidePlayersNotes : t.showPlayersNotes),
          ),
        ),
        PopupMenuItem<MenuItem>(
          value: MenuItem.showVotesNominations,
          child: ListTile(
            leading: const Icon(Icons.check_box_outlined),
            title: Text(showPlayersVotesNominations
                ? t.hidePlayersVotesNominations
                : t.showPlayersVotesNominations),
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<MenuItem>(
          value: MenuItem.delete,
          child: ListTile(
            leading: const Icon(Icons.delete_outline),
            title: Text(t.deleteGame.substring(0, t.deleteGame.length - 1)),
          ),
        ),
      ],
    );
  }
}
