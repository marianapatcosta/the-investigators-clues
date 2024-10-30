# The Investigator's Clues

_The Investigator's Clues_ is an unofficial application to help Blood on the Clocktower's players to track the game status and register the clues they collected.

This is a free and open source multi-platform project developed with Flutter, which supports Android, Web and iOS. <br/>
This application is not affiliated with The Pandemonium Institute.<br/> All roles and characters are the property of Steven Medway and The Pandemonium Institute.

## Features

- Monitoring game status:
  - Add game setup, by registering the script, number of players and their names (optional);
  - Register information about each player (e.g. name, specific notes, are they dead?, do they have ghost vote, hypothetic character);
  - Add/delete travellers and fabled;
  - Track the global number of alive players, ghost votes, number of votes required to successfully execute and number of players per team;
  - Save general notes about the game and write/shhow some token to the other players or Storyteller;
  - Share game setup;
- List of the official and custom scripts available in [BotC Scripts database](https://botc-scripts.azurewebsites.net), with script's characters, night order and jinxes;
- List of all the official characters (townsfolk, outsiders, minion, demo, travellers and fabled), including the experimental ones, with summary and the detailed information about each of them as per [Blood on the Clocktower Wiki](https://wiki.bloodontheclocktower.com).

## Acknowledgments and Copyrights

- [Blood on the Clocktower](https://bloodontheclocktower.com) is a trademark of Steven Medway and The Pandemonium Institute
- Scripts data are obtained from [BotC Scripts database](https://botc-scripts.azurewebsites.net)
- Detailed information about each official character is obtained from [Blood on the Clocktower Wiki](https://wiki.bloodontheclocktower.com).
- Icons were obtained from [Pocket Grimoire](https://www.pocketgrimoire.co.uk/) (source: [Font Awesome](https://fontawesome.com/v5/search))
- Some images were collected from [Clocktower.online](https://www.clocktower.online/)
- Information about night order, reminders and Jinxes was obtained from [Pocket Grimoire](https://www.pocketgrimoire.co.uk/)

## How to Update

### When a new token is released

- Get new token image and save it in the _lib/assets/images/character_tokens_ folder
- Add character info in _lib/assets/data/characters.json_, according to the existing json schema.
- Update jinks in _lib/assets/data/jinx.json_ and night order in _lib/assets/data/night_order.json_ files;

### When an ability is updated

- Find the character info in _lib/assets/data/characters.json_ and update the info.
