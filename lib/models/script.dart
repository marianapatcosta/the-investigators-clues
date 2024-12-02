import 'package:my_botc_notes/data/characters.dart';
import 'package:my_botc_notes/data/jinxes.dart';
import 'package:my_botc_notes/models/character.dart';
import 'package:my_botc_notes/models/jinx.dart.dart';

const kOfficialAuthor = 'The Pandemonium Institute';

class Script {
  const Script({
    required this.id,
    required this.name,
    required this.content,
    this.author,
    this.version,
    this.score,
    this.almanacUrl,
  });

  final int id;
  final String name;
  final List<dynamic> content;
  final String? author;
  final String? version;
  final int? score;
  final String? almanacUrl;

  bool get isOfficial {
    return author == kOfficialAuthor;
  }

  bool get hasHomebrewCharacters {
    return characters.any((character) => charactersMap[character.id] == null);
  }

  List<Character> get characters {
    final contentFirstItem = content.first;
    final filteredContent = contentFirstItem['id'] == '_meta'
        ? ([...content]..removeAt(0))
        : content;

    return filteredContent.map(
      (character) {
        final charInfo = charactersMap[character['id']];

        if (charInfo == null) {
          if (!hasCharacterAllInfo(character)) {
            throw Error();
          }

          return Character.fromJson(character,
              characterInfoUrl: "$almanacUrl#${character['id']}");
        }

        return Character(
          id: charInfo.id,
          name: charInfo.name,
          team: charInfo.team,
          ability: charInfo.ability,
          setup: charInfo.setup,
          bagDisabled: charInfo.bagDisabled,
          firstNight: charInfo.firstNight ?? 0,
          otherNight: charInfo.otherNight ?? 0,
          firstNightReminder: charInfo.firstNightReminder,
          otherNightReminder: charInfo.otherNightReminder,
          reminders: charInfo.reminders,
          remindersGlobal: charInfo.remindersGlobal,
        );
      },
    ).toList();
  }

  List<String> get charactersIds {
    return characters.map((character) => character.id).toList();
  }

  List<Jinx> get jinxes {
    const defaultJinx = <Map<String, String>>[];

    return characters
        .map((character) {
          final jinxesArray = jinxesMap[character.id]?['jinx'] ?? defaultJinx;
          return Jinx(
            id: character.id,
            jinx: (jinxesArray as List<Map<String, String>>)
                .where(
                  (jinx) => charactersIds.contains(jinx['id']),
                )
                .toList(),
          );
        })
        .where((jinxes) => jinxes.jinx.isNotEmpty)
        .toList();
  }

  bool hasCharacterAllInfo(Map<String, dynamic> characterInfo) {
    const keys = ['id', 'name', 'team', 'ability'];
    return keys.every((key) => characterInfo.containsKey(key));
  }

  Script.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        content = json['content'],
        author = json['author'] as String?,
        version = json['version'] as String?,
        score = json['score'] as int?,
        almanacUrl = json['almanacUrl'] as String?;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'content': content,
      'author': author,
      'version': version,
      'score': score,
      'almanacUrl': almanacUrl
    };
  }
}
