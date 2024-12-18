import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_botc_notes/widgets/index.dart'
    show FormActionBar, ModalContentWrapper;

class EditNotes extends StatefulWidget {
  const EditNotes({
    super.key,
    required this.notes,
    required this.saveNotes,
  });

  final String notes;
  final void Function(String) saveNotes;

  @override
  State<EditNotes> createState() {
    return _EditNotesState();
  }
}

class _EditNotesState extends State<EditNotes> {
  late final TextEditingController _notesController;

  void _onSave() {
    widget.saveNotes(_notesController.text);
  }

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController(text: widget.notes);
  }

  @override
  void dispose() {
    super.dispose();
    _notesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return ModalContentWrapper(
        title: t.editGeneralNotes,
        isNotScrollable: false,
        content: Center(
          child: Column(
            children: [
              TextField(
                controller: _notesController,
                maxLength: 100,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(label: Text(t.notes)),
                maxLines: 15,
                onTapOutside: (PointerDownEvent event) {
                  FocusScope.of(context).unfocus();
                },
              ),
              const SizedBox(
                height: 42,
              ),
              FormActionBar(onSave: _onSave),
            ],
          ),
        ));
  }
}
