import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum MenuItem {
  addPlayer,
  addTraveller,
  addFabled,
  grimoireSettings,
  delete,
}

class GameMenu extends StatelessWidget {
  const GameMenu({
    super.key,
    required this.menuActions,
  });

  final Map<MenuItem, void Function()> menuActions;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return PopupMenuButton<MenuItem>(
      icon: const Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
      onSelected: (item) => menuActions[item]!(),
      offset: const Offset(40, 40),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
        PopupMenuItem<MenuItem>(
          value: MenuItem.addPlayer,
          child: ListTile(
            leading: const Icon(Icons.add),
            title: Text('${t.add} ${t.player}'),
          ),
        ),
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
          value: MenuItem.grimoireSettings,
          child: ListTile(
            leading: const Icon(Icons.settings),
            title: Text(t.grimoireSettings),
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

class NonDismissiblePopupMenuItem<T> extends PopupMenuItem<T> {
  const NonDismissiblePopupMenuItem(
      {super.key,
      super.value,
      super.onTap,
      super.enabled = true,
      super.height = kMinInteractiveDimension,
      super.padding,
      super.textStyle,
      super.labelTextStyle,
      super.mouseCursor,
      super.child});

  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() =>
      _NonDismissiblePopupMenuItem<T, PopupMenuItem<T>>();
}

class _NonDismissiblePopupMenuItem<T, W extends PopupMenuItem<T>>
    extends PopupMenuItemState<T, W> {
  @override
  void handleTap() {
    widget.onTap?.call(); // this override prevents popup menu to close
  }
}
