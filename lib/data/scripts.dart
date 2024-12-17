const favoriteScriptsInfo = [
  {
    "pk": 15328,
    "name": "Bloody Christmas",
    "author": "The_AdLAD",
    "logo":
        "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/_meta.png",
    "almanac":
        "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/almanac.html",
    "content": [
      {
        "id": "_meta",
        "name": "Bloody Christmas",
        "author": "The_AdLAD",
        "logo":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/_meta.png",
        "almanac":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/almanac.html"
      },
      {
        "id": "pogues_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/pogues_itsbloodychristmas2024v2.png",
        "firstNightReminder":
            "The Pogues are woken to learn the name of an Outsider. If the Pogues became drunk tonight, they wake and learn this. ",
        "otherNightReminder":
            "If the Pogues became drunk tonight, they wake and learn this. ",
        "reminders": ["Seen"],
        "remindersFirstNight": ["Seen"],
        "setup": true,
        "name": "Pogues",
        "team": "townsfolk",
        "ability":
            "You start knowing 1 player that is an Outsider. If you are made drunk, you learn you were that night. [+1 Outsider]",
        "firstNight": 23,
        "otherNight": 23
      },
      {
        "id": "innkeeper_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/innkeeper_itsbloodychristmas2024v2.png",
        "otherNightReminder":
            "The previously protected and drunk players lose those markers. The Innkeeper points to two players. Those players are protected. One is drunk.",
        "reminders": ["Safe", "Safe", "Drunk"],
        "name": "Innkeeper",
        "team": "townsfolk",
        "ability":
            "Each night*, choose 2 players: they can't die tonight, but 1 is drunk until dusk.",
        "otherNight": 5
      },
      {
        "id": "reindeer_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/reindeer_itsbloodychristmas2024v2.png",
        "firstNightReminder":
            "The Reindeer chooses a player. If that player is not the Demon, they become drunk until dusk.",
        "otherNightReminder":
            "The Reindeer chooses a player. If that player is not the Demon, they become drunk until dusk. If that player is the Demon, the Reindeer dies tonight. ",
        "reminders": ["Drunk", "Dead"],
        "name": "Reindeer",
        "team": "townsfolk",
        "ability":
            "Each night, choose a player. If they are not the Demon, they are drunk until dusk. If they are the Demon, you die (except on night 1) ",
        "firstNight": 14,
        "otherNight": 6
      },
      {
        "id": "landlord_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/landlord_itsbloodychristmas2024v2.png",
        "otherNightReminder":
            "If a player was killed by execution, the Landlord learns how many players were drunk that day. ",
        "name": "Landlord",
        "team": "townsfolk",
        "ability":
            "Each night*, if a player died by execution, you learn how many players were drunk that day. ",
        "otherNight": 19
      },
      {
        "id": "wiseman_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/wiseman_itsbloodychristmas2024v2.png",
        "firstNightReminder":
            "The Wise Man chooses a player. If they are good, they are drunk until dusk. ",
        "otherNightReminder":
            "If the Wise Man selected someone the previous night, wake that player and tell them who the Wise Man is. Then wake up the Wise Man, and ask them to choose a player. If they are good, they are drunk until dusk. ",
        "reminders": ["Drunk", "Wise"],
        "name": "Wise Man",
        "team": "townsfolk",
        "ability":
            "Each night, choose a player (different from last night).  If they are good, they are drunk until dusk. The previously chosen player learns that you are the Wise Man. ",
        "firstNight": 15,
        "otherNight": 7
      },
      {
        "id": "elf_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/elf_itsbloodychristmas2024v2.png",
        "firstNightReminder":
            "The Elf learns how many steps away from Santa Claus they are sat. ",
        "otherNightReminder":
            "The Elf learns how many steps away from Santa Claus they are sat, excluding\u00a0dead\u00a0players. ",
        "name": "Elf",
        "team": "townsfolk",
        "ability":
            "Each night, learn how many steps from Santa Claus you are, excluding\u00a0dead\u00a0players. ",
        "firstNight": 18,
        "otherNight": 20
      },
      {
        "id": "postman_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/postman_itsbloodychristmas2024v2.png",
        "firstNightReminder":
            "The Postman learns if Santa Claus successfully delivered a present and the alignment of the present.",
        "otherNightReminder":
            "The Postman learns if Santa Claus successfully delivered a present and the alignment of the present. ",
        "name": "Postman",
        "team": "townsfolk",
        "ability":
            "Each night, you learn if a present was delivered tonight & if it was naughty or nice. ",
        "firstNight": 21,
        "otherNight": 21
      },
      {
        "id": "vegan_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/vegan_itsbloodychristmas2024v2.png",
        "firstNightReminder":
            "The Vegan chooses a player. This player is 'frozen' til dusk.",
        "otherNightReminder":
            "The Vegan chooses a player. This player is 'frozen' til dusk. ",
        "remindersFirstNight": ["Frozen"],
        "reminders": ["Frozen"],
        "name": "Vegan",
        "team": "townsfolk",
        "ability": "Each night, choose a player: they are 'frozen' until dusk.",
        "firstNight": 13,
        "otherNight": 4
      },
      {
        "id": "turkey_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/turkey_itsbloodychristmas2024v2.png",
        "otherNightReminder":
            "If the Turkey was killed, they publicly choose a player at dawn. If that player is evil, they die. If that player is good, they are drunk for the rest of the game. ",
        "reminders": ["Drunk"],
        "name": "Turkey",
        "team": "townsfolk",
        "ability":
            "If you die at night, publicly choose a player: if evil, they die. If good, they are drunk permanently. ",
        "otherNight": 22
      },
      {
        "id": "snowman_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/snowman_itsbloodychristmas2024v2.png",
        "reminders": ["Safe"],
        "remindersFirstNight": ["Safe"],
        "name": "Snowman",
        "team": "townsfolk",
        "ability": "You cannot die at night while Santa Claus lives. "
      },
      {
        "id": "santaclaus_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/santaclaus_itsbloodychristmas2024v2.png",
        "firstNightReminder":
            "Santa Claus chooses a player. That player receives a present. ",
        "otherNightReminder":
            "If Santa Claus was killed at night, another good living player might become Santa Claus. If not, Santa Claus chooses a player. If they are alive and sober, they get a present. ",
        "reminders": [
          "Teddy Bear",
          "Pair of Socks",
          "Crystall Ball",
          "Box of Chocolates",
          "Games Console",
          "Perfume",
          "Getaway Holiday",
          "Fridge/Freezer",
          "Lump of Coal",
          "Cheap Vodka",
          "Bucket Hat",
          "Pet Rock",
          "Snowball",
          "Greasy Wig"
        ],
        "setup": true,
        "name": "Santa Claus",
        "team": "townsfolk",
        "ability":
            "Each night, choose a living player (not yourself): they get a present. When you die at night, an alive good player might become Santa Claus. [Always starts in play]",
        "firstNight": 20,
        "otherNight": 11
      },
      {
        "id": "piemaker_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/piemaker_itsbloodychristmas2024v2.png",
        "firstNightReminder":
            "The Piemaker chooses a character. They learn if that character is in play. If they are good, make that character drunk until dusk. ",
        "otherNightReminder":
            "The Piemaker chooses a character. They learn if that character is in play. If they are good, make that character drunk until dusk. ",
        "reminders": ["Drunk"],
        "name": "Piemaker",
        "team": "townsfolk",
        "ability":
            "Each night, choose a character; learn if it is in play. If good, that character is drunk until dusk. ",
        "firstNight": 16,
        "otherNight": 8
      },
      {
        "id": "tree_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/tree_itsbloodychristmas2024v2.png",
        "otherNightReminder":
            "The Tree chooses a player. If that player would die tonight, they are instead made drunk. ",
        "reminders": ["Protected", "Drunk"],
        "name": "Tree",
        "team": "townsfolk",
        "ability":
            "Each night*, choose a player (not yourself): if they die tonight, they are instead drunk until dusk. ",
        "otherNight": 9
      },
      {
        "id": "crazyuncle_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/crazyuncle_itsbloodychristmas2024v2.png",
        "remindersGlobal": ["Is the Crazy Uncle", "Drunk"],
        "setup": true,
        "name": "Crazy Uncle",
        "team": "outsider",
        "ability":
            "You do not know that you are the Crazy Uncle. You think you are a Townsfolk (not Santa Claus), but any good players you choose are drunk until dusk"
      },
      {
        "id": "donkey_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/donkey_itsbloodychristmas2024v2.png",
        "otherNightReminder":
            "If the Donkey was executed, a good player dies. ",
        "reminders": ["Dead"],
        "name": "Donkey",
        "team": "outsider",
        "ability":
            "If you are made drunk, the player who made you drunk dies (except on night 1).  If you are executed, a good players dies that night. ",
        "otherNight": 10
      },
      {
        "id": "mistletoe_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/mistletoe_itsbloodychristmas2024v2.png",
        "firstNightReminder":
            "The Mistletoe chooses a player. Until dusk, if the mistletoe becomes drunk or dies, so does their target. ",
        "otherNightReminder":
            "The Mistletoe chooses a player. Until dusk, if the mistletoe becomes drunk or dies, so does their target. ",
        "reminders": ["Drunk"],
        "name": "Mistletoe",
        "team": "outsider",
        "ability":
            "Each night, 1 of your living good neighbours is drunk until dusk. If a good player nominates you & executes you, they are drunk permanently.",
        "firstNight": 11,
        "otherNight": 2
      },
      {
        "id": "dad_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/dad_itsbloodychristmas2024v2.png",
        "firstNightReminder": "The Dad chooses a player. Nothing happens. ",
        "otherNightReminder": "The Dad chooses a player. Nothing happens. ",
        "remindersGlobal": ["Is the Dad"],
        "setup": true,
        "name": "Dad",
        "team": "outsider",
        "ability":
            "You do not know that you are the Dad. You think you are Santa Claus, but you are drunk. ",
        "firstNight": 19,
        "otherNight": 12
      },
      {
        "id": "creepyrelative_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/creepyrelative_itsbloodychristmas2024v2.png",
        "firstNightReminder":
            "The Creepy Relative chooses a player. They learn that player's character and may choose to make them drunk. ",
        "otherNightReminder":
            "The Creepy Relative chooses a player. They learn that player's character and may choose to make them drunk.",
        "reminders": ["Drunk"],
        "name": "Creepy Relative",
        "team": "minion",
        "ability":
            "Each night, choose a player: learn their character. Once per game, at night,  you may choose to make them drunk until dusk",
        "firstNight": 12,
        "otherNight": 3
      },
      {
        "id": "buble_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/buble_itsbloodychristmas2024v2.png",
        "otherNightReminder": "The player who nominated Buble might die. ",
        "reminders": ["Dead"],
        "name": "Buble ",
        "team": "minion",
        "ability":
            "Each night*, if a player nominated you today, they might die, even if you were executed. ",
        "otherNight": 13
      },
      {
        "id": "mariah_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/mariah_itsbloodychristmas2024v2.png",
        "name": "Mariah",
        "team": "minion",
        "ability":
            "If you obnoxiously sing a festive song when nominated and are executed that day, your team wins."
      },
      {
        "id": "scrooge_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/scrooge_itsbloodychristmas2024v2.png",
        "name": "Scrooge",
        "team": "minion",
        "ability":
            "Once per game, during the day, publicly choose a living player: if Santa Claus, your team wins. "
      },
      {
        "id": "mrsclaws_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/mrsclaws_itsbloodychristmas2024v2.png",
        "otherNightReminder":
            "Mrs.Claws wakes up and guesses a number. If they guess correctly, they kill two players, otherwise they kill one. ",
        "reminders": ["Dead", "Dead"],
        "name": "Mrs. Claws",
        "team": "demon",
        "ability":
            "Each night*, guess how many players are drunk: if correct, choose 2 players, else choose 1: they die. ",
        "otherNight": 16
      },
      {
        "id": "krampus_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/krampus_itsbloodychristmas2024v2.png",
        "otherNightReminder":
            "Krampus chooses 2 players. If either of them are drunk, they both die. If there are no drunk players when they wake up, the evil team wins. ",
        "reminders": ["Dead", "Dead"],
        "setup": true,
        "name": "Krampus",
        "team": "demon",
        "ability":
            "Each night*, choose 2 players. If either are drunk, both die. If there are no living drunk players at dawn, your team wins. [+1 Outsider]",
        "otherNight": 15
      },
      {
        "id": "grinch_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/grinch_itsbloodychristmas2024v2.png",
        "firstNightReminder": "The Grinch learns who Santa Claus picked. ",
        "otherNightReminder":
            "The Grinch learns who Santa Claus picked. Then, they choose a player; that player dies. If the Grinch picks the player they were told, the Grinch gets a present from the 'naughty' list. ",
        "reminders": ["Dead"],
        "name": "Grinch",
        "team": "demon",
        "ability":
            "Each night, learn who Santa Claus chose. Each night*, choose a player: they die and if Santa Claus picked them, you get a present instead.",
        "firstNight": 22,
        "otherNight": 17
      },
      {
        "id": "jackfrost_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/jackfrost_itsbloodychristmas2024v2.png",
        "firstNightReminder":
            "Jack Frost chooses a player. They are 'frozen'. Jack Frost wins if all good living players are 'frozen'",
        "otherNightReminder":
            "Jack Frost chooses a player. They are 'frozen'. Jack Frost wins if all good living players are 'frozen'",
        "reminders": ["Frozen", "Frozen", "Frozen", ""],
        "name": "Jack Frost",
        "team": "demon",
        "ability":
            "Each night, choose a player: they are 'frozen' permanently. If all good living players are frozen, your team wins. ",
        "firstNight": 17,
        "otherNight": 14
      },
      {
        "id": "presents_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/presents_itsbloodychristmas2024v2.png",
        "otherNightReminder":
            "Wake any players that have an unused present from a previous night. They may use the present. ",
        "reminders": ["Present", "Present", "Present", "Present", "Present"],
        "name": "Presents",
        "team": "fabled",
        "ability":
            "Players can receive presents. Presents cannot be used on the same night they are received.  Good players get a present from the 'nice' list and evil players get presents from the 'naughty' list. If a player dies while holding a present, they lose the present. Drunk players' presents might malfunction.  ",
        "otherNight": 18
      },
      {
        "id": "bloodyfreezing_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/bloodyfreezing_itsbloodychristmas2024v2.png",
        "name": "Bloody Freezing",
        "team": "fabled",
        "ability":
            "'Frozen' players are always healthy and sober and cannot be made drunk."
      },
      {
        "id": "teddybear_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/teddybear_itsbloodychristmas2024v2.png",
        "name": "Teddy Bear",
        "team": "fabled",
        "ability":
            "You learn the alignment of one living neighbour (ST's choice) (Nice List)"
      },
      {
        "id": "pairofsocks_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/pairofsocks_itsbloodychristmas2024v2.png",
        "name": "Pair of Socks",
        "team": "fabled",
        "ability": "Learn one player that is not the Demon. (Nice List)"
      },
      {
        "id": "crystalball_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/crystalball_itsbloodychristmas2024v2.png",
        "name": "Crystal Ball",
        "team": "fabled",
        "ability":
            "You learn if the nearest evil player to you is a Minion or Demon. If equidistant, this information is arbitrary. (Nice List)"
      },
      {
        "id": "boxofchocolates_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/boxofchocolates_itsbloodychristmas2024v2.png",
        "name": "Box of Chocolates",
        "team": "fabled",
        "ability":
            "Choose 3 players, learn how many of them are drunk. (Nice List)"
      },
      {
        "id": "gamesconsole_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/gamesconsole_itsbloodychristmas2024v2.png",
        "name": "Games Console",
        "team": "fabled",
        "ability": "Learn how many evil players are alive. (Nice List)"
      },
      {
        "id": "perfume_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/perfume_itsbloodychristmas2024v2.png",
        "name": "Perfume",
        "team": "fabled",
        "ability":
            "Choose a living player. If they are good, they are executed instead of you today. (Nice List)"
      },
      {
        "id": "getawayholiday_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/getawayholiday_itsbloodychristmas2024v2.png",
        "name": "Getaway Holiday",
        "team": "fabled",
        "ability":
            "If you die at night whilst holding this present, you stay alive. (Nice List)"
      },
      {
        "id": "fridgefreezer_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/fridgefreezer_itsbloodychristmas2024v2.png",
        "name": "Fridge/Freezer",
        "team": "fabled",
        "ability": "You are 'frozen' for the rest of the game. (Nice List)"
      },
      {
        "id": "lumpofcoal_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/lumpofcoal_itsbloodychristmas2024v2.png",
        "name": "Lump of Coal",
        "team": "fabled",
        "ability": "Choose a player, they die. (Naughty List)"
      },
      {
        "id": "cheapvodka_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/cheapvodka_itsbloodychristmas2024v2.png",
        "name": "Cheap Vodka",
        "team": "fabled",
        "ability":
            "Choose a player, they are drunk for the rest of the game. (Naughty List)"
      },
      {
        "id": "buckethat_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/buckethat_itsbloodychristmas2024v2.png",
        "name": "Bucket Hat",
        "team": "fabled",
        "ability":
            "Choose a character of your character type; you become that character. (Naughty List)"
      },
      {
        "id": "petrock_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/petrock_itsbloodychristmas2024v2.png",
        "name": "Pet Rock",
        "team": "fabled",
        "ability":
            "If there are 5 or more living players, choose one of them. If you are executed today, they are executed instead. (Naughty List)"
      },
      {
        "id": "snowball_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/snowball_itsbloodychristmas2024v2.png",
        "name": "Snowball",
        "team": "traveller",
        "ability":
            "Choose a player, they are 'frozen' for the rest of the game. (Naughty List)"
      },
      {
        "id": "greasywig_itsbloodychristmas2024v2",
        "image":
            "https://www.bloodstar.xyz/p/Jabas/ItsBloodyChristmas2024v2/greasywig_itsbloodychristmas2024v2.png",
        "name": "Greasy Wig",
        "team": "fabled",
        "ability":
            "Choose an evil player. You swap characters with them. (Naughty List)"
      }
    ],
  },
  {
    "pk": 178,
    "name": "Trouble Brewing",
    "version": "1.0.0",
    "author": "The Pandemonium Institute",
    "content": [
      {"id": "washerwoman"},
      {"id": "librarian"},
      {"id": "investigator"},
      {"id": "chef"},
      {"id": "empath"},
      {"id": "fortuneteller"},
      {"id": "undertaker"},
      {"id": "monk"},
      {"id": "ravenkeeper"},
      {"id": "virgin"},
      {"id": "slayer"},
      {"id": "soldier"},
      {"id": "mayor"},
      {"id": "butler"},
      {"id": "drunk"},
      {"id": "recluse"},
      {"id": "saint"},
      {"id": "poisoner"},
      {"id": "spy"},
      {"id": "scarletwoman"},
      {"id": "baron"},
      {"id": "imp"},
      {"id": "scapegoat"},
      {"id": "gunslinger"},
      {"id": "beggar"},
      {"id": "bureaucrat"},
      {"id": "thief"},
    ],
    "score": 18
  },
  {
    "pk": 181,
    "name": "Bad Moon Rising",
    "version": "1.0.0",
    "author": "The Pandemonium Institute",
    "content": [
      {"id": "grandmother"},
      {"id": "sailor"},
      {"id": "chambermaid"},
      {"id": "exorcist"},
      {"id": "innkeeper"},
      {"id": "gambler"},
      {"id": "gossip"},
      {"id": "courtier"},
      {"id": "professor"},
      {"id": "minstrel"},
      {"id": "tealady"},
      {"id": "pacifist"},
      {"id": "fool"},
      {"id": "tinker"},
      {"id": "moonchild"},
      {"id": "goon"},
      {"id": "lunatic"},
      {"id": "godfather"},
      {"id": "devilsadvocate"},
      {"id": "assassin"},
      {"id": "mastermind"},
      {"id": "zombuul"},
      {"id": "pukka"},
      {"id": "shabaloth"},
      {"id": "po"},
      {"id": "apprentice"},
      {"id": "matron"},
      {"id": "voudon"},
      {"id": "judge"},
      {"id": "bishop"},
    ],
    "score": 14
  },
  {
    "pk": 180,
    "name": "Sects and Violets",
    "version": "1.0.0",
    "author": "The Pandemonium Institute",
    "content": [
      {"id": "clockmaker"},
      {"id": "dreamer"},
      {"id": "snakecharmer"},
      {"id": "mathematician"},
      {"id": "flowergirl"},
      {"id": "towncrier"},
      {"id": "oracle"},
      {"id": "savant"},
      {"id": "seamstress"},
      {"id": "philosopher"},
      {"id": "artist"},
      {"id": "juggler"},
      {"id": "sage"},
      {"id": "mutant"},
      {"id": "sweetheart"},
      {"id": "barber"},
      {"id": "klutz"},
      {"id": "eviltwin"},
      {"id": "witch"},
      {"id": "cerenovus"},
      {"id": "pithag"},
      {"id": "fanggu"},
      {"id": "vigormortis"},
      {"id": "nodashii"},
      {"id": "vortox"},
      {"id": "butcher"},
      {"id": "bonecollector"},
      {"id": "harlot"},
      {"id": "barista"},
      {"id": "deviant"},
    ],
    "score": 13
  },
  {
    "pk": 435,
    "name": "No Roles Barred",
    "version": "1.0.1",
    "author": "Andrew Pichot",
    "content": [
      {"id": "alchemist"},
      {"id": "noble"},
      {"id": "pixie"},
      {"id": "bountyhunter"},
      {"id": "balloonist"},
      {"id": "empath"},
      {"id": "snakecharmer"},
      {"id": "gossip"},
      {"id": "amnesiac"},
      {"id": "artist"},
      {"id": "philosopher"},
      {"id": "huntsman"},
      {"id": "poppygrower"},
      {"id": "goon"},
      {"id": "mutant"},
      {"id": "damsel"},
      {"id": "drunk"},
      {"id": "godfather"},
      {"id": "poisoner"},
      {"id": "fearmonger"},
      {"id": "goblin"},
      {"id": "boomdandy"},
      {"id": "lilmonsta"},
      {"id": "legion"},
      {"id": "vortox"}
    ],
    "score": 6
  },
  {
    "pk": 3026,
    "name": "Bad Moon & Violets",
    "version": "1.0.0",
    "author": "Fantasy",
    "content": [
      {"id": "_meta", "name": "Bad Moon & Violets", "author": "Fantasy"},
      {"id": "savant"},
      {"id": "towncrier"},
      {"id": "flowergirl"},
      {"id": "seamstress"},
      {"id": "mathematician"},
      {"id": "cannibal"},
      {"id": "snakecharmer"},
      {"id": "sage"},
      {"id": "artist"},
      {"id": "fortuneteller"},
      {"id": "pixie"},
      {"id": "clockmaker"},
      {"id": "highpriestess"},
      {"id": "klutz"},
      {"id": "mutant"},
      {"id": "plaguedoctor"},
      {"id": "sweetheart"},
      {"id": "mezepheles"},
      {"id": "goblin"},
      {"id": "pithag"},
      {"id": "cerenovus"},
      {"id": "pukka"},
      {"id": "nodashii"},
      {"id": "fanggu"},
      {"id": "vortox"}
    ],
    "score": 0
  },
  {
    "pk": 4318,
    "name": "High Stakes Betting",
    "version": "1.1.0",
    "author": "Navean",
    "content": [
      {
        "id": "_meta",
        "logo": "https://i.postimg.cc/BbyMyTfk/high-stakes-betting-icon.png",
        "name": "High Stakes Betting",
        "author": "Navean"
      },
      {"id": "noble"},
      {"id": "shugenja"},
      {"id": "chambermaid"},
      {"id": "villageidiot"},
      {"id": "snakecharmer"},
      {"id": "cultleader"},
      {"id": "artist"},
      {"id": "slayer"},
      {"id": "seamstress"},
      {"id": "huntsman"},
      {"id": "philosopher"},
      {"id": "farmer"},
      {"id": "poppygrower"},
      {"id": "saint"},
      {"id": "recluse"},
      {"id": "damsel"},
      {"id": "klutz"},
      {"id": "riot"},
      {"id": "sentinel"}
    ],
    "score": 1
  },
  {
    "pk": 13123,
    "name": "Quebra-Dados Homebrew",
    "author": "Tom\u00e1s",
    "logo": "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/_meta.png",
    "almanac": "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/almanac.html",
    "content": [
      {
        "id": "_meta",
        "name": "Quebra-Dados Homebrew",
        "author": "Tom\u00e1s",
        "logo": "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/_meta.png",
        "almanac": "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/almanac.html"
      },
      {
        "id": "joana_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/joana_quebradados.png",
        "firstNightReminder":
            "Show a character token in play. Point to two players, one of which is that character.",
        "otherNightReminder":
            "If this is Joana's second night and she was executed on the previous day, show another character token in play. Point to two players, one of which is that character.",
        "reminders": ["Role", "2nd Role", "Wrong"],
        "name": "Joana",
        "team": "townsfolk",
        "ability":
            "You start knowing that 1 of 2 players is a particular character. If you get executed on your first day, your power works again on the following night, and you receive sober, healthy and true information. ",
        "flavor": "I don't want to kill him, he's good, he only wakes up once!",
        "firstNight": 16,
        "otherNight": 3
      },
      {
        "id": "christian_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/christian_quebradados.png",
        "firstNightReminder":
            "Show 1 good & 1 evil character that are both in-play or not at all.",
        "reminders": ["Good", "Evil"],
        "name": "Christian",
        "team": "townsfolk",
        "ability":
            "You start knowing 1 good & 1 evil character: they are either both in-play or not at all.",
        "flavor": "The power of Christian compels you!",
        "firstNight": 17
      },
      {
        "id": "joorocha_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/joorocha_quebradados.png",
        "otherNightReminder":
            "If this is the second night: Ask Jo\u00e3o Rocha to name a player and guess their role. If successful, mark both players with Cannot Die. If wrong, he dies. Don't forget to replace cannot die token",
        "reminders": ["Cannot Die"],
        "setup": true,
        "name": "Jo\u00e3o Rocha",
        "team": "townsfolk",
        "ability":
            "On your second night, choose a player and guess their role. If correct, neither of you can die during the next two nights. If you guess wrong, you die. [+ Bruno]",
        "special": [
          {"name": "pointing", "type": "ability", "time": "day"}
        ],
        "flavor": "Let's hard claim day one Bruno?",
        "otherNight": 14
      },
      {
        "id": "ana_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/ana_quebradados.png",
        "firstNightReminder":
            "Wake up Ana and ask her to choose a number up to 5. ",
        "otherNightReminder":
            "Wake up Ana and ask her to choose a number up to 5. ",
        "reminders": ["1", "2", "3", "4", "5"],
        "name": "Ana",
        "team": "townsfolk",
        "ability":
            "Each night, choose a number up to 5. On the following day, the storyteller will privately provide information related to that number.",
        "flavor": "Pessoal, como \u00e9 que ficamos?",
        "firstNight": 18,
        "otherNight": 19
      },
      {
        "id": "anamartins_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/anamartins_quebradados.png",
        "firstNightReminder":
            "Wake up Ana Martins and ask her to choose a player. Give her a thumbs up if the player was drunk or poisoned last night or thumbs down if not.",
        "otherNightReminder":
            "Wake up Ana Martins and ask her to choose a player. Give her a thumbs up if the player was drunk or poisoned last night or thumbs down if not.",
        "name": "Ana Martins",
        "team": "townsfolk",
        "ability":
            "Each night, you choose a player. If they were drunk or poisoned the past day, you receive a positive reading. If not, you receive a negative reading.",
        "flavor": "The doctor will see you now.",
        "firstNight": 19,
        "otherNight": 20
      },
      {
        "id": "joosantos_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/joosantos_quebradados.png",
        "firstNightReminder":
            "Wake Jo\u00e3o Santos and point to an alive player you think it makes no sense to execute.",
        "otherNightReminder":
            "Wake Jo\u00e3o Santos and point to an alive player you think it makes no sense to execute.",
        "reminders": ["No sense"],
        "name": "Jo\u00e3o Santos",
        "team": "townsfolk",
        "ability":
            "Each night, learn an alive player the Storyteller believes it makes no sense to execute.",
        "flavor": "Why execute me and not one of the 3 people claiming Yurii?",
        "firstNight": 20,
        "otherNight": 21
      },
      {
        "id": "irina_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/irina_quebradados.png",
        "otherNightReminder":
            "If no one was executed: Wake up Irina and show her a new in-play character.",
        "reminders": ["Shown"],
        "name": "Irina",
        "team": "townsfolk",
        "ability":
            "Each night*, if nobody was executed yesterday, learn a new in-play character.",
        "flavor": "Guys, let's not execute anyone and just take pictures.",
        "otherNight": 15
      },
      {
        "id": "ivan_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/ivan_quebradados.png",
        "firstNightReminder":
            "Wake Ivan and point to a player who is contributing the most to his team.",
        "otherNightReminder":
            "Wake Ivan and point to a player who is contributing the most to his team.",
        "reminders": ["Helpful"],
        "name": "Ivan",
        "team": "townsfolk",
        "ability":
            "Each night, you receive a player the Storyteller believes are being helpful to their team.",
        "flavor": "Come with me, and I shall show you the way.",
        "firstNight": 21,
        "otherNight": 22
      },
      {
        "id": "ehdi_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/ehdi_quebradados.png",
        "otherNightReminder":
            "Wake up Ehdi and show the hand signal for the number (0, 1, 2, etc.) of evil players who publicly asked for beers today.",
        "reminders": ["Evil Claim"],
        "remindersGlobal": ["Beer"],
        "name": "Ehdi",
        "team": "townsfolk",
        "ability":
            "Each day any number of living players may publicly ask for beers: you learn how many are good that night.",
        "flavor": "I'll take one beer",
        "otherNight": 17
      },
      {
        "id": "yurii_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/yurii_quebradados.png",
        "otherNightReminder":
            "If Yurii nominated himself and he's still alive: Show him the role of any of his living neighbors.",
        "reminders": ["Nominated"],
        "name": "Yurii",
        "team": "townsfolk",
        "ability":
            "Each day, if you nominate yourself and are not executed, you learn the character of one of your living neighbors the following night.",
        "flavor": "Yurii nominates Yurii",
        "otherNight": 18
      },
      {
        "id": "csar_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/csar_quebradados.png",
        "otherNightReminder":
            "If C\u00e9sar's ability causes him to wake tonight: Wake C\u00e9sar and run their ability.",
        "reminders": ["?", "Drunk"],
        "name": "C\u00e9sar",
        "team": "townsfolk",
        "ability":
            "Once per game, during the day, you may visit the storyteller and invent an ability for yourself. You might receive a more balanced version. One full day you might be drunk.",
        "flavor": "Que calor...",
        "otherNight": 11
      },
      {
        "id": "david_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/david_quebradados.png",
        "reminders": ["Safe"],
        "name": "David",
        "team": "townsfolk",
        "ability":
            "While you're alive, your alive neighbors are safe from being drunk or poisoned by other players. ",
        "flavor": "Tudo bem gatinhos?"
      },
      {
        "id": "duarte_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/duarte_quebradados.png",
        "otherNightReminder":
            "If chosen by the Demon: Wake Duarte and ask him and the demon to privately play roshambo (rock \\\"fist\\\", scissors \\\"two fingers\\\" or paper \\\"flat hand\\\"). If they both chose the same, play again. Play until someone wins. Kill Duarte if he loses and a minion if he wins.",
        "reminders": ["Dead"],
        "name": "Duarte",
        "team": "townsfolk",
        "ability":
            "If you would be killed by the Demon, play anonymous roshambo with them. If you win, a Minion dies instead.",
        "flavor": "Don't bring a demon to a bow and arrow fight",
        "otherNight": 13
      },
      {
        "id": "marco_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/marco_quebradados.png",
        "name": "Marco",
        "team": "townsfolk",
        "ability":
            "If only 3 players live, guess who the demon is. If correct, your team wins, otherwise your team loses.",
        "flavor": "All me baby!"
      },
      {
        "id": "eduardo_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/eduardo_quebradados.png",
        "firstNightReminder":
            "Wake up Eduardo and ask him to choose a townsfolk role.",
        "reminders": ["Is Eduardo"],
        "name": "Eduardo",
        "team": "outsider",
        "ability":
            "On your first night choose a townsfolk role. If you are mad until the end that you are that role, you win, even if dead.",
        "flavor": "I want chaos.",
        "firstNight": 22
      },
      {
        "id": "hugo_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/hugo_quebradados.png",
        "firstNightReminder":
            "Wake up Hugo and point to a player and an evil character.",
        "reminders": ["Mad", "Poisoned"],
        "name": "Hugo",
        "team": "outsider",
        "ability":
            "You start knowing a player and an evil character. You're mad that they are that character, or every townsfolk will become poisoned the night you die.",
        "flavor": "What's up my gangstas!",
        "firstNight": 23
      },
      {
        "id": "drunkehdi_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/drunkehdi_quebradados.png",
        "otherNightReminder":
            "Choose which player that asked for beers is drunk. Wake up Drunk Ehdi and tell any number from 0 to the number of players that asked for beers.",
        "reminders": ["Drunk"],
        "remindersGlobal": ["Is Drunk Ehdi"],
        "name": "Drunk Ehdi",
        "team": "outsider",
        "ability":
            "You think you are Ehdi, but you are not. Each night, one of the players asking for beers becomes drunk.",
        "flavor": "I'll take three beers and a glass of wine.",
        "otherNight": 16
      },
      {
        "id": "walid_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/walid_quebradados.png",
        "otherNightReminder":
            "If the demon died when there are 5 or more players alive choose if you want to wake up Walid. If so, show him he's evil and the demon. Wake up the previous demon and show him he is Walid and good.",
        "reminders": ["Is Walid"],
        "name": "Walid",
        "team": "outsider",
        "ability":
            "If there are 5 or more players alive and the demon dies, you swap characters & alignment with them.",
        "flavor": "It's me, I'm the demon.",
        "otherNight": 12
      },
      {
        "id": "francisco_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/francisco_quebradados.png",
        "firstNightReminder":
            "Wake up Francisco and ask him to point at a player. Mark them as poisoned.",
        "otherNightReminder":
            "Move the poisoned marker to one closest alive good player.",
        "reminders": ["Poisoned"],
        "name": "Francisco",
        "team": "minion",
        "ability":
            "On your first night, choose one of your nearest good players.",
        "special": [
          {"name": "pointing", "type": "ability", "time": "day"}
        ],
        "flavor": "I'm the freaking Monk!",
        "firstNight": 12,
        "otherNight": 6
      },
      {
        "id": "bruno_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/bruno_quebradados.png",
        "otherNightReminder":
            "If this is the second night: Ask Bruno to name a player and guess their role. If successful, they become poisoned until they die. Mark players Bruno nominated as Poisoned.",
        "reminders": ["Poisoned"],
        "setup": true,
        "name": "Bruno",
        "team": "minion",
        "ability":
            "On your second night, choose a player and guess their role. If you guess correctly, they become poisoned until they die. The players you nominate are also poisoned until dusk next day. [+ Jo\u00e3o Rocha]",
        "special": [
          {"name": "pointing", "type": "ability", "time": "day"}
        ],
        "flavor": "Let's hard claim day one Jo\u00e3o?",
        "otherNight": 5
      },
      {
        "id": "lo_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/lo_quebradados.png",
        "firstNightReminder":
            "Wake up L\u00e9o and ask him to choose a character and the information they will receive.",
        "otherNightReminder":
            "Wake up L\u00e9o and ask him to choose a character and the information they will receive.",
        "reminders": ["Chosen"],
        "name": "L\u00e9o",
        "team": "minion",
        "ability":
            "Each night, choose a character different from last night. If in play, you choose which information they receive that night.",
        "special": [
          {"name": "pointing", "type": "ability", "time": "day"}
        ],
        "flavor": "I'm the tea lady!",
        "firstNight": 13,
        "otherNight": 4
      },
      {
        "id": "mariana_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/mariana_quebradados.png",
        "setup": true,
        "name": "Mariana",
        "team": "minion",
        "ability":
            "If your team would lose, guess exactly which players are Outsiders. If correct, your team wins instead. [-1 or +1 outsider]",
        "flavor": "Are you evil? Are you evil? Are you evil?"
      },
      {
        "id": "isak_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/isak_quebradados.png",
        "firstNightReminder":
            "Wake up Isak and ask him to choose a player. That player register as evil until the end of the game.",
        "otherNightReminder": "Wake up Isak and ask him to kill a player.",
        "reminders": ["Registers Evil", "Dead"],
        "name": "Isak",
        "team": "demon",
        "ability":
            "On your first night choose a player: they register as evil until the end of the game. Each night* kill a player. You might register as good & and as a Townsfolk or Outsider.",
        "special": [
          {"name": "pointing", "type": "ability", "time": "day"}
        ],
        "flavor": "I'm good, I promise.",
        "firstNight": 15,
        "otherNight": 8
      },
      {
        "id": "maria_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/maria_quebradados.png",
        "firstNightReminder":
            "If Maria hasn't used her ability, wake up Maria and ask her to use her ability. If so, ask her to point at another evil player. They will switch roles.",
        "otherNightReminder":
            "Wake up Maria and ask her to kill a player. If Maria hasn't used her ability, wake up Maria and ask her to use her ability. If so, ask her to point at another evil player. They will switch roles.",
        "reminders": ["Dead"],
        "name": "Maria",
        "team": "demon",
        "ability":
            "Each night*, choose a player: they die. Once per game, if there are 5 or more players alive you can choose to switch roles with one of your alive evil players. If you do, deaths tonight are arbitrary.",
        "special": [
          {"name": "pointing", "type": "ability", "time": "day"}
        ],
        "flavor": "I don't wanna be the demon anymore.",
        "firstNight": 14,
        "otherNight": 7
      },
      {
        "id": "toms_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/toms_quebradados.png",
        "otherNightReminder":
            "Wake up Tom\u00e1s and ask him to kill a player. If he kills a minion, ask him to point to another player. Show him that player's character.",
        "reminders": ["Dead", "Keeps ability", "Learn"],
        "setup": true,
        "name": "Tom\u00e1s",
        "team": "demon",
        "ability":
            "Each night*, choose a player: they die. If you kill a minion, they keep their ability, and you can choose another player. You learn their character. [-1 outsider]",
        "special": [
          {"name": "pointing", "type": "ability", "time": "day"}
        ],
        "flavor": "Speak english please!",
        "otherNight": 9
      },
      {
        "id": "quebradados_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/quebradados_quebradados.png",
        "otherNightReminder":
            "Wake up Quebra-Dados and ask them to point at any player that asked for beers. They become evil, and learn it.. If no one asked for beers, ask them to point at any player and choose a minion role. Wake them and tell them they are evil and that role, and show them who is their demon.",
        "reminders": ["Dead"],
        "setup": true,
        "name": "Quebra-Dados",
        "team": "demon",
        "ability":
            "Each night*, choose a player that asked for beers. They turn evil and learn who is the demon. If no good players asked for beers, choose a player and a minion. They will become that role, and evil. A player dies each night [No minions]",
        "special": [
          {"name": "pointing", "type": "ability", "time": "day"}
        ],
        "flavor": "You work at Quebra-Dados now!",
        "otherNight": 10
      },
      {
        "id": "judas_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/judas_quebradados.png",
        "firstNightReminder":
            "Ask Judas and ask him to point at a player. Mark them with the Traitor token.",
        "reminders": ["Traitor", "Won"],
        "name": "Judas",
        "team": "traveller",
        "ability":
            "On your first night, choose a player. If they nominate and successfully execute someone from their own team, you and they win no matter what. You are only exiled if you vote.",
        "special": [
          {"name": "pointing", "type": "ability", "time": "day"}
        ],
        "flavor": "Judas, Juda-ah-ah. Judas, Juda-ah-ah",
        "firstNight": 25
      },
      {
        "id": "chairnazi_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/chairnazi_quebradados.png",
        "firstNightReminder":
            "Chair nazi points to a player. Put the Chair nazi's 'Can't vote' reminder by the chosen player's character token.",
        "otherNightReminder":
            "Chair nazi points to a player. Put the Chair nazi's 'Can't vote' reminder by the chosen player's character token.",
        "reminders": ["Can't vote"],
        "name": "Chair Nazi",
        "team": "traveller",
        "ability":
            "Each night, choose an alive player you didn't chose yesterday. That player's votes count as zero during the following day's execution's phase. ",
        "special": [
          {"name": "pointing", "type": "ability", "time": "day"}
        ],
        "flavor": "That's my chair.",
        "firstNight": 11,
        "otherNight": 2
      },
      {
        "id": "barkingdog_quebradados",
        "image":
            "https://www.bloodstar.xyz/p/Toli/Quebra-Dados/barkingdog_quebradados.png",
        "firstNightReminder":
            "Barking dog points to a player. Put the Barking dog's 'Can't talk' reminder by the chosen player's character token. Wake the chosen player and show them \"This character selected you\" and point to the Barking dog's role.",
        "otherNightReminder":
            "Barking dog points to a player. Put the Barking dog's 'Can't talk' reminder by the chosen player's character token. Wake the chosen player and show them \"This character selected you\" and point to the Barking dog's role.",
        "reminders": ["Can't talk"],
        "name": "Barking Dog",
        "team": "traveller",
        "ability":
            "Each night, choose a player different from last night. They cannot talk during the following day until dusk, since you bark louder than them. If they talk, they die.",
        "special": [
          {"name": "pointing", "type": "ability", "time": "day"}
        ],
        "flavor": "BARK BARK BARK",
        "firstNight": 24,
        "otherNight": 23
      }
    ]
  },
  {
    "almanac": "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/almanac.html",
    "author": "Alex S",
    "pk": 634634,
    "logo": "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/_meta.png",
    "name": "Fall of Rome",
    "content": [
      {
        "almanac":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/almanac.html",
        "author": "Alex S",
        "id": "_meta",
        "logo": "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/_meta.png",
        "name": "Fall of Rome"
      },
      {
        "id": "sculptor_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/sculptor_fall_of_rome.png",
        "firstNightReminder":
            "Point to a player. Place the SCULPTURE token next to that player.",
        "otherNightReminder":
            "If the player with the SCULPTURE token nominated today. Show the Sculptor an evil thumbs down sign if the nominated player is evil. Otherwise: show the Sculptor a good thumbs up sign. Remove the NOMINATED token (if any).",
        "reminders": ["Sculpture", "Nominated"],
        "name": "Sculptor",
        "team": "townsfolk",
        "ability":
            "You start knowing a player. Each night*, you learn the alignment of their most recent nomination.",
        "flavor": "You'll find I spot the finer details...",
        "firstNight": 18,
        "otherNight": 19
      },
      {
        "id": "vestalvirgin_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/vestalvirgin_fall_of_rome.png",
        "firstNightReminder":
            "Show 1 good and 1 evil character token: one of these is in play. Place the LEARNS next to the in-play character. ",
        "otherNightReminder":
            "If the player with the LEARNS token died today, remove the token. Show 1 good and 1 evil character token: one of these is in play. Place the LEARNS next to the in-play character. ",
        "reminders": ["Learns"],
        "name": "Vestal Virgin",
        "team": "townsfolk",
        "ability":
            "You start knowing 1 good & 1 evil character, 1 of which is in-play. When they die, that night you learn 1 good & 1 evil character, 1 of which is in-play.",
        "flavor":
            "Goddess Vesta, I have received your message in the Vestal flame and for now I am enlightened. I will be back soon... thank you...",
        "firstNight": 19,
        "otherNight": 20
      },
      {
        "id": "physician_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/physician_fall_of_rome.png",
        "firstNightReminder":
            "The Physician points to two players not themselves. Mark both players with the PATIENT token.",
        "otherNightReminder":
            "Remove all PATIENT tokens. The Physician points to two players not themselves. Mark both players with the PATIENT token. If a player with a PATIENT token was killed by the Demon, place the 1ST DEMON token next to the Physician and wake the Physician and show them Demon token.",
        "reminders": ["Patient", "1st Demon"],
        "name": "Physician",
        "team": "townsfolk",
        "ability":
            "Each night, choose two players (not yourself): they are sober, healthy & get true info tonight. The 1st time the Demon kills one, you learn the Demon type.",
        "flavor": "Some patients recover, because they believe in doctors.",
        "firstNight": 17,
        "otherNight": 11
      },
      {
        "id": "legionary_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/legionary_fall_of_rome.png",
        "firstNightReminder":
            "Show the hand signal for the number (0, 1, 2, etc.) of living evil players between the Legionary and the next clockwise Legionary (exclusive).",
        "otherNightReminder":
            "Show the hand signal for the number (0, 1, 2, etc.) of living evil players between the Legionary and the next clockwise Legionary (exclusive).",
        "setup": true,
        "name": "Legionary",
        "team": "townsfolk",
        "ability":
            "Each night, you learn how many living evil players are sat clockwise between yourself and a living Legionary. [+0 to +2 Legionary]",
        "flavor":
            "We find that the Romans owed the conquest of the world to no other cause than continual military training, exact observance of discipline in their camps, and unwearied cultivation of the other arts of war.",
        "firstNight": 20,
        "otherNight": 21,
        "special": [
          {"type": "selection", "name": "bag-duplicate"}
        ]
      },
      {
        "id": "trumpeter_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/trumpeter_fall_of_rome.png",
        "otherNightReminder":
            "Show the hand signal for the number (0, 1, 2, etc.) of evil players who publicly claimed to be Spartacus today.",
        "reminders": ["Evil Claim"],
        "name": "Trumpeter",
        "team": "townsfolk",
        "ability":
            "Each night*, you learn how many evil players publicly claimed to be Spartacus today.",
        "flavor":
            "I have done everything that I should, but the outcome is in the hand of fortune.",
        "otherNight": 22
      },
      {
        "id": "mortician_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/mortician_fall_of_rome.png",
        "otherNightReminder":
            "If a player was executed today: Show the head signal (nod 'yes', shake 'no') for whether one of the neighbours is evil.",
        "reminders": ["Recently Executed"],
        "name": "Mortician",
        "team": "townsfolk",
        "ability":
            "Each night*, if a player died by execution today you learn if either of their living neighbours are evil.",
        "flavor": "Let me lay you to rest... my old friend...",
        "otherNight": 23
      },
      {
        "id": "standardbearer_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/standardbearer_fall_of_rome.png",
        "otherNightReminder":
            "If the Standard Bearer's public statement was true: show the head signal (nod 'true'). Otherwise: show the head signal (shake 'false').",
        "reminders": ["True", "False"],
        "name": "Standard Bearer",
        "team": "townsfolk",
        "ability":
            "When you are nominated, you may make a unique public statement about the nominator (not yourself). Tonight, you learn if the statement was true.",
        "flavor": "Say not always what you know. But always know what you say.",
        "otherNight": 24
      },
      {
        "id": "centurion1_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/centurion1_fall_of_rome.png",
        "reminders": ["Drunk"],
        "name": "Centurion",
        "team": "townsfolk",
        "ability":
            "If you nominate & execute a living player, their team loses. You are safe from the Demon. If you publicly claimed to be Spartacus today, you are drunk until dawn.",
        "flavor":
            "It is easier to find men who will volunteer to die, than to find those who are willing to endure pain with patience."
      },
      {
        "id": "merchant_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/merchant_fall_of_rome.png",
        "otherNightReminder":
            "If the Merchant has not yet used their ability: the Merchant either shows a shake 'no' head signal, or a nod 'yes' head signal. If the Merchant chose 'yes', show the character tokens of players with a NOMINATED token (in any order). Place the NO ABILITY token.",
        "reminders": ["Nominated", "No Ability"],
        "name": "Merchant",
        "team": "townsfolk",
        "ability":
            "Once per game, at night*, choose to learn which characters have nominated you.",
        "flavor": "Greed is but a word jealous men inflict upon the ambitious.",
        "otherNight": 26
      },
      {
        "id": "gladiator_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/gladiator_fall_of_rome.png",
        "otherNightReminder":
            "If the Gladiator used their ability today wake the Gladiator and the player they chose: both players silently play roshambo (rock \"fist\", scissors \"two fingers\" or paper \"flat hand\"). If they both chose the same, play again. Play until someone wins. The loser dies.",
        "reminders": ["Duel", "Dead", "No Ability"],
        "name": "Gladiator",
        "team": "townsfolk",
        "ability":
            "Once per game, during the day, publicly choose a living player. Tonight, you and they wake & silently play roshambo: whoever loses dies (someone must lose).",
        "flavor": "Are you not entertained!",
        "otherNight": 18
      },
      {
        "id": "actor_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/actor_fall_of_rome.png",
        "otherNightReminder":
            "If the Actor used their ability today: Show the hand signal for the number (0, 1, 2, or 3) of CORRECT markers. Place the NO ABILITY marker.",
        "reminders": ["Correct", "No Ability"],
        "name": "Actor",
        "team": "townsfolk",
        "ability":
            "Once per game, during the day, publicly guess 3 players' character types (not yourself, 1 guess per type). That night, you learn how many you got correct. ",
        "flavor": "Have I played the part well? Then applaud me as I exit!",
        "otherNight": 25
      },
      {
        "id": "blacksmith_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/blacksmith_fall_of_rome.png",
        "otherNightReminder":
            "If the Blacksmith was killed by a Demon. Show the Blacksmith a not-in-play Townsfolk character token. Swap the not-in-play character token with the Blacksmith token. Place the IS THE BLACKSMITH token next to the not-in-play character token. Wake the Blacksmith and show 'You are', then their new character ability.",
        "reminders": ["Is the Blacksmith"],
        "name": "Blacksmith",
        "team": "townsfolk",
        "ability":
            "The 1st time the Demon kills you, you live & gain a not-in-play Townsfolk ability.",
        "flavor": "Every new beginning comes from some other beginning’s end.",
        "otherNight": 17
      },
      {
        "id": "scholar_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/scholar_fall_of_rome.png",
        "otherNightReminder":
            "If the Scholar nominated an Outsider today, place the NO ABILITY token. Wake the nominated player. Show 'You are', then their new character token.",
        "reminders": ["Lectured", "No Ability"],
        "setup": true,
        "name": "Scholar",
        "team": "townsfolk",
        "ability":
            "The 1st time you nominate a living Outsider, they immediately become a not-in-play Townsfolk. [+1 Outsider]",
        "flavor":
            "When you arise in the morning, think of what a precious privilege it is to be alive - to breathe, to think, to enjoy, to love.",
        "otherNight": 2
      },
      {
        "id": "thetwins_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/thetwins_fall_of_rome.png",
        "firstNightReminder":
            "Point to a player. Place the REMUS token next to that player.",
        "otherNightReminder":
            "If The Twins has a TOWNSFOLK DRUNK token, all Townsfolk are drunk until dusk.",
        "reminders": ["Remus", "Townsfolk Drunk"],
        "name": "The Twins",
        "team": "outsider",
        "ability":
            "You start knowing a player: if either of you are executed, all Townsfolk are drunk until dusk tomorrow.",
        "flavor":
            "The quarrel that arose between Remus and Romulus demonstrated the division of the earthly city against itself...",
        "firstNight": 16,
        "otherNight": 10
      },
      {
        "id": "winemaker_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/winemaker_fall_of_rome.png",
        "firstNightReminder":
            "Place either the ODD or EVEN token. If ODD, the Winemaker is drunk on the 1st night and every other night after. Otherwise: the Winemaker is drunk on the 2nd night and every other night after.",
        "otherNightReminder":
            "Check which ODD or EVEN token is placed. If an odd night and the ODD token is placed, the Winemaker is drunk until dusk. If an even night and the EVEN token is placed, the Winemaker is drunk until dusk. Otherwise their Townsfolk neighbours are drunk until dusk.",
        "reminders": ["Odd", "Even", "Drunk"],
        "name": "Winemaker",
        "team": "outsider",
        "ability":
            "Your Townsfolk neighbours are drunk, but every other night, you are drunk until dusk, even if you are dead.",
        "flavor": "In wine, there's truth.",
        "firstNight": 15,
        "otherNight": 9
      },
      {
        "id": "spartacus_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/spartacus_fall_of_rome.png",
        "reminders": ["Guess Used"],
        "name": "Spartacus",
        "team": "outsider",
        "ability":
            "If an evil player guesses you (once), your team loses. You might register as a Townsfolk; each day, if you did not publicly claim to be Spartacus, you don't.",
        "flavor": "Death is the only freedom a slave knows..."
      },
      {
        "id": "badomen_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/badomen_fall_of_rome.png",
        "remindersGlobal": ["Is a Bad Omen"],
        "setup": true,
        "name": "Bad Omen",
        "team": "outsider",
        "ability":
            "You do not know you are a Bad Omen. You think you are a Townsfolk, but you receive false information. You might register as evil, even if dead.",
        "flavor":
            "The nightmares, they talk to me, they comfort me... come closer, let me spread their message...",
        "special": [
          {"type": "selection", "name": "bag-disabled"}
        ]
      },
      {
        "id": "temptress_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/temptress_fall_of_rome.png",
        "firstNightReminder":
            "The Temptress points to two players. Place the SEDUCED token next to the two players. Wake the two players separately. Show the 'This character selected you' card, then the Temptress token. ",
        "otherNightReminder":
            "If a player with a SEDUCED token is executed and dies, remove their SEDUCED token. The player with the remaining SEDUCED turns evil. Remove their SEDUCED token and replace it with the EVIL token. Wake the evil player and show them the 'You are' card and the thumbs down evil signal.",
        "reminders": ["Seduced", "Evil"],
        "name": "Temptress",
        "team": "minion",
        "ability":
            "On your 1st night choose two players: they learn that they were chosen. The 1st time one of them dies by execution, the other becomes evil that night.",
        "flavor":
            "Nothing could part us in life, but now in death, we are likely to change places...",
        "firstNight": 12,
        "otherNight": 3
      },
      {
        "id": "haruspex_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/haruspex_fall_of_rome.png",
        "firstNightReminder":
            "The Haruspex points to a player. Show that player’s character token. Place a FORETOLD token next that player. ",
        "otherNightReminder":
            "The Haruspex points to a player. Show that player’s character token. Place a FORETOLD token next that player: if that player already has a FORETOLD token. That player dies, also place the CAN'T KILL token next to the Haruspex.",
        "reminders": ["Foretold", "Dead", "Can't Kill"],
        "setup": true,
        "name": "Haruspex",
        "team": "minion",
        "ability":
            "Each night, choose a player: you learn their character. The 1st player you choose twice in this way, dies. [+ Spartacus]",
        "flavor":
            "I see it clearly now that the gods have spoken... you'll make a great sacrifice!",
        "firstNight": 14,
        "otherNight": 16
      },
      {
        "id": "glykon1_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/glykon1_fall_of_rome.png",
        "reminders": ["Snake Bite", "Poisoned"],
        "name": "Glykon",
        "team": "minion",
        "ability":
            "You might register as good. Players you nominate register as their opposite alignment until dawn, and if they were good, they are also poisoned until dawn.",
        "flavor":
            "It is difficult for one to know when they have been betrayed by the gods, when the only gods they know do not exist. "
      },
      {
        "id": "augur_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/augur_fall_of_rome.png",
        "name": "Augur",
        "team": "minion",
        "ability":
            "If a Townsfolk nominates you, they immediately become a Bad Omen.",
        "flavor": "Hoc tibi maledicam!"
      },
      {
        "id": "cleopatra_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/cleopatra_fall_of_rome.png",
        "firstNightReminder": "Cleopatra points to two players. ",
        "otherNightReminder":
            "If a previously chosen player nominated today they die. Remove all CHOSEN tokens. Cleopatra points to two players. Place the CHOSEN token next to both players.",
        "reminders": ["Chosen", "Dead"],
        "name": "Cleopatra",
        "team": "demon",
        "ability":
            "Each night, choose two players: if they nominate tomorrow, they die that night. Each day, if a good player (Travellers don't count) does not nominate, evil wins. ",
        "flavor":
            "Fool! Don't you see now that I could have poisoned you a hundred times had I been able to live without you!",
        "firstNight": 13,
        "otherNight": 12
      },
      {
        "id": "crassus_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/crassus_fall_of_rome.png",
        "otherNightReminder":
            "Crassus points to a player. That player dies. If the 1st Crassus publicly claimed to be Spartacus today and points to themselves (or was executed), with 5 or more players alive, replace the character of 1 evil player with a spare Crassus token. Show the 'You are' card, then the Crassus token. ",
        "reminders": ["Dead", "1st Crassus"],
        "name": "Crassus",
        "team": "demon",
        "ability":
            "Each night*, choose a player: they die. If the 1st Crassus publicly claims to be Spartacus & dies with 5 or more players alive, an evil player becomes Crassus.",
        "flavor": "Those who aim at great deeds must also suffer greatly...",
        "otherNight": 13
      },
      {
        "id": "hannibal_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/hannibal_fall_of_rome.png",
        "firstNightReminder":
            "Select 2 good players and place the IS HANNIBAL reminder tokens. Wake all Minions together, show them the Hannibals and show them three not-in-play character tokens (these must be the same).",
        "otherNightReminder":
            "Choose a player, that player dies. If a Hannibal died today, wake that player and show them the 'You are' card, the Hannibal token and then the thumbs up good signal.",
        "remindersGlobal": ["Is Hannibal", "Dead"],
        "setup": true,
        "name": "Hannibal",
        "team": "demon",
        "ability":
            "You think you are a good character, but you are not. Minions learn 3 bluffs. Each night*, a player might die. The 1st Hannibal to die, becomes good. [+1 Hannibal] ",
        "attribution":
            "Hannibal was awarded the 4th place trophy in the Unofficial's \"Custom Demon Contest\".",
        "flavor": "I will either find a way or make one.",
        "firstNight": 11,
        "otherNight": 14,
        "special": [
          {"type": "selection", "name": "bag-disabled"}
        ]
      },
      {
        "id": "caesar_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/caesar_fall_of_rome.png",
        "otherNightReminder":
            "If a Minion was executed today, Caesar points to two players. Otherwise: Caesar points to a player. Chosen players die.",
        "reminders": ["Betrayal", "Dead"],
        "name": "Caesar",
        "team": "demon",
        "ability":
            "Each night*, choose a player: they die. The 1st time an evil player dies by execution, that night, choose an additional player: they die.",
        "flavor": "I came, I saw, I conquered.",
        "otherNight": 15
      },
      {
        "id": "mercenary_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/mercenary_fall_of_rome.png",
        "otherNightReminder":
            "Show the Mercenary a character that publicly claimed to be Spartacus today, they have that ability tonight and tomorrow until dusk. ",
        "reminders": ["Good", "Evil", "Good Ability", "Evil Ability"],
        "name": "Mercenary",
        "team": "traveller",
        "ability":
            "Each night*, gain the ability of a player who publicly claimed Spartacus today. If a Mercenary is exiled, you are exiled too. [+1 Mercenary of opposing alignment]",
        "flavor": "Let the buyer beware...  ...and beware me too!",
        "otherNight": 4
      },
      {
        "id": "architect_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/architect_fall_of_rome.png",
        "otherNightReminder":
            "The Architect points to a player. Choose which ability will effect the chosen player. Treat them accordingly (not-in-play character or character swap). Wake affected players individually. Show 'You are', then their new character token.",
        "reminders": ["Redesigned"],
        "name": "Architect",
        "team": "traveller",
        "ability":
            "Each night*, choose a player: 1) they become a not-in-play character of the same type, or 2) they swap characters with a player of the same type.",
        "flavor":
            "I found Rome a city of bricks and left it the city of marbles.",
        "otherNight": 7
      },
      {
        "id": "sibyl_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/sibyl_fall_of_rome.png",
        "name": "Sibyl",
        "team": "traveller",
        "ability":
            "Each day, after the 1st execution, you may publicly choose a dead player: they may nominate. If the majority of the dead and yourself agree, they are executed.",
        "attribution":
            "Original Character concept by Kohav. Many thanks to them for giving the green light to bringing it to Fall of Rome!",
        "flavor":
            "To such a degree will I be changed that I will be visible to no one; but I will be recognized by my voice. And with my voice, to you, I give a second chance."
      },
      {
        "id": "highpriest1_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/highpriest1_fall_of_rome.png",
        "otherNightReminder":
            "If the High Priest successfully blessed a player today, something good happens to that player and/or their team.",
        "reminders": ["Blessed", "Failed"],
        "name": "High Priest",
        "team": "traveller",
        "ability":
            "Each day, publicly choose a unique living player to bless: if a majority of players agree, something good happens to them.",
        "flavor":
            "The first and greatest punishment of the sinner is the conscience of sin.",
        "otherNight": 5
      },
      {
        "id": "highpriest2_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/highpriest2_fall_of_rome.png",
        "otherNightReminder":
            "If the High Priest successfully blessed a player today, wake the High Priest. The High Priest chooses whether the statement is true tomorrow with a hand signal (true \"thumbs up\", false \"thumbs down\").",
        "reminders": ["Blessed", "Failed", "True", "False"],
        "name": "High Priest",
        "team": "traveller",
        "ability":
            "Each day, publicly choose a unique living player to bless: if a majority of players agree, tomorrow they may learn a statement. Tonight, choose if it’s true.",
        "flavor":
            "The first and greatest punishment of the sinner is the conscience of sin.",
        "otherNight": 6
      },
      {
        "id": "emperor_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/emperor_fall_of_rome.png",
        "otherNightReminder":
            "If a player was executed today and the outcome was not overturned by the Emperor: Show the hand signal (thumbs down 'evil', thumbs up 'good') for the players alignment.",
        "reminders": ["Executed"],
        "name": "Emperor",
        "team": "traveller",
        "ability":
            "Each day, choose the 1st executions outcome. If you choose to protect today's execution: they survive. Otherwise, tonight you learn their alignment.",
        "flavor": "Which death is preferable to every other? The unexpected.",
        "otherNight": 8
      },
      {
        "id": "iamspartacus_fall_of_rome",
        "image":
            "https://www.bloodstar.xyz/p/AlexS/Fall_of_Rome/iamspartacus_fall_of_rome.png",
        "reminders": ["I am Spartacus!"],
        "name": "\"I Am Spartacus!\"",
        "team": "fabled",
        "ability":
            "Each day, up to half the living players (rounded up & Travellers don’t count) may publicly claim to be Spartacus.",
        "flavor": "I am Spartacus!"
      },
    ]
  },
  {
    "pk": 947,
    "name": "Extension Cord",
    "version": "5.1.0",
    "author": "Viva La Sam",
    "content": [
      {
        "id": "_meta",
        "logo": "https://i.imgur.com/OAs1fvK.png",
        "name": "Extension Cord",
        "author": "Viva La Sam"
      },
      {"id": "investigator"},
      {"id": "pixie"},
      {"id": "empath"},
      {"id": "dreamer"},
      {"id": "mathematician"},
      {"id": "oracle"},
      {"id": "monk"},
      {"id": "artist"},
      {"id": "fisherman"},
      {"id": "huntsman"},
      {"id": "soldier"},
      {"id": "ravenkeeper"},
      {"id": "cannibal"},
      {"id": "puzzlemaster"},
      {"id": "recluse"},
      {"id": "mutant"},
      {"id": "damsel"},
      {"id": "barber"},
      {"id": "poisoner"},
      {"id": "spy"},
      {"id": "scarletwoman"},
      {"id": "boomdandy"},
      {"id": "marionette"},
      {"id": "nodashii"},
      {"id": "bishop"},
      {"id": "bonecollector"},
      {"id": "bureaucrat"},
      {"id": "butcher"},
      {"id": "matron"},
      {"id": "sentinel"}
    ],
    "score": 13
  },
  {
    "pk": 148,
    "name": "The Midnight Oasis",
    "version": "3.8.0",
    "author": "Zets",
    "content": [
      {
        "id": "_meta",
        "logo": "https://cdn-icons-png.flaticon.com/512/6421/6421037.png",
        "name": "The Midnight Oasis",
        "author": "Zets"
      },
      {"id": "noble"},
      {"id": "balloonist"},
      {"id": "snakecharmer"},
      {"id": "savant"},
      {"id": "amnesiac"},
      {"id": "engineer"},
      {"id": "huntsman"},
      {"id": "professor"},
      {"id": "fisherman"},
      {"id": "farmer"},
      {"id": "poppygrower"},
      {"id": "cannibal"},
      {"id": "atheist"},
      {"id": "damsel"},
      {"id": "drunk"},
      {"id": "golem"},
      {"id": "barber"},
      {"id": "mezepheles"},
      {"id": "poisoner"},
      {"id": "pithag"},
      {"id": "psychopath"},
      {"id": "alhadikhia"},
      {"id": "vigormortis"},
      {"id": "sentinel"},
      {"id": "spiritofivory"}
    ],
    "score": 9
  },
  {
    "pk": 5957,
    "name": "Regicide",
    "version": "1.0.0",
    "author": "Ehdi",
    "content": [
      {"id": "_meta", "name": "Regicide", "author": "Ehdi"},
      {"id": "steward"},
      {"id": "knight"},
      {"id": "noble"},
      {"id": "chef"},
      {"id": "preacher"},
      {"id": "chambermaid"},
      {"id": "king"},
      {"id": "fortuneteller"},
      {"id": "flowergirl"},
      {"id": "slayer"},
      {"id": "farmer"},
      {"id": "choirboy"},
      {"id": "minstrel"},
      {"id": "saint"},
      {"id": "recluse"},
      {"id": "klutz"},
      {"id": "drunk"},
      {"id": "poisoner"},
      {"id": "harpy"},
      {"id": "witch"},
      {"id": "mezepheles"},
      {"id": "pukka"},
      {"id": "imp"},
      {"id": "vigormortis"}
    ],
    "score": 0
  },
  {
    "pk": 2,
    "name": "Catfishing",
    "version": "11.1.0",
    "author": "Emily",
    "content": [
      {"id": "investigator"},
      {"id": "chef"},
      {"id": "grandmother"},
      {"id": "balloonist"},
      {"id": "dreamer"},
      {"id": "fortuneteller"},
      {"id": "snakecharmer"},
      {"id": "gambler"},
      {"id": "savant"},
      {"id": "philosopher"},
      {"id": "ravenkeeper"},
      {"id": "amnesiac"},
      {"id": "cannibal"},
      {"id": "drunk"},
      {"id": "recluse"},
      {"id": "sweetheart"},
      {"id": "mutant"},
      {"id": "lunatic"},
      {"id": "godfather"},
      {"id": "cerenovus"},
      {"id": "pithag"},
      {"id": "widow"},
      {"id": "imp"},
      {"id": "vigormortis"},
      {"id": "fanggu"}
    ],
    "score": 44
  },
  {
    "pk": 5078,
    "name": "Harold Holt's Revenge",
    "version": "1.1.0",
    "author": "Theo",
    "content": [
      {"id": "librarian"},
      {"id": "investigator"},
      {"id": "shugenja"},
      {"id": "balloonist"},
      {"id": "dreamer"},
      {"id": "snakecharmer"},
      {"id": "towncrier"},
      {"id": "slayer"},
      {"id": "savant"},
      {"id": "amnesiac"},
      {"id": "seamstress"},
      {"id": "courtier"},
      {"id": "magician"},
      {"id": "mutant"},
      {"id": "damsel"},
      {"id": "lunatic"},
      {"id": "politician"},
      {"id": "cerenovus"},
      {"id": "pithag"},
      {"id": "baron"},
      {"id": "goblin"},
      {"id": "marionette"},
      {"id": "leviathan"}
    ],
    "score": 6
  },
  {
    "pk": 3044,
    "name": "Starry Night",
    "version": "1.0.0",
    "author": "Hiti",
    "content": [
      {"id": "_meta", "name": "Starry Night", "author": "hiti"},
      {"id": "clockmaker"},
      {"id": "knight"},
      {"id": "pixie"},
      {"id": "snakecharmer"},
      {"id": "mathematician"},
      {"id": "general"},
      {"id": "highpriestess"},
      {"id": "innkeeper"},
      {"id": "gossip"},
      {"id": "huntsman"},
      {"id": "professor"},
      {"id": "magician"},
      {"id": "mayor"},
      {"id": "goon"},
      {"id": "plaguedoctor"},
      {"id": "damsel"},
      {"id": "drunk"},
      {"id": "cerenovus"},
      {"id": "pithag"},
      {"id": "baron"},
      {"id": "organgrinder"},
      {"id": "vigormortis"},
      {"id": "nodashii"},
      {"id": "shabaloth"},
      {"id": "po"},
      {"id": "djinn"}
    ],
    "score": 0
  },
  {
    "pk": 5061,
    "name": "Outed Evil",
    "version": "4.7.0",
    "author": "Manny",
    "content": [
      {"id": "_meta", "name": "Outed Evil v4.7"},
      {"id": "alchemist"},
      {"id": "sailor"},
      {"id": "general"},
      {"id": "fortuneteller"},
      {"id": "snakecharmer"},
      {"id": "savant"},
      {"id": "fisherman"},
      {"id": "huntsman"},
      {"id": "philosopher"},
      {"id": "juggler"},
      {"id": "tealady"},
      {"id": "poppygrower"},
      {"id": "cannibal"},
      {"id": "heretic"},
      {"id": "damsel"},
      {"id": "politician"},
      {"id": "barber"},
      {"id": "lunatic"},
      {"id": "poisoner"},
      {"id": "devilsadvocate"},
      {"id": "fearmonger"},
      {"id": "psychopath"},
      {"id": "goblin"},
      {"id": "imp"},
      {"id": "lleech"},
      {"id": "apprentice"},
      {"id": "thief"},
      {"id": "deviant"},
      {"id": "bureaucrat"},
      {"id": "butcher"},
      {"id": "sentinel"}
    ],
    "score": 2
  },
  {
    "pk": 5160,
    "name": "One Quiet Night",
    "version": "1.0.0",
    "author": "The Good Couch",
    "content": [
      {
        "id": "_meta",
        "logo": "https://i.imgur.com/Eabeciu.png",
        "name": "One Quiet Night",
        "author": "The Good Couch",
        "isOfficial": false
      },
      {"id": "noble"},
      {"id": "librarian"},
      {"id": "pixie"},
      {"id": "empath"},
      {"id": "undertaker"},
      {"id": "innkeeper"},
      {"id": "monk"},
      {"id": "gossip"},
      {"id": "savant"},
      {"id": "artist"},
      {"id": "soldier"},
      {"id": "farmer"},
      {"id": "mayor"},
      {"id": "acrobat"},
      {"id": "tinker"},
      {"id": "saint"},
      {"id": "drunk"},
      {"id": "poisoner"},
      {"id": "spy"},
      {"id": "assassin"},
      {"id": "summoner"},
      {"id": "pukka"},
      {"id": "nodashii"},
      {"id": "imp"},
      {"id": "vortox"}
    ],
    "score": 0
  },
  {
    "pk": 5120,
    "name": "How could it be?",
    "version": "2.7.0",
    "author": "Sky",
    "content": [
      {"id": "_meta", "name": "How could it be?", "author": "Sky"},
      {"id": "pixie"},
      {"id": "seamstress"},
      {"id": "villageidiot"},
      {"id": "fortuneteller"},
      {"id": "oracle"},
      {"id": "savant"},
      {"id": "towncrier"},
      {"id": "cultleader"},
      {"id": "innkeeper"},
      {"id": "gambler"},
      {"id": "cannibal"},
      {"id": "amnesiac"},
      {"id": "mayor"},
      {"id": "drunk"},
      {"id": "moonchild"},
      {"id": "sweetheart"},
      {"id": "barber"},
      {"id": "godfather"},
      {"id": "harpy"},
      {"id": "widow"},
      {"id": "summoner"},
      {"id": "assassin"},
      {"id": "vortox"},
      {"id": "nodashii"},
      {"id": "po"},
      {"id": "bonecollector"},
      {"id": "harlot"},
      {"id": "apprentice"},
      {"id": "deviant"},
      {"id": "butcher"}
    ],
    "score": 0
  },
  {
    "pk": 3326,
    "name": "To Be the Chang",
    "version": "1.1.1",
    "author": "提线政客",
    "content": [
      {"id": "_meta", "name": "To Be the Chang", "author": "提线政客"},
      {"id": "pixie"},
      {"id": "flowergirl"},
      {"id": "shugenja"},
      {"id": "fisherman"},
      {"id": "cannibal"},
      {"id": "virgin"},
      {"id": "innkeeper"},
      {"id": "tealady"},
      {"id": "gossip"},
      {"id": "exorcist"},
      {"id": "farmer"},
      {"id": "dreamer"},
      {"id": "lycanthrope"},
      {"id": "lunatic"},
      {"id": "heretic"},
      {"id": "politician"},
      {"id": "plaguedoctor"},
      {"id": "vizier"},
      {"id": "harpy"},
      {"id": "psychopath"},
      {"id": "devilsadvocate"},
      {"id": "vigormortis"},
      {"id": "fanggu"},
      {"id": "po"},
      {"id": "ojo"},
      {"id": "bishop"},
      {"id": "butcher"},
      {"id": "gunslinger"},
      {"id": "judge"},
      {"id": "voudon"}
    ],
    "score": 0
  },
  {
    "pk": 3490,
    "name": "One Eye Closed",
    "version": "1.0.0",
    "author": "serene",
    "content": [
      {"id": "_meta", "name": "One Eye Closed", "author": "serene"},
      {"id": "shugenja"},
      {"id": "pixie"},
      {"id": "sailor"},
      {"id": "general"},
      {"id": "snakecharmer"},
      {"id": "flowergirl"},
      {"id": "juggler"},
      {"id": "seamstress"},
      {"id": "philosopher"},
      {"id": "tealady"},
      {"id": "magician"},
      {"id": "virgin"},
      {"id": "cannibal"},
      {"id": "plaguedoctor"},
      {"id": "heretic"},
      {"id": "drunk"},
      {"id": "lunatic"},
      {"id": "devilsadvocate"},
      {"id": "assassin"},
      {"id": "scarletwoman"},
      {"id": "marionette"},
      {"id": "vigormortis"},
      {"id": "fanggu"},
      {"id": "ojo"},
      {"id": "vortox"}
    ],
    "score": 0
  },
  {
    "pk": 5523,
    "name": "Foolish Idiots",
    "version": "1.0.0",
    "author": "TPI",
    "content": [
      {"id": "_meta", "name": "Foolish Idiots", "author": "TPI"},
      {"id": "knight"},
      {"id": "grandmother"},
      {"id": "villageidiot"},
      {"id": "balloonist"},
      {"id": "cultleader"},
      {"id": "flowergirl"},
      {"id": "towncrier"},
      {"id": "fisherman"},
      {"id": "seamstress"},
      {"id": "fool"},
      {"id": "virgin"},
      {"id": "cannibal"},
      {"id": "banshee"},
      {"id": "saint"},
      {"id": "mutant"},
      {"id": "drunk"},
      {"id": "barber"},
      {"id": "poisoner"},
      {"id": "devilsadvocate"},
      {"id": "harpy"},
      {"id": "goblin"},
      {"id": "lleech"},
      {"id": "po"},
      {"id": "vigormortis"},
      {"id": "fanggu"}
    ],
    "score": 0
  },
  {
    "pk": 155,
    "name": "Dealer's Choice",
    "version": "1.0.0",
    "author": "Navean",
    "content": [
      {
        "id": "_meta",
        "logo": "https://i.postimg.cc/X7WCYn1G/dealer-s-choice-icon.png",
        "name": "Dealer's Choice",
        "author": "Navean"
      },
      {"id": "librarian"},
      {"id": "pixie"},
      {"id": "balloonist"},
      {"id": "fortuneteller"},
      {"id": "monk"},
      {"id": "amnesiac"},
      {"id": "fisherman"},
      {"id": "slayer"},
      {"id": "huntsman"},
      {"id": "farmer"},
      {"id": "magician"},
      {"id": "cannibal"},
      {"id": "atheist"},
      {"id": "saint"},
      {"id": "snitch"},
      {"id": "mutant"},
      {"id": "damsel"},
      {"id": "drunk"},
      {"id": "politician"},
      {"id": "poisoner"},
      {"id": "cerenovus"},
      {"id": "goblin"},
      {"id": "marionette"},
      {"id": "fanggu"},
      {"id": "vigormortis"}
    ],
    "score": 2
  },
  {
    "pk": 141,
    "name": "Whose Side Are You On?!",
    "version": "1.2.0",
    "author": "Pure Awesome",
    "content": [
      {"id": "magician"},
      {"id": "snakecharmer"},
      {"id": "bountyhunter"},
      {"id": "atheist"},
      {"id": "cannibal"},
      {"id": "balloonist"},
      {"id": "pixie"},
      {"id": "seamstress"},
      {"id": "poppygrower"},
      {"id": "empath"},
      {"id": "fortuneteller"},
      {"id": "ravenkeeper"},
      {"id": "washerwoman"},
      {"id": "lunatic"},
      {"id": "drunk"},
      {"id": "recluse"},
      {"id": "mutant"},
      {"id": "marionette"},
      {"id": "baron"},
      {"id": "mezepheles"},
      {"id": "cerenovus"},
      {"id": "legion"},
      {"id": "vortox"},
      {"id": "pukka"},
      {"id": "nodashii"},
      {"id": "thief"},
      {"id": "scapegoat"},
      {"id": "bonecollector"},
      {"id": "barista"},
      {"id": "harlot"},
      {"id": "djinn"}
    ],
    "score": 0
  }
];
