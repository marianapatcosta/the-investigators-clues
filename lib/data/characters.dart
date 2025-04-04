import 'package:my_botc_notes/models/character.dart';

const charactersJson = [
  {
    "id": "acrobat",
    "name": "Acrobat",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder":
        "The Acrobat chooses a player; add the 'Chosen' reminder to this player.  If they are become drunk or poisoned tonight, the Acrobat player dies.",
    "reminders": ["Chosen", "Dead"],
    "setup": false,
    "ability":
        "Each night*, choose a player: if they are or become drunk or poisoned tonight, you die.",
  },
  {
    "id": "alchemist",
    "name": "Alchemist",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder":
        "Show the Alchemist the 'You are' token and the character token of a Minion",
    "otherNightReminder": "",
    "reminders": [],
    "remindersGlobal": ["Is the Alchemist"],
    "setup": false,
    "ability":
        "You have a Minion ability. When using this, the Storyteller may prompt you to choose differently.",
  },
  {
    "id": "alhadikhia",
    "name": "Al-Hadikhia",
    "edition": "",
    "team": "demon",
    "firstNightReminder": "",
    "otherNightReminder":
        "The Al-Hadikhia chooses 3 players. Announce the first player, wake them to nod yes to live or shake head no to die, kill or resurrect accordingly, then put to sleep and announce the next player. If all 3 are alive after this, all 3 die.",
    "reminders": ["1", "2", "3", "Chose death", "Chose life"],
    "setup": false,
    "ability":
        "Each night*, choose 3 players (all players learn who): each silently chooses to live or die, but if all live, all die.",
  },
  {
    "id": "alsaahir",
    "name": "Alsaahir",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder": "Choose a player, that player dies.",
    "reminders": [],
    "setup": false,
    "ability":
        "Once per day, if you publicly guess which players are Minion(s) and which are Demon(s), good wins.",
  },
  {
    "id": "amnesiac",
    "name": "Amnesiac",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder":
        "Decide the Amnesiac's entire ability. If the Amnesiac's ability causes them to wake tonight: Wake the Amnesiac and run their ability.",
    "otherNightReminder":
        "If the Amnesiac's ability causes them to wake tonight: Wake the Amnesiac and run their ability.",
    "reminders": ["?"],
    "setup": false,
    "ability":
        "You do not know what your ability is. Each day, privately guess what it is: you learn how accurate you are.",
  },
  {
    "id": "angel",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": ["Protect", "Something Bad"],
    "setup": false,
    "name": "Angel",
    "team": "fabled",
    "ability":
        "Something bad might happen to whoever is most responsible for the death of a new player.",
  },
  {
    "id": "apprentice",
    "name": "Apprentice",
    "edition": "bmr",
    "team": "traveller",
    "firstNightReminder":
        "Show the Apprentice the 'You are' card, then a Townsfolk or Minion token. In the Grimoire, replace the Apprentice token with that character token, and put the Apprentice's 'Is the Apprentice' reminder by that character token.",
    "otherNightReminder": "",
    "reminders": ["Is the Apprentice"],
    "setup": false,
    "ability":
        "On your 1st night, you gain a Townsfolk ability (if good), or a Minion ability (if evil).",
  },
  {
    "id": "artist",
    "name": "Artist",
    "edition": "snv",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": ["No ability"],
    "setup": false,
    "ability":
        "Once per game, during the day, privately ask the Storyteller any yes/no question.",
  },
  {
    "id": "assassin",
    "name": "Assassin",
    "edition": "bmr",
    "team": "minion",
    "firstNightReminder": "",
    "otherNightReminder":
        "If the Assassin has not yet used their ability: The Assassin either shows the 'no' head signal, or points to a player. That player dies.",
    "reminders": ["Dead", "No ability"],
    "setup": false,
    "ability":
        "Once per game, at night*, choose a player: they die, even if for some reason they could not.",
  },
  {
    "id": "atheist",
    "name": "Atheist",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": true,
    "ability":
        "The Storyteller can break the game rules & if executed, good wins, even if you are dead. [No evil characters]",
  },
  {
    "id": "balloonist",
    "name": "Balloonist",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder":
        "Choose a character type. Point to a player whose character is of that type. Place the Balloonist's Seen reminder next to that character.",
    "otherNightReminder":
        "Choose a character type that does not yet have a Seen reminder next to a character of that type. Point to a player whose character is of that type, if there are any. Place the Balloonist's Seen reminder next to that character.",
    "reminders": [
      "Seen Townsfolk",
      "Seen Outsider",
      "Seen Minion",
      "Seen Demon",
      "Seen Traveller"
    ],
    "setup": true,
    "ability":
        " Each night, you learn a player of a different character type than last night. [+0 or +1 Outsider]",
  },
  {
    "id": "banshee",
    "name": "Banshee",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder": "Announce that the Banshee has died.",
    "reminders": ["Has Ability"],
    "setup": false,
    "ability":
        "If the Demon kills you, all players learn this. From now on, you may nominate twice per day and vote twice per nomination.",
  },
  {
    "id": "barber",
    "name": "Barber",
    "edition": "snv",
    "team": "outsider",
    "firstNightReminder": "",
    "otherNightReminder":
        "If the Barber died today: Wake the Demon. Show the 'This character selected you' card, then Barber token. The Demon either shows a 'no' head signal, or points to 2 players. If they chose players: Swap the character tokens. Wake each player. Show 'You are', then their new character token.",
    "reminders": ["Haircuts tonight"],
    "setup": false,
    "ability":
        "If you died today or tonight, the Demon may choose 2 players (not another Demon) to swap characters.",
  },
  {
    "id": "barista",
    "name": "Barista",
    "edition": "snv",
    "team": "traveller",
    "firstNightReminder":
        "Choose a player, wake them and tell them which Barista power is affecting them. Treat them accordingly (sober/healthy/true info or activate their ability twice).",
    "otherNightReminder":
        "Choose a player, wake them and tell them which Barista power is affecting them. Treat them accordingly (sober/healthy/true info or activate their ability twice).",
    "reminders": ["Sober & Healthy", "Ability twice"],
    "setup": false,
    "ability":
        "Each night, until dusk, 1) a player becomes sober, healthy and gets true info, or 2) their ability works twice. They learn which.",
  },
  {
    "id": "baron",
    "name": "Baron",
    "edition": "tb",
    "team": "minion",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": true,
    "ability": "There are extra Outsiders in play. [+2 Outsiders]",
  },
  {
    "id": "beggar",
    "name": "Beggar",
    "edition": "tb",
    "team": "traveller",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "You must use a vote token to vote. Dead players may choose to give you theirs. If so, you learn their alignment.",
  },
  {
    "id": "bishop",
    "name": "Bishop",
    "edition": "bmr",
    "team": "traveller",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": ["Nominate good", "Nominate evil"],
    "setup": false,
    "ability":
        "Only the Storyteller can nominate. At least 1 opposite player must be nominated each day.",
  },
  {
    "id": "boffin",
    "name": "Boffin",
    "edition": "",
    "team": "minion",
    "firstNightReminder":
        "Wake the Boffin and how them the token of the ability the Demon has. Put the Boffin back to sleep. Wake the Demon, show the Boffin token, then show the token of the good ability the Demon has.",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "The Demon (even if drunk or poisoned) has a not-in-play good character’s ability. You both know which.",
  },
  {
    "id": "bonecollector",
    "name": "Bone Collector",
    "edition": "snv",
    "team": "traveller",
    "firstNightReminder": "",
    "otherNightReminder":
        "The Bone Collector either shakes their head no or points at any dead player. If they pointed at any dead player, put the Bone Collector's 'Has Ability' reminder by the chosen player's character token. (They may need to be woken tonight to use it.)",
    "reminders": ["No ability", "Has ability"],
    "setup": false,
    "ability":
        "Once per game, at night, choose a dead player: they regain their ability until dusk.",
  },
  {
    "id": "boomdandy",
    "name": "Boomdandy",
    "edition": "",
    "team": "minion",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "If you are executed, all but 3 players die. After a 10 to 1 countdown, the player with the most players pointing at them, dies.",
  },
  {
    "id": "bootlegger",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "name": "Bootlegger",
    "team": "fabled",
    "ability": "This script has homebrew characters or rules.",
  },
  {
    "id": "bountyhunter",
    "name": "Bounty Hunter",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder":
        "Point to 1 evil player. Wake the townsfolk who is evil and show them the 'You are' card and the thumbs down evil sign.",
    "otherNightReminder":
        "If the known evil player has died, point to another evil player. ",
    "remindersFirstNight": ["Known"],
    "reminders": ["Known"],
    "setup": true,
    "ability":
        "You start knowing 1 evil player. If the player you know dies, you learn another evil player tonight. [1 Townsfolk is evil]",
  },
  {
    "id": "buddhist",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "name": "Buddhist",
    "team": "fabled",
    "ability":
        "For the first 2 minutes of each day, veteran players may not talk.",
  },
  {
    "id": "bureaucrat",
    "name": "Bureaucrat",
    "edition": "tb",
    "team": "traveller",
    "firstNightReminder":
        "The Bureaucrat points to a player. Put the Bureaucrat's '3 votes' reminder by the chosen player's character token.",
    "otherNightReminder":
        "The Bureaucrat points to a player. Put the Bureaucrat's '3 votes' reminder by the chosen player's character token.",
    "reminders": ["3 votes"],
    "setup": false,
    "ability":
        "Each night, choose a player (not yourself): their vote counts as 3 votes tomorrow.",
  },
  {
    "id": "butcher",
    "name": "Butcher",
    "edition": "snv",
    "team": "traveller",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability": "Each day, after the 1st execution, you may nominate again.",
  },
  {
    "id": "butler",
    "name": "Butler",
    "edition": "tb",
    "team": "outsider",
    "firstNightReminder":
        "The Butler points to a player. Mark that player as 'Master'.",
    "otherNightReminder":
        "The Butler points to a player. Mark that player as 'Master'.",
    "remindersFirstNight": ["Master"],
    "reminders": ["Master"],
    "setup": false,
    "ability":
        "Each night, choose a player (not yourself): tomorrow, you may only vote if they are voting too.",
  },
  {
    "id": "cannibal",
    "name": "Cannibal",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder":
        " If a player was executed today and their ability would cause them to wake tonight: Wake the Cannibal and run their ability",
    "reminders": ["Poisoned", "Died today"],
    "setup": false,
    "ability":
        "You have the ability of the recently killed executee. If they are evil, you are poisoned until a good player dies by execution.",
  },
  {
    "id": "cerenovus",
    "name": "Cerenovus",
    "edition": "snv",
    "team": "minion",
    "firstNightReminder":
        "The Cerenovus points to a player, then to a character on their sheet. Wake that player. Show the 'This character selected you' card, then the Cerenovus token. Show the selected character token. If the player is not mad about being that character tomorrow, they can be executed.",
    "otherNightReminder":
        "The Cerenovus points to a player, then to a character on their sheet. Wake that player. Show the 'This character selected you' card, then the Cerenovus token. Show the selected character token. If the player is not mad about being that character tomorrow, they can be executed.",
    "reminders": ["Mad"],
    "remindersFirstNight": ["Mad"],
    "setup": false,
    "ability":
        "Each night, choose a player & a good character: they are \"mad\" they are this character tomorrow, or might be executed.",
  },
  {
    "id": "chambermaid",
    "name": "Chambermaid",
    "edition": "bmr",
    "team": "townsfolk",
    "firstNightReminder":
        "The Chambermaid points to two players. Show the number signal (0, 1, 2, …) for how many of those players wake tonight for their ability.",
    "otherNightReminder":
        "The Chambermaid points to two players. Show the number signal (0, 1, 2, …) for how many of those players wake tonight for their ability.",
    "reminders": [],
    "setup": false,
    "ability":
        "Each night, choose 2 alive players (not yourself): you learn how many woke tonight due to their ability.",
  },
  {
    "id": "chef",
    "name": "Chef",
    "edition": "tb",
    "team": "townsfolk",
    "firstNightReminder":
        "Show the finger signal (0, 1, 2, …) for the number of pairs of neighbouring evil players.",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability": "You start knowing how many pairs of evil players there are.",
  },
  {
    "id": "choirboy",
    "name": "Choirboy",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder":
        "If the King was killed by the Demon, wake the Choirboy and point to the Demon player.",
    "reminders": [],
    "setup": true,
    "ability":
        "If the Demon kills the King, you learn which player is the Demon. [+ the King]",
  },
  {
    "id": "clockmaker",
    "name": "Clockmaker",
    "edition": "snv",
    "team": "townsfolk",
    "firstNightReminder":
        "Show the hand signal for the number (1, 2, 3, etc.) of places from Demon to closest Minion.",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "You start knowing how many steps from the Demon to its nearest Minion.",
  },
  {
    "id": "courtier",
    "name": "Courtier",
    "edition": "bmr",
    "team": "townsfolk",
    "firstNightReminder":
        "The Courtier either shows a 'no' head signal, or points to a character on the sheet. If the Courtier used their ability: If that character is in play, that player is drunk.",
    "otherNightReminder":
        "Reduce the remaining number of days the marked player is poisoned. If the Courtier has not yet used their ability: The Courtier either shows a 'no' head signal, or points to a character on the sheet. If the Courtier used their ability: If that character is in play, that player is drunk.",
    "reminders": ["Drunk 3", "Drunk 2", "Drunk 1", "No ability"],
    "setup": false,
    "ability":
        "Once per game, at night, choose a character: they are drunk for 3 nights & 3 days.",
  },
  {
    "id": "cultleader",
    "name": "Cult Leader",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder":
        "If the cult leader changed alignment, show them the thumbs up good signal of the thumbs down evil signal accordingly.",
    "otherNightReminder":
        "If the cult leader changed alignment, show them the thumbs up good signal of the thumbs down evil signal accordingly.",
    "reminders": [],
    "setup": false,
    "ability":
        "Each night, you become the alignment of an alive neighbour. If all good players choose to join your cult, your team wins.",
  },
  {
    "id": "damsel",
    "name": "Damsel",
    "edition": "",
    "team": "outsider",
    "firstNightReminder":
        "Wake all the Minions, show them the 'This character selected you' card and the Damsel token.",
    "otherNightReminder":
        "If selected by the Huntsman, wake the Damsel, show 'You are' card and a not-in-play Townsfolk token.",
    "reminders": ["Guess used"],
    "setup": false,
    "ability":
        "All Minions know you are in play. If a Minion publicly guesses you (once), your team loses.",
  },
  {
    "id": "deviant",
    "name": "Deviant",
    "edition": "snv",
    "team": "traveller",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability": "If you were funny today, you cannot die by exile.",
  },
  {
    "id": "devilsadvocate",
    "name": "Devil's Advocate",
    "edition": "bmr",
    "team": "minion",
    "firstNightReminder":
        "The Devil's Advocate points to a living player. That player survives execution tomorrow.",
    "otherNightReminder":
        "The Devil's Advocate points to a living player, different from the previous night. That player survives execution tomorrow.",
    "reminders": ["Survives execution"],
    "remindersFirstNight": ["Survives execution"],
    "setup": false,
    "ability":
        "Each night, choose a living player (different to last night): if executed tomorrow, they don't die.",
  },
  {
    "id": "djinn",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "name": "Djinn",
    "team": "fabled",
    "ability": "Use the Djinn's special rule. All players know what it is.",
  },
  {
    "id": "doomsayer",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "name": "Doomsayer",
    "team": "fabled",
    "ability":
        "If 4 or more players live, each living player may publicly choose (once per game) that a player of their own alignment dies.",
  },
  {
    "id": "dreamer",
    "name": "Dreamer",
    "edition": "snv",
    "team": "townsfolk",
    "firstNightReminder":
        "The Dreamer points to a player. Show 1 good and 1 evil character token; one of these is correct.",
    "otherNightReminder":
        "The Dreamer points to a player. Show 1 good and 1 evil character token; one of these is correct.",
    "reminders": [],
    "setup": false,
    "ability":
        "Each night, choose a player (not yourself or Travellers): you learn 1 good and 1 evil character, 1 of which is correct.",
  },
  {
    "id": "drunk",
    "name": "Drunk",
    "edition": "tb",
    "team": "outsider",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "remindersGlobal": ["Is The Drunk"],
    "special": [
      {"type": "selection", "name": "bag-disabled"}
    ],
    "bagDisabled": true,
    "setup": true,
    "ability":
        "You do not know you are the Drunk. You think you are a Townsfolk character, but you are not.",
  },
  {
    "id": "duchess",
    "firstNightReminder": "",
    "otherNightReminder":
        "Wake each player marked \"Visitor\" or \"False Info\" one at a time. Show them the Duchess token, then fingers (1, 2, 3) equaling the number of evil players marked \"Visitor\" or, if you are waking the player marked \"False Info,\" show them any number of fingers except the number of evil players marked \"Visitor.\"",
    "reminders": ["Visitor", "False Info"],
    "setup": false,
    "name": "Duchess",
    "team": "fabled",
    "ability":
        "Each day, 3 players may choose to visit you. At night*, each visitor learns how many visitors are evil, but 1 gets false info.",
  },
  {
    "id": "empath",
    "name": "Empath",
    "edition": "tb",
    "team": "townsfolk",
    "firstNightReminder":
        "Show the finger signal (0, 1, 2) for the number of evil alive neighbours of the Empath.",
    "otherNightReminder":
        "Show the finger signal (0, 1, 2) for the number of evil neighbours.",
    "reminders": [],
    "setup": false,
    "ability":
        "Each night, you learn how many of your 2 alive neighbours are evil.",
  },
  {
    "id": "engineer",
    "name": "Engineer",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder":
        "The Engineer shows a 'no' head signal, or points to a Demon or points to the relevant number of Minions. If the Engineer chose characters, replace the Demon or Minions with the choices, then wake the relevant players and show them the You are card and the relevant character tokens.",
    "otherNightReminder":
        "The Engineer shows a 'no' head signal, or points to a Demon or points to the relevant number of Minions. If the Engineer chose characters, replace the Demon or Minions with the choices, then wake the relevant players and show them the 'You are' card and the relevant character tokens.",
    "reminders": ["No ability"],
    "setup": false,
    "ability":
        "Once per game, at night, choose which Minions or which Demon is in play.",
  },
  {
    "id": "eviltwin",
    "name": "Evil Twin",
    "edition": "snv",
    "team": "minion",
    "firstNightReminder":
        "Wake the Evil Twin and their twin. Confirm that they have acknowledged each other. Point to the Evil Twin. Show their Evil Twin token to the twin player. Point to the twin. Show their character token to the Evil Twin player.",
    "otherNightReminder": "",
    "reminders": ["Twin"],
    "remindersFirstNight": ["Twin"],
    "setup": false,
    "ability":
        "You & an opposing player know each other. If the good player is executed, evil wins. Good can't win if you both live.",
  },
  {
    "id": "exorcist",
    "name": "Exorcist",
    "edition": "bmr",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder":
        "The Exorcist points to a player, different from the previous night. If that player is the Demon: Wake the Demon. Show the Exorcist token. Point to the Exorcist. The Demon does not act tonight.",
    "reminders": ["Chosen"],
    "setup": false,
    "ability":
        "Each night*, choose a player (different to last night): the Demon, if chosen, learns who you are then doesn't wake tonight.",
  },
  {
    "id": "fanggu",
    "name": "Fang Gu",
    "edition": "snv",
    "team": "demon",
    "firstNightReminder": "",
    "otherNightReminder":
        "The Fang Gu points to a player. That player dies. Or, if that player was an Outsider and there are no other Fang Gu in play: The Fang Gu dies instead of the chosen player. The chosen player is now an evil Fang Gu. Wake the new Fang Gu. Show the 'You are' card, then the Fang Gu token. Show the 'You are' card, then the thumb-down 'evil' hand sign.",
    "reminders": ["Dead", "Once"],
    "setup": true,
    "ability":
        "Each night*, choose a player: they die. The 1st Outsider this kills becomes an evil Fang Gu & you die instead. [+1 Outsider]",
  },
  {
    "id": "farmer",
    "name": "Farmer",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder":
        "If a Farmer died tonight, choose another good player and make them the Farmer. Wake this player, show them the 'You are' card and the Farmer character token.",
    "reminders": [],
    "setup": false,
    "ability": "If you die at night, an alive good player becomes a Farmer.",
  },
  {
    "id": "fearmonger",
    "name": "Fearmonger",
    "edition": "",
    "team": "minion",
    "firstNightReminder":
        "The Fearmonger points to a player. Place the Fear token next to that player and announce that a new player has been selected with the Fearmonger ability.",
    "otherNightReminder":
        "The Fearmonger points to a player. If different from the previous night, place the Fear token next to that player and announce that a new player has been selected with the Fearmonger ability.",
    "reminders": ["Fear"],
    "remindersFirstNight": ["Fear"],
    "setup": false,
    "ability":
        "Each night, choose a player. If you nominate and execute them, their team loses. All players know if you choose a new player.",
  },
  {
    "id": "ferryman",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "name": "Ferryman",
    "team": "fabled",
    "ability": "On the final day, all dead players regain their vote token.",
  },
  {
    "id": "fibbin",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": ["Used"],
    "setup": false,
    "name": "Fibbin",
    "team": "fabled",
    "ability": "Once per game, 1 good player might get false information.",
  },
  {
    "id": "fiddler",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "name": "Fiddler",
    "team": "fabled",
    "ability":
        "Once per game, the Demon secretly chooses an opposing player: all players choose which of these 2 players win.",
  },
  {
    "id": "fisherman",
    "name": "Fisherman",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": ["No ability"],
    "setup": false,
    "ability":
        "Once per game, during the day, visit the Storyteller for some advice to help you win.",
  },
  {
    "id": "flowergirl",
    "name": "Flowergirl",
    "edition": "snv",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder":
        "Nod 'yes' or shake head 'no' for whether the Demon voted today. Place the 'Demon not voted' reminder (remove 'Demon voted', if any).",
    "reminders": ["Demon voted", "Demon not voted"],
    "setup": false,
    "ability": "Each night*, you learn if a Demon voted today.",
  },
  {
    "id": "fool",
    "name": "Fool",
    "edition": "bmr",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": ["No ability"],
    "setup": false,
    "ability": "The first time you die, you don't.",
  },
  {
    "id": "fortuneteller",
    "name": "Fortune Teller",
    "edition": "tb",
    "team": "townsfolk",
    "firstNightReminder":
        "The Fortune Teller points to two players. Give the head signal (nod yes, shake no) for whether one of those players is the Demon. ",
    "otherNightReminder":
        "The Fortune Teller points to two players. Show the head signal (nod 'yes', shake 'no') for whether one of those players is the Demon.",
    "remindersFirstNight": ["Red herring"],
    "reminders": ["Red herring"],
    "setup": false,
    "ability":
        "Each night, choose 2 players: you learn if either is a Demon. There is a good player that registers as a Demon to you.",
  },
  {
    "id": "gambler",
    "name": "Gambler",
    "edition": "bmr",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder":
        "The Gambler points to a player, and a character on their sheet. If incorrect, the Gambler dies.",
    "reminders": ["Dead"],
    "setup": false,
    "ability":
        "Each night*, choose a player & guess their character: if you guess wrong, you die.",
  },
  {
    "id": "gangster",
    "name": "Gangster",
    "edition": "",
    "team": "traveller",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "Once per day, you may choose to kill an alive neighbour, if your other alive neighbour agrees.",
  },
  {
    "id": "gardener",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "name": "Gardener",
    "team": "fabled",
    "ability": "The Storyteller assigns 1 or more players' characters.",
  },
  {
    "id": "general",
    "name": "General",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder":
        "Show the General thumbs up for good winning, thumbs down for evil winning or thumb to the side for neither.",
    "otherNightReminder":
        "Show the General thumbs up for good winning, thumbs down for evil winning or thumb to the side for neither.",
    "reminders": [],
    "setup": false,
    "ability":
        "Each night, you learn which alignment the Storyteller believes is winning: good, evil, or neither.",
  },
  {
    "id": "gnome",
    "name": "Gnome",
    "edition": "",
    "team": "traveller",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "All players start knowing a player of your alignment. You may choose to kill anyone who nominates them.",
  },
  {
    "id": "goblin",
    "name": "Goblin",
    "edition": "",
    "team": "minion",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": ["Claimed"],
    "setup": false,
    "ability":
        "If you publicly claim to be the Goblin when nominated & are executed that day, your team wins.",
  },
  {
    "id": "godfather",
    "name": "Godfather",
    "edition": "bmr",
    "team": "minion",
    "firstNightReminder": "Show each of the Outsider tokens in play.",
    "otherNightReminder":
        "If an Outsider died today: The Godfather points to a player. That player dies.",
    "reminders": ["Died today", "Dead"],
    "setup": true,
    "ability":
        "You start knowing which Outsiders are in play. If 1 died today, choose a player tonight: they die. [−1 or +1 Outsider]",
  },
  {
    "id": "golem",
    "name": "Golem",
    "edition": "",
    "team": "outsider",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": ["Can not nominate"],
    "setup": false,
    "ability":
        "You may only nominate once per game. When you do, if the nominee is not the Demon, they die.",
  },
  {
    "id": "goon",
    "name": "Goon",
    "edition": "bmr",
    "team": "outsider",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": ["Drunk"],
    "setup": false,
    "ability":
        "Each night, the 1st player to choose you with their ability is drunk until dusk. You become their alignment.",
  },
  {
    "id": "gossip",
    "name": "Gossip",
    "edition": "bmr",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder":
        "If the Gossip's public statement was true: Choose a player not protected from dying tonight. That player dies.",
    "reminders": ["Dead"],
    "setup": false,
    "ability":
        "Each day, you may make a public statement. Tonight, if it was true, a player dies.",
  },
  {
    "id": "grandmother",
    "name": "Grandmother",
    "edition": "bmr",
    "team": "townsfolk",
    "firstNightReminder":
        "Show the marked character token. Point to the marked player.",
    "otherNightReminder":
        "If the Grandmother's grandchild was killed by the Demon tonight: The Grandmother dies.",
    "reminders": ["Grandchild"],
    "remindersFirstNight": ["Grandchild"],
    "setup": false,
    "ability":
        "You start knowing a good player & their character. If the Demon kills them, you die too.",
  },
  {
    "id": "gunslinger",
    "name": "Gunslinger",
    "edition": "tb",
    "team": "traveller",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "Each day, after the 1st vote has been tallied, you may choose a player that voted: they die.",
  },
  {
    "id": "harlot",
    "name": "Harlot",
    "edition": "snv",
    "team": "traveller",
    "firstNightReminder": "",
    "otherNightReminder":
        "The Harlot points at any player. Then, put the Harlot to sleep. Wake the chosen player, show them the 'This character selected you' token, then the Harlot token. That player either nods their head yes or shakes their head no. If they nodded their head yes, wake the Harlot and show them the chosen player's character token. Then, you may decide that both players die.",
    "reminders": ["Dead"],
    "setup": false,
    "ability":
        "Each night*, choose a living player: if they agree, you learn their character, but you both might die.",
  },
  {
    "id": "harpy",
    "name": "Harpy",
    "edition": "",
    "team": "minion",
    "firstNightReminder":
        "Wake the Harpy; they point at one player, then another. Wake the 1st player the Harpy pointed to, show them the 'This character has selected you' card, show them the Harpy token, then point at the 2nd player the Harpy pointed to.",
    "otherNightReminder":
        "Wake the Harpy; they point at one player, then another. Wake the 1st player the Harpy pointed to, show them the 'This character has selected you' card, show them the Harpy token, then point at the 2nd player the Harpy pointed to.",
    "reminders": ["Mad", "2nd"],
    "remindersFirstNight": ["Mad", "2nd"],
    "setup": false,
    "ability":
        "Each night, choose 2 players: tomorrow, the 1st player is mad that the 2nd is evil, or one or both might die.",
  },
  {
    "id": "hatter",
    "name": "Hatter",
    "edition": "",
    "team": "outsider",
    "firstNightReminder": "",
    "otherNightReminder":
        "If the Hatter died today: Wake the Minions and Demon. Show them the 'This Character Selected You' info token, then the Hatter token. Each player either shakes their head no or points to another character of the same type as their current character.  If a second player would end up with the same character as another player, shake your head no and gesture for them to choose again. Put them to sleep. Change each player to the character they chose.",
    "reminders": ["Tea Party Tonight"],
    "setup": false,
    "ability":
        "If you died today or tonight, the Minion & Demon players may choose new Minion & Demon characters to be.",
  },
  {
    "id": "hellslibrarian",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": ["Something Bad"],
    "setup": false,
    "name": "Hell's Librarian",
    "team": "fabled",
    "ability":
        "Something bad might happen to whoever talks when the Storyteller has asked for silence.",
  },
  {
    "id": "heretic",
    "name": "Heretic",
    "edition": "",
    "team": "outsider",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "Whoever wins, loses & whoever loses, wins, even if you are dead.",
  },
  {
    "id": "highpriestess",
    "name": "High Priestess",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder": "Point to a player.",
    "otherNightReminder": "Point to a player.",
    "reminders": [],
    "setup": false,
    "ability":
        "Each night, learn which player the Storyteller believes you should talk to most.",
  },
  {
    "id": "huntsman",
    "name": "Huntsman",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder":
        "The Huntsman shakes their head 'no' or points to a player. If they point to the Damsel, wake that player, show the 'You are' card and a not-in-play character token.",
    "otherNightReminder":
        "The Huntsman shakes their head 'no' or points to a player. If they point to the Damsel, wake that player, show the 'You are' card and a not-in-play character token.",
    "reminders": ["No ability"],
    "setup": true,
    "ability":
        "Once per game, at night, choose a living player: the Damsel, if chosen, becomes a not-in-play Townsfolk. [+the Damsel]",
  },
  {
    "id": "imp",
    "name": "Imp",
    "edition": "tb",
    "team": "demon",
    "firstNightReminder": "",
    "otherNightReminder":
        "The Imp points to a player. That player dies. If the Imp chose themselves: Replace the character of 1 alive minion with a spare Imp token. Show the 'You are' card, then the Imp token.",
    "reminders": ["Dead"],
    "setup": false,
    "ability":
        "Each night*, choose a player: they die. If you kill yourself this way, a Minion becomes the Imp.",
  },
  {
    "id": "innkeeper",
    "name": "Innkeeper",
    "edition": "bmr",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder":
        "The previously protected and drunk players lose those reminders. The Innkeeper points to two players. Those players are protected. One is drunk.",
    "reminders": ["Protected", "Drunk"],
    "setup": false,
    "ability":
        "Each night*, choose 2 players: they can't die tonight, but 1 is drunk until dusk.",
  },
  {
    "id": "investigator",
    "name": "Investigator",
    "edition": "tb",
    "team": "townsfolk",
    "firstNightReminder":
        "Show the character token of a Minion in play. Point to two players, one of which is that character.",
    "otherNightReminder": "",
    "remindersFirstNight": ["Minion", "Wrong"],
    "reminders": ["Minion", "Wrong"],
    "setup": false,
    "ability": "You start knowing that 1 of 2 players is a particular Minion.",
  },
  {
    "id": "judge",
    "name": "Judge",
    "edition": "bmr",
    "team": "traveller",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": ["No ability"],
    "setup": false,
    "ability":
        "Once per game, if another player nominated, you may choose to force the current execution to pass or fail.",
  },
  {
    "id": "juggler",
    "name": "Juggler",
    "edition": "snv",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder":
        "If today was the Juggler's first day: Show the hand signal for the number (0, 1, 2, etc.) of 'Correct' reminders. Remove reminders.",
    "reminders": ["Correct"],
    "setup": false,
    "ability":
        "On your 1st day, publicly guess up to 5 players' characters. That night, you learn how many you got correct.",
  },
  {
    "id": "kazali",
    "name": "Kazali",
    "team": "demon",
    "firstNightReminder":
        "The Kazali points at a player and a Minion on the character sheet. Replace their old character token with the Minion token, show them the “You Are” info token then the Minion character token, and give a thumbs down. Repeat until the normal number of Minions exist. Put the Kazali to sleep.",
    "otherNightReminder": "The Kazali points to a player. That player dies.",
    "reminders": ["Dead"],
    "setup": true,
    "ability":
        "Each night*, choose a player: they die. [You choose which players are Minions. -? to +? Outsiders]",
  },
  {
    "id": "king",
    "name": "King",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder":
        "Wake the Demon, show them the 'This character selected you' card, show the King token and point to the King player.",
    "otherNightReminder":
        "If there are more dead than living, show the King a character token of a living player.",
    "reminders": [],
    "setup": false,
    "ability":
        "Each night, if the dead equal or outnumber the living, you learn 1 alive character. The Demon knows who you are.",
  },
  {
    "id": "klutz",
    "name": "Klutz",
    "edition": "snv",
    "team": "outsider",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "When you learn that you died, publicly choose 1 alive player: if they are evil, your team loses.",
  },
  {
    "id": "knight",
    "name": "Knight",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder": "Point to 2 non-Demon players.",
    "otherNightReminder": "",
    "reminders": ["Know", "Know"],
    "remindersFirstNight": ["Know", "Know"],
    "setup": false,
    "ability": "You start knowing 2 players that are not the Demon.",
  },
  {
    "id": "legion",
    "name": "Legion",
    "edition": "",
    "team": "demon",
    "firstNightReminder": "",
    "otherNightReminder": "Choose a player, that player dies.",
    "reminders": ["Dead", "About to die"],
    "setup": true,
    "ability":
        "Each night*, a player might die. Executions fail if only evil voted. You register as a Minion too. [Most players are Legion]",
  },
  {
    "id": "leviathan",
    "name": "Leviathan",
    "edition": "",
    "team": "demon",
    "firstNightReminder":
        "Place the Leviathan 'Day 1' reminder. Announce 'The Leviathan is in play; this is Day 1.'",
    "otherNightReminder": "Change the Leviathan Day reminder for the next day.",
    "reminders": [
      "Day 1",
      "Day 2",
      "Day 3",
      "Day 4",
      "Day 5",
      "Good player executed"
    ],
    "remindersFirstNight": ["Day 1"],
    "setup": false,
    "ability":
        "If more than 1 good player is executed, you win. All players know you are in play. After day 5, evil wins.",
  },
  {
    "id": "librarian",
    "name": "Librarian",
    "edition": "tb",
    "team": "townsfolk",
    "firstNightReminder":
        "Show the character token of an Outsider in play. Point to two players, one of which is that character.",
    "otherNightReminder": "",
    "remindersFirstNight": ["Outsider", "Wrong"],
    "reminders": ["Outsider", "Wrong"],
    "setup": false,
    "ability":
        "You start knowing that 1 of 2 players is a particular Outsider. (Or that zero are in play.)",
  },
  {
    "id": "lilmonsta",
    "name": "Lil' Monsta",
    "edition": "",
    "team": "demon",
    "firstNightReminder":
        "Wake all Minions together, allow them to vote by pointing at who they want to babysit Lil' Monsta.",
    "otherNightReminder":
        "Wake all Minions together, allow them to vote by pointing at who they want to babysit Lil' Monsta. Each night*, a player might die.",
    "reminders": [],
    "remindersGlobal": ["Is the Demon", "Dead"],
    "special": [
      {"type": "selection", "name": "bag-disabled"}
    ],
    "setup": true,
    "bagDisabled": true,
    "ability":
        "Each night, Minions choose who babysits Lil' Monsta & \"is the Demon\". A player dies each night*. [+1 Minion]",
  },
  {
    "id": "lleech",
    "name": "Lleech",
    "edition": "",
    "team": "demon",
    "firstNightReminder":
        "The Lleech points to a player. Place the Poisoned reminder token.",
    "otherNightReminder": "The Lleech points to a player. That player dies.",
    "reminders": ["Dead", "Poisoned"],
    "remindersFirstNight": ["Poisoned"],
    "setup": false,
    "ability":
        "Each night*, choose a player: they die. You start by choosing a player: they are poisoned - you die if & only if they die.",
  },
  {
    "id": "lordoftyphon",
    "name": "Lord of Typhon",
    "edition": "",
    "team": "demon",
    "firstNightReminder":
        "Wake the players on either side of the Demon. Show them the 'You Are' card, the token of the Minion they now are, and a thumbs down to indicate they are evil.",
    "otherNightReminder":
        "The Lord of Typhon points to a player. That player dies.",
    "reminders": ["Dead"],
    "setup": true,
    "ability":
        "Each night*, choose a player: they die. [Evil characters are in a line. You are in the middle. +1 Minion. -? To +? Outsiders]",
  },
  {
    "id": "lunatic",
    "name": "Lunatic",
    "edition": "bmr",
    "team": "outsider",
    "firstNightReminder":
        "If 7 or more players: Show the Lunatic a number of arbitrary 'Minions', players equal to the number of Minions in play. Show 3 character tokens of arbitrary good characters. If the token received by the Lunatic is a Demon that would wake tonight: Allow the Lunatic to do the Demon actions. Place their 'attack' reminders. Wake the Demon. Show the Demon's real character token. Show them the Lunatic player. If the Lunatic attacked players: Show the real demon each marked player. Remove any Lunatic 'attack' reminders.",
    "otherNightReminder":
        "Allow the Lunatic to do the actions of the Demon. Place their 'attack' reminders. If the Lunatic selected players: Wake the Demon. Show the 'attack' reminder, then point to each marked player. Remove any Lunatic 'attack' reminders.",
    "reminders": ["Attack 1", "Attack 2", "Attack 3"],
    "setup": false,
    "ability":
        "You think you are a Demon, but you are not. The Demon knows who you are & who you choose at night.",
  },
  {
    "id": "lycanthrope",
    "name": "Lycanthrope",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder":
        "The Lycanthrope points to a living player: if good, they die and no one else can die tonight.",
    "reminders": ["Dead"],
    "setup": false,
    "ability":
        "Each night*, choose an alive player. If good, they die & the Demon doesn’t kill tonight. One good player registers as evil.",
  },
  {
    "id": "magician",
    "name": "Magician",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "The Demon thinks you are a Minion. Minions think you are a Demon.",
  },
  {
    "id": "marionette",
    "name": "Marionette",
    "edition": "",
    "team": "minion",
    "firstNightReminder":
        "Select one of the good players next to the Demon and place the Is the Marionette reminder token. Wake the Demon and show them the Marionette.",
    "otherNightReminder": "",
    "reminders": [],
    "remindersGlobal": ["Is the Marionette"],
    "special": [
      {"type": "selection", "name": "bag-disabled"}
    ],
    "bagDisabled": true,
    "setup": true,
    "ability":
        "You think you are a good character but you are not. The Demon knows who you are. [You neighbour the Demon]",
  },
  {
    "id": "mastermind",
    "name": "Mastermind",
    "edition": "bmr",
    "team": "minion",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "If the Demon dies by execution (ending the game), play for 1 more day. If a player is then executed, their team loses.",
  },
  {
    "id": "mathematician",
    "name": "Mathematician",
    "edition": "snv",
    "team": "townsfolk",
    "firstNightReminder":
        "Show the hand signal for the number (0, 1, 2, etc.) of players whose ability malfunctioned due to other abilities.",
    "otherNightReminder":
        "Show the hand signal for the number (0, 1, 2, etc.) of players whose ability malfunctioned due to other abilities.",
    "reminders": ["Abnormal"],
    "setup": false,
    "ability":
        "Each night, you learn how many players' abilities worked abnormally (since dawn) due to another character's ability.",
  },
  {
    "id": "matron",
    "name": "Matron",
    "edition": "bmr",
    "team": "traveller",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "Each day, you may choose up to 3 sets of 2 players to swap seats. Players may not leave their seats to talk in private.",
  },
  {
    "id": "mayor",
    "name": "Mayor",
    "edition": "tb",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "If only 3 players live & no execution occurs, your team wins. If you die at night, another player might die instead.",
  },
  {
    "id": "mezepheles",
    "name": "Mezepheles",
    "edition": "",
    "team": "minion",
    "firstNightReminder": "Show the Mezepheles their secret word.",
    "otherNightReminder":
        "Wake the 1st good player that said the Mezepheles' secret word and show them the 'You are' card and the thumbs down evil signal.",
    "reminders": ["Turns evil", "No ability"],
    "setup": false,
    "ability":
        "You start knowing a secret word. The 1st good player to say this word becomes evil that night.",
  },
  {
    "id": "minstrel",
    "name": "Minstrel",
    "edition": "bmr",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": ["Everyone drunk"],
    "setup": false,
    "ability":
        "When a Minion dies by execution, all other players (except Travellers) are drunk until dusk tomorrow.",
  },
  {
    "id": "monk",
    "name": "Monk",
    "edition": "tb",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder":
        "The previously protected player is no longer protected. The Monk points to a player not themself. Mark that player 'Protected'.",
    "reminders": ["Protected"],
    "setup": false,
    "ability":
        "Each night*, choose a player (not yourself): they are safe from the Demon tonight.",
  },
  {
    "id": "moonchild",
    "name": "Moonchild",
    "edition": "bmr",
    "team": "outsider",
    "firstNightReminder": "",
    "otherNightReminder":
        "If the Moonchild used their ability to target a player today: If that player is good, they die.",
    "reminders": ["Dead"],
    "setup": false,
    "ability":
        "When you learn that you died, publicly choose 1 alive player. Tonight, if it was a good player, they die.",
  },
  {
    "id": "mutant",
    "name": "Mutant",
    "edition": "snv",
    "team": "outsider",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "If you are \"mad\" about being an Outsider, you might be executed.",
  },
  {
    "id": "nightwatchman",
    "name": "Nightwatchman",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder":
        "The Nightwatchman may point to a player. Wake that player, show the 'This character selected you' card and the Nightwatchman token, then point to the Nightwatchman player.",
    "otherNightReminder":
        "The Nightwatchman may point to a player. Wake that player, show the 'This character selected you' card and the Nightwatchman token, then point to the Nightwatchman player.",
    "reminders": ["No ability"],
    "setup": false,
    "ability":
        "Once per game, at night, choose a player: they learn who you are.",
  },
  {
    "id": "noble",
    "name": "Noble",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder":
        "Point to 3 players including one evil player, in no particular order.",
    "otherNightReminder": "",
    "reminders": ["Seen"],
    "remindersFirstNight": ["Seen", "Seen", "Seen"],
    "setup": false,
    "ability": "You start knowing 3 players, 1 and only 1 of which is evil.",
  },
  {
    "id": "nodashii",
    "name": "No Dashii",
    "edition": "snv",
    "team": "demon",
    "firstNightReminder": "",
    "otherNightReminder": "The No Dashii points to a player. That player dies.",
    "reminders": ["Dead", "Poisoned"],
    "remindersFirstNight": ["Poisoned", "Poisoned"],
    "setup": false,
    "ability":
        "Each night*, choose a player: they die. Your 2 Townsfolk neighbours are poisoned.",
  },
  {
    "id": "ogre",
    "name": "Ogre",
    "edition": "",
    "team": "outsider",
    "firstNightReminder":
        "The Ogre points to a player (not themselves) and becomes their alignment.",
    "otherNightReminder": "",
    "reminders": ["Friend"],
    "remindersFirstNight": ["Friend"],
    "setup": false,
    "ability":
        "On your 1st night, choose a player (not yourself): you become their alignment (you don't know which) even if drunk or poisoned.",
  },
  {
    "id": "ojo",
    "name": "Ojo",
    "edition": "",
    "team": "demon",
    "firstNightReminder": "",
    "otherNightReminder":
        "The Ojo points to a character on the sheet; if in play, that player dies. If it is not in play, the Storyteller chooses who dies instead.",
    "reminders": ["Dead"],
    "setup": false,
    "ability":
        "Each night*, choose a character: they die. If they are not in play, the Storyteller chooses who dies.",
  },
  {
    "id": "oracle",
    "name": "Oracle",
    "edition": "snv",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder":
        "Show the hand signal for the number (0, 1, 2, etc.) of dead evil players.",
    "reminders": [],
    "setup": false,
    "ability": "Each night*, you learn how many dead players are evil.",
  },
  {
    "id": "organgrinder",
    "name": "Organ Grinder",
    "edition": "",
    "team": "minion",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": ["About to die"],
    "setup": false,
    "ability":
        "All players keep their eyes closed when voting and the vote tally is secret. Each night, choose if you are drunk until dusk.",
  },
  {
    "id": "pacifist",
    "name": "Pacifist",
    "edition": "bmr",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability": "Executed good players might not die.",
  },
  {
    "id": "philosopher",
    "name": "Philosopher",
    "edition": "snv",
    "team": "townsfolk",
    "firstNightReminder":
        "The Philosopher either shows a 'no' head signal, or points to a good character on their sheet. If they chose a character: Swap the out-of-play character token with the Philosopher token. Or, if the character is in play, place the drunk reminder by that player and the Not the Philosopher token by the Philosopher.",
    "otherNightReminder":
        "If the Philosopher has not used their ability: the Philosopher either shows a 'no' head signal, or points to a good character on their sheet. If they chose a character: Swap the out-of-play character token with the Philosopher token. Or, if the character is in play, place the drunk reminder by that player and the Not the Philosopher token by the Philosopher.",
    "reminders": ["Drunk", "Is the Philosopher"],
    "setup": false,
    "ability":
        "Once per game, at night, choose a good character: gain that ability. If this character is in play, they are drunk.",
  },
  {
    "id": "pithag",
    "name": "Pit-Hag",
    "edition": "snv",
    "team": "minion",
    "firstNightReminder": "",
    "otherNightReminder":
        "The Pit-Hag points to a player and a character on the sheet. If this character is not in play, wake that player and show them the 'You are' card and the relevant character token. If the character is in play, nothing happens.",
    "reminders": [],
    "setup": false,
    "ability":
        "Each night*, choose a player & a character they become (if not in play). If a Demon is made, deaths tonight are arbitrary.",
  },
  {
    "id": "pixie",
    "name": "Pixie",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder": "Show the Pixie 1 in-play Townsfolk character token.",
    "otherNightReminder": "",
    "reminders": ["Mad", "Has ability"],
    "remindersFirstNight": ["Mad"],
    "setup": false,
    "ability":
        "You start knowing 1 in-play Townsfolk. If you were mad that you were this character, you gain their ability when they die.",
  },
  {
    "id": "plaguedoctor",
    "name": "Plague Doctor",
    "edition": "",
    "team": "outsider",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": ["Storyteller Ability"],
    "setup": false,
    "ability": "If you die, the Storyteller gains a Minion ability.",
  },
  {
    "id": "po",
    "name": "Po",
    "edition": "bmr",
    "team": "demon",
    "firstNightReminder": "",
    "otherNightReminder":
        "If the Po chose no-one the previous night: The Po points to three players. Otherwise: The Po either shows the 'no' head signal , or points to a player. Chosen players die",
    "reminders": ["Dead", "3 attacks"],
    "setup": false,
    "ability":
        "Each night*, you may choose a player: they die. If your last choice was no-one, choose 3 players tonight.",
  },
  {
    "id": "poisoner",
    "name": "Poisoner",
    "edition": "tb",
    "team": "minion",
    "firstNightReminder":
        "The Poisoner points to a player. That player is poisoned.",
    "otherNightReminder":
        "The previously poisoned player is no longer poisoned. The Poisoner points to a player. That player is poisoned.",
    "remindersFirstNight": ["Poisoned"],
    "reminders": ["Poisoned"],
    "setup": false,
    "ability":
        "Each night, choose a player: they are poisoned tonight and tomorrow day.",
  },
  {
    "id": "politician",
    "name": "Politician",
    "edition": "",
    "team": "outsider",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "If you were the player most responsible for your team losing, you change alignment & win, even if dead.",
  },
  {
    "id": "poppygrower",
    "name": "Poppy Grower",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder": "Do not inform the Demon/Minions who each other are",
    "otherNightReminder":
        "If the Poppy Grower has died, show the Minions/Demon who each other are.",
    "reminders": ["Evil wakes"],
    "setup": false,
    "ability":
        "Minions & Demons do not know each other. If you die, they learn who each other are that night.",
  },
  {
    "id": "preacher",
    "name": "Preacher",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder":
        "The Preacher chooses a player. If a Minion is chosen, wake the Minion and show the 'This character selected you' card and then the Preacher token.",
    "otherNightReminder":
        "The Preacher chooses a player. If a Minion is chosen, wake the Minion and show the 'This character selected you' card and then the Preacher token.",
    "reminders": ["At a sermon"],
    "setup": false,
    "ability":
        "Each night, choose a player: a Minion, if chosen, learns this. All chosen Minions have no ability.",
  },
  {
    "id": "professor",
    "name": "Professor",
    "edition": "bmr",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder":
        "If the Professor has not used their ability: The Professor either shakes their head no, or points to a player. If that player is a Townsfolk, they are now alive.",
    "reminders": ["Alive", "No ability"],
    "setup": false,
    "ability":
        "Once per game, at night*, choose a dead player: if they are a Townsfolk, they are resurrected.",
  },
  {
    "id": "psychopath",
    "name": "Psychopath",
    "edition": "",
    "team": "minion",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "Each day, before nominations, you may publicly choose a player: they die. If executed, you only die if you lose roshambo.",
  },
  {
    "id": "pukka",
    "name": "Pukka",
    "edition": "bmr",
    "team": "demon",
    "firstNightReminder":
        "The Pukka points to a player. That player is poisoned.",
    "otherNightReminder":
        "The Pukka points to a player. That player is poisoned. The previously poisoned player dies. ",
    "reminders": ["Poisoned", "Dead"],
    "remindersFirstNight": ["Poisoned"],
    "setup": false,
    "ability":
        "Each night, choose a player: they are poisoned. The previously poisoned player dies then becomes healthy.",
  },
  {
    "id": "puzzlemaster",
    "name": "Puzzlemaster",
    "edition": "",
    "team": "outsider",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": ["Drunk", "Guess used"],
    "setup": false,
    "ability":
        "1 player is drunk, even if you die. If you guess (once) who it is, learn the Demon player, but guess wrong & get false info.",
  },
  {
    "id": "ravenkeeper",
    "name": "Ravenkeeper",
    "edition": "tb",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder":
        "If the Ravenkeeper died tonight: The Ravenkeeper points to a player. Show that player's character token.",
    "reminders": [],
    "setup": false,
    "ability":
        "If you die at night, you are woken to choose a player: you learn their character.",
  },
  {
    "id": "recluse",
    "name": "Recluse",
    "edition": "tb",
    "team": "outsider",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "You might register as evil & as a Minion or Demon, even if dead.",
  },
  {
    "id": "revolutionary",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": ["Used"],
    "setup": false,
    "name": "Revolutionary",
    "team": "fabled",
    "ability":
        "2 neighboring players are known to be the same alignment. Once per game, one of them registers falsely.",
  },
  {
    "id": "riot",
    "name": "Riot",
    "edition": "",
    "team": "demon",
    "firstNightReminder": "Place the Riot 'Day 1' reminder. ",
    "otherNightReminder":
        "Change the Riot Day reminder for the next day. On Day 3, wake up the Minions, and 'You are' card, then the 'Riot' token.",
    "reminders": ["Day 1", "Day 2", "Day 3"],
    "setup": true,
    "ability":
        "On day 3, Minions become Riot & nominees die but nominate an alive player immediately. This must happen.",
  },
  {
    "id": "sage",
    "name": "Sage",
    "edition": "snv",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder":
        "If the Sage was killed by a Demon: Point to two players, one of which is that Demon.",
    "reminders": [],
    "setup": false,
    "ability": "If the Demon kills you, you learn that it is 1 of 2 players.",
  },
  {
    "id": "sailor",
    "name": "Sailor",
    "edition": "bmr",
    "team": "townsfolk",
    "firstNightReminder":
        "The Sailor points to a living player. Either the Sailor, or the chosen player, is drunk.",
    "otherNightReminder":
        "The previously drunk player is no longer drunk. The Sailor points to a living player. Either the Sailor, or the chosen player, is drunk.",
    "reminders": ["Drunk"],
    "remindersFirstNight": ["Drunk"],
    "setup": false,
    "ability":
        "Each night, choose an alive player: either you or they are drunk until dusk. You can't die.",
  },
  {
    "id": "saint",
    "name": "Saint",
    "edition": "tb",
    "team": "outsider",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability": "If you die by execution, your team loses.",
  },
  {
    "id": "savant",
    "name": "Savant",
    "edition": "snv",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "Each day, you may visit the Storyteller to learn 2 things in private: 1 is true & 1 is false.",
  },
  {
    "id": "scapegoat",
    "name": "Scapegoat",
    "edition": "tb",
    "team": "traveller",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "If a player of your alignment is executed, you might be executed instead.",
  },
  {
    "id": "scarletwoman",
    "name": "Scarlet Woman",
    "edition": "tb",
    "team": "minion",
    "firstNightReminder": "",
    "otherNightReminder":
        "If the Scarlet Woman became the Demon today: Show the 'You are' card, then the demon token.",
    "reminders": ["Demon"],
    "setup": false,
    "ability":
        "If there are 5 or more players alive & the Demon dies, you become the Demon. (Travellers don't count)",
  },
  {
    "id": "seamstress",
    "name": "Seamstress",
    "edition": "snv",
    "team": "townsfolk",
    "firstNightReminder":
        "The Seamstress either shows a 'no' head signal, or points to two other players. If the Seamstress chose players , nod 'yes' or shake 'no' for whether they are of same alignment.",
    "otherNightReminder":
        "If the Seamstress has not yet used their ability: the Seamstress either shows a 'no' head signal, or points to two other players. If the Seamstress chose players , nod 'yes' or shake 'no' for whether they are of same alignment.",
    "reminders": ["No ability"],
    "setup": false,
    "ability":
        "Once per game, at night, choose 2 players (not yourself): you learn if they are the same alignment.",
  },
  {
    "id": "sentinel",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": true,
    "name": "Sentinel",
    "team": "fabled",
    "ability": "There might be 1 extra or 1 fewer Outsider in play.",
  },
  {
    "id": "shabaloth",
    "name": "Shabaloth",
    "edition": "bmr",
    "team": "demon",
    "firstNightReminder": "",
    "otherNightReminder":
        "One player that the Shabaloth chose the previous night might be resurrected. The Shabaloth points to two players. Those players die.",
    "reminders": ["Dead", "Alive"],
    "setup": false,
    "ability":
        "Each night*, choose 2 players: they die. A dead player you chose last night might be regurgitated.",
  },
  {
    "id": "shugenja",
    "name": "Shugenja",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder":
        "Wake the Shugenja; point horizontally in the direction of the closest evil player. If the two closest evil players are equidistant, point your finger horizontally in either direction.",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "You start knowing if your closest evil player is clockwise or anti-clockwise. If equidistant, this info is arbitrary.",
  },
  {
    "id": "slayer",
    "name": "Slayer",
    "edition": "tb",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": ["No ability"],
    "setup": false,
    "ability":
        "Once per game, during the day, publicly choose a player: if they are the Demon, they die.",
  },
  {
    "id": "snakecharmer",
    "name": "Snake Charmer",
    "edition": "snv",
    "team": "townsfolk",
    "firstNightReminder":
        "The Snake Charmer points to a player. If that player is the Demon: swap the Demon and Snake Charmer character and alignments. Wake each player to inform them of their new role and alignment. The new Snake Charmer is poisoned.",
    "otherNightReminder":
        "The Snake Charmer points to a player. If that player is the Demon: swap the Demon and Snake Charmer character and alignments. Wake each player to inform them of their new role and alignment. The new Snake Charmer is poisoned.",
    "reminders": ["Poisoned"],
    "setup": false,
    "ability":
        "Each night, choose an alive player: a chosen Demon swaps characters & alignments with you & is then poisoned.",
  },
  {
    "id": "snitch",
    "name": "Snitch",
    "edition": "",
    "team": "outsider",
    "firstNightReminder":
        "After Minion info wake each Minion and show them three not-in-play character tokens. These may be the same or different to each other and the ones shown to the Demon.",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability": "Minions start knowing 3 not-in-play characters.",
  },
  {
    "id": "soldier",
    "name": "Soldier",
    "edition": "tb",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability": "You are safe from the Demon.",
  },
  {
    "id": "spiritofivory",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": ["No extra evil"],
    "setup": false,
    "name": "Spirit of Ivory",
    "team": "fabled",
    "ability": "There can't be more than 1 extra evil player.",
  },
  {
    "id": "spy",
    "name": "Spy",
    "edition": "tb",
    "team": "minion",
    "firstNightReminder":
        "Show the Grimoire to the Spy for as long as they need.",
    "otherNightReminder":
        "Show the Grimoire to the Spy for as long as they need.",
    "reminders": [],
    "setup": false,
    "ability":
        "Each night, you see the Grimoire. You might register as good & as a Townsfolk or Outsider, even if dead.",
  },
  {
    "id": "steward",
    "name": "Steward",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder": "Wake Steward and point to 1 good player.",
    "otherNightReminder": "",
    "reminders": ["Know"],
    "remindersFirstNight": ["Know"],
    "setup": false,
    "ability": "You start knowing 1 good player.",
  },
  {
    "id": "stormcatcher",
    "firstNightReminder":
        "Mark a good player as \"Safe\". Wake each evil player and show them the marked player.",
    "otherNightReminder": "",
    "reminders": ["Safe"],
    "setup": false,
    "name": "Storm Catcher",
    "team": "fabled",
    "ability":
        "Name a good character. If in play, they can only die by execution, but evil players learn which player it is.",
  },
  {
    "id": "summoner",
    "name": "Summoner",
    "edition": "",
    "team": "minion",
    "firstNightReminder":
        "Show the 'These characters are not in play' card. Show 3 character tokens of good characters not in play.",
    "otherNightReminder":
        "If it is the 3rd night, wake the Summoner. They point to a player and a Demon on the character sheet - that player becomes that Demon.",
    "reminders": ["Night 1", "Night 2", "Night 3"],
    "remindersFirstNight": ["Night 1"],
    "setup": true,
    "ability":
        "You get 3 bluffs. On the 3rd night, choose a player: they become an evil Demon of your choice. [No Demon]",
  },
  {
    "id": "sweetheart",
    "name": "Sweetheart",
    "edition": "snv",
    "team": "outsider",
    "firstNightReminder": "",
    "otherNightReminder": "Choose a player that is drunk.",
    "reminders": ["Drunk"],
    "setup": false,
    "ability": "When you die, 1 player is drunk from now on.",
  },
  {
    "id": "tealady",
    "name": "Tea Lady",
    "edition": "bmr",
    "team": "townsfolk",
    "firstNightReminder":
        "If both alive neighbours are good, place 'Can not die' reminder on them.",
    "otherNightReminder":
        "If both alive neighbours are good, place 'Can not die' reminder on them.",
    "reminders": ["Can not die"],
    "setup": false,
    "ability": "If both your alive neighbours are good, they can't die.",
  },
  {
    "id": "thief",
    "name": "Thief",
    "edition": "tb",
    "team": "traveller",
    "firstNightReminder":
        "The Thief points to a player. Put the Thief's 'Negative vote' reminder by the chosen player's character token.",
    "otherNightReminder":
        "The Thief points to a player. Put the Thief's 'Negative vote' reminder by the chosen player's character token.",
    "reminders": ["Negative vote"],
    "setup": false,
    "ability":
        "Each night, choose a player (not yourself): their vote counts negatively tomorrow.",
  },
  {
    "id": "tinker",
    "name": "Tinker",
    "edition": "bmr",
    "team": "outsider",
    "firstNightReminder": "",
    "otherNightReminder": "The Tinker might die.",
    "reminders": ["Dead"],
    "setup": false,
    "ability": "You might die at any time.",
  },
  {
    "id": "towncrier",
    "name": "Town Crier",
    "edition": "snv",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder":
        "Nod 'yes' or shake head 'no' for whether a Minion nominated today. Place the 'Minion not nominated' reminder (remove 'Minion nominated', if any).",
    "reminders": ["Minions not nominated", "Minion nominated"],
    "setup": false,
    "ability": "Each night*, you learn if a Minion nominated today.",
  },
  {
    "id": "toymaker",
    "firstNightReminder": "",
    "otherNightReminder":
        "If it is a night when a Demon attack could end the game, and the Demon is marked \"Final night: No Attack,\" then the Demon does not act tonight. (Do not wake them.)",
    "reminders": ["Final Night: No Attack"],
    "setup": false,
    "name": "Toymaker",
    "team": "fabled",
    "ability":
        "The Demon may choose not to attack & must do this at least once per game. Evil players get normal starting info.",
  },
  {
    "id": "undertaker",
    "name": "Undertaker",
    "edition": "tb",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder":
        "If a player was executed today: Show that player's character token.",
    "reminders": ["Executed"],
    "setup": false,
    "ability":
        "Each night*, you learn which character died by execution today.",
  },
  {
    "id": "vigormortis",
    "name": "Vigormortis",
    "edition": "snv",
    "team": "demon",
    "firstNightReminder": "",
    "otherNightReminder":
        "The Vigormortis points to a player. That player dies. If a Minion, add 'Has ability' reminder to them, and 'Poisoned' reminder to one of their Townsfolk neighbours.",
    "reminders": ["Dead", "Has ability", "Poisoned"],
    "setup": true,
    "ability":
        "Each night*, choose a player: they die. Minions you kill keep their ability & poison 1 Townsfolk neighbour. [−1 Outsider]",
  },
  {
    "id": "villageidiot",
    "name": "Village Idiot",
    "edition": "",
    "team": "townsfolk",
    "firstNightReminder":
        "Add the 'Drunk' reinder to the extra Village Idots, if existing. The Village Idiot points to a player; give a thumbs up if that player is good or a thumbs down if that player is evil.",
    "otherNightReminder":
        "The Village Idiot points to a player; give a thumbs up if that player is good or a thumbs down if that player is evil.",
    "reminders": ["Drunk"],
    "setup": true,
    "ability":
        "Each night, choose a player: you learn their alignment. [+0 to +2 Village Idiots. 1 of the extras is drunk]",
  },
  {
    "id": "virgin",
    "name": "Virgin",
    "edition": "tb",
    "team": "townsfolk",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": ["No ability"],
    "setup": false,
    "ability":
        "The 1st time you are nominated, if the nominator is a Townsfolk, they are executed immediately.",
  },
  {
    "id": "vizier",
    "name": "Vizier",
    "edition": "",
    "team": "minion",
    "firstNightReminder":
        "Announce 'The Vizier is in play' and state which player they are.",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "All players know who you are. You cannot die during the day. If good voted, you may choose to execute immediately.",
  },
  {
    "id": "vortox",
    "name": "Vortox",
    "edition": "snv",
    "team": "demon",
    "firstNightReminder": "",
    "otherNightReminder": "The Vortox points to a player. That player dies.",
    "reminders": ["Dead"],
    "setup": false,
    "ability":
        "Each night*, choose a player: they die. Townsfolk abilities yield false info. Each day, if no-one is executed, evil wins.",
  },
  {
    "id": "voudon",
    "name": "Voudon",
    "edition": "bmr",
    "team": "traveller",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "Only you and the dead can vote. They don't need a vote token to do so. A 50% majority is not required.",
  },
  {
    "id": "washerwoman",
    "name": "Washerwoman",
    "edition": "tb",
    "team": "townsfolk",
    "firstNightReminder":
        "Show the character token of a Townsfolk in play. Point to two players, one of which is that character.",
    "otherNightReminder": "",
    "remindersFirstNight": ["Townsfolk", "Wrong"],
    "reminders": ["Townsfolk", "Wrong"],
    "setup": false,
    "ability":
        "You start knowing that 1 of 2 players is a particular Townsfolk.",
  },
  {
    "id": "widow",
    "name": "Widow",
    "edition": "",
    "team": "minion",
    "firstNightReminder":
        "Show the Grimoire to the Widow for as long as they need. The Widow points to a player. That player is poisoned. Wake a good player. Show the 'These characters are in play' card, then the Widow character token.",
    "otherNightReminder": "",
    "reminders": ["Poisoned"],
    "remindersFirstNight": ["Poisoned"],
    "remindersGlobal": ["Knows"],
    "setup": false,
    "ability":
        "On your 1st night, look at the Grimoire and choose a player: they are poisoned. 1 good player knows a Widow is in play.",
  },
  {
    "id": "witch",
    "name": "Witch",
    "edition": "snv",
    "team": "minion",
    "firstNightReminder":
        "The Witch points to a player. If that player nominates tomorrow they die immediately.",
    "otherNightReminder":
        "If there are 4 or more players alive: The Witch points to a player. If that player nominates tomorrow they die immediately.",
    "reminders": ["Cursed"],
    "remindersFirstNight": ["Cursed"],
    "setup": false,
    "ability":
        "Each night, choose a player: if they nominate tomorrow, they die. If just 3 players live, you lose this ability.",
  },
  {
    "id": "wizard",
    "name": "Wizard",
    "edition": "",
    "team": "minion",
    "firstNightReminder": "Run the Wizard's ability, if applicable.",
    "otherNightReminder": "Run the Wizard's ability, if applicable.",
    "reminders": ["?", "?"],
    "setup": false,
    "ability":
        "Once per game, choose to make a wish. If granted, it might have a price & leave a clue as to its nature.",
  },
  {
    "id": "xaan",
    "name": "Xaan",
    "edition": "",
    "team": "minion",
    "firstNightReminder":
        "Mark the Xaan with the 'NIGHT 1' reminder. If X is 1, mark the Xaan with the 'X' reminder token.",
    "otherNightReminder":
        "Change the Xaan reminder token to the relevant night. If it is night X, mark the Xaan with the 'X' reminder token.",
    "reminders": [
      "Night 1",
      "Night 2",
      "Night 3",
      "X",
    ],
    "remindersFirstNight": ["Night 1"],
    "setup": true,
    "ability":
        "On night X, all Townsfolk are poisoned until dusk. [X Outsiders].",
  },
  {
    "id": "yaggababble",
    "name": "Yaggababble",
    "edition": "",
    "team": "demon",
    "firstNightReminder": "Show the Yaggababble their secret phrase.",
    "otherNightReminder":
        "Choose a number of players up to the total number of times the Yaggababble said their secret phrase publicly; those players die.",
    "reminders": ["Dead"],
    "setup": false,
    "ability":
        "You start knowing a secret phrase. For each time you said it publicly today, a player might die.",
  },
  {
    "id": "zealot",
    "name": "Zealot",
    "edition": "",
    "team": "outsider",
    "firstNightReminder": "",
    "otherNightReminder": "",
    "reminders": [],
    "setup": false,
    "ability":
        "If there are 5 or more players alive, you must vote for every nomination.",
  },
  {
    "id": "zombuul",
    "name": "Zombuul",
    "edition": "bmr",
    "team": "demon",
    "firstNightReminder": "",
    "otherNightReminder":
        "If no-one died during the day: The Zombuul points to a player. That player dies.",
    "reminders": ["Died today", "Dead"],
    "setup": false,
    "ability":
        "Each night*, if no-one died today, choose a player: they die. The 1st time you die, you live but register as dead.",
  }
];

final characters = charactersJson
    .map(
      (character) => Character.fromJson(character),
    )
    .toList();

final charactersMap = {
  for (final character in characters) character.id: character
};

final nightOrderNonCharacterInfo = {
  "DUSK": Character.fromJson({
    "id": "DUSK",
    "team": "townsfolk",
    "name": "Dusk",
    "image": "assets/images/dusk.png",
    "ability": "",
  }),
  "MINION": Character.fromJson({
    "id": "MINION",
    "team": "minion",
    "name": "Minion setup",
    "image": "assets/images/minion.png",
    "ability": "",
    "firstNight": 14,
    "firstNightReminder":
        "If 7 or more players are in play, wake the Minions to let them know each other. Show the 'This is your Demon' token and point to the Demon.",
  }),
  "DEMON": Character.fromJson({
    "id": "DEMON",
    "team": "demon",
    "name": "Demon setup",
    "image": "assets/images/demon.png",
    "ability": "",
    "firstNight": 18,
    "firstNightReminder":
        "If 7 or more players are in play, wake the Demon, show the 'These are your Minions' token and point to all Minions. Show 'These characters are not in play' token and 3 not in play character tokens.",
  }),
  "DAWN": Character.fromJson({
    "id": "DAWN",
    "team": "townsfolk",
    "name": "Dawn",
    "image": "assets/images/dawn.png",
    "ability": "",
  }),
};
