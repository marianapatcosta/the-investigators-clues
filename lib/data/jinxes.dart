const jinxes = [
  {
    "id": "mathematician",
    "jinx": [
      {
        "id": "chambermaid",
        "reason":
            "The Chambermaid learns if the Mathematician wakes tonight or not, even though the Chambermaid wakes first."
      },
      {
        "id": "lunatic",
        "reason":
            "The Mathematician learns if the Lunatic attacks a different player(s) than the real Demon attacked."
      }
    ]
  },
  {
    "id": "cannibal",
    "jinx": [
      {
        "id": "butler",
        "reason":
            "If the Cannibal gains the Butler ability, the Cannibal learns this."
      },
      {
        "id": "juggler",
        "reason":
            "If the Juggler guesses on their first day and dies by execution, tonight the living Cannibal learns how many guesses the Juggler got correct."
      },
      {
        "id": "zealot",
        "reason":
            "If the Cannibal gains the Zealot ability, the Cannibal learns this."
      },
      {
        "id": "poppygrower",
        "reason":
            "If the Cannibal eats the Poppy Grower, then dies or loses the Poppy Grower ability, the Demon and Minions learn each other that night."
      }
    ]
  },
  {
    "id": "pithag",
    "jinx": [
      {
        "id": "damsel",
        "reason":
            "If a Pit-Hag creates a Damsel, the Storyteller chooses which player it is."
      },
      {
        "id": "politician",
        "reason":
            "If the Pit-Hag turns an evil player into the Politician, they can't turn good due to their own ability."
      },
      {
        "id": "villageidiot",
        "reason":
            "If there is a spare token, the Pit-Hag can create an extra Village Idiot. If so, the drunk Village Idiot might change."
      },
      {
        "id": "cultleader",
        "reason":
            "If the Pit-Hag turns an evil player into the Cult Leader, they can't turn good due to their own ability."
      },
      {
        "id": "goon",
        "reason":
            "If the Pit-Hag turns an evil player into the Goon, they can't turn good due to their own ability."
      },
      {
        "id": "ogre",
        "reason":
            "If the Pit-Hag turns an evil player into the Ogre, they can't turn good due to their own ability."
      }
    ]
  },
  {
    "id": "cerenovus",
    "jinx": [
      {
        "id": "goblin",
        "reason":
            "The Cerenovus may choose to make a player mad that they are the Goblin."
      }
    ]
  },
  {
    "id": "leviathan",
    "jinx": [
      {
        "id": "soldier",
        "reason":
            "If the Leviathan is in play, the Soldier is safe from all evil abilities."
      },
      {
        "id": "monk",
        "reason":
            "If the Leviathan is in play, the Monk-protected-player is safe from all evil abilities."
      },
      {
        "id": "innkeeper",
        "reason":
            "If the Leviathan is in play, the Innkeeper-protected-players are safe from all evil abilities."
      },
      {
        "id": "ravenkeeper",
        "reason":
            "Each night*, the Leviathan chooses an alive player (different to previous nights): a chosen Ravenkeeper uses their ability but does not die."
      },
      {
        "id": "banshee",
        "reason":
            "Each night*, the Leviathan chooses an alive good player (different to previous nights): a chosen Banshee dies & gains their ability."
      },
      {
        "id": "sage",
        "reason":
            "Each night*, the Leviathan chooses an alive good player (different to previous nights): a chosen Sage uses their ability but does not die."
      },
      {
        "id": "farmer",
        "reason":
            "Each night*, the Leviathan chooses an alive good player (different to previous nights): a chosen Farmer uses their ability but does not die."
      },
      {
        "id": "mayor",
        "reason":
            "If the Leviathan is in play & no execution occurs on day 5, good wins."
      },
      {
        "id": "exorcist",
        "reason":
            "Evil does not win when more than 1 good player has been executed, if the Exorcist is alive and has ever successfully chosen the Leviathan."
      },
      {
        "id": "grandmother",
        "reason":
            "If Leviathan is in play and the Grandchild dies by execution, evil wins."
      },
      {
        "id": "king",
        "reason":
            "If the Leviathan is in play, and at least 1 player is dead, the King learns an alive character each night."
      },
      {
        "id": "hatter",
        "reason":
            "If the Hatter dies on or after day 5, the Demon cannot choose Leviathan."
      },
      {
        "id": "pithag",
        "reason": "After day 5, the Pit-Hag cannot choose Leviathan."
      }
    ]
  },
  {
    "id": "lilmonsta",
    "jinx": [
      {
        "id": "poppygrower",
        "reason":
            "If the Poppy Grower is in play, Minions don't wake together. They are woken one by one, until one of them chooses to take the Lil' Monsta token."
      },
      {
        "id": "magician",
        "reason":
            "Each night, the Magician chooses a Minion: if that Minion & Lil' Monsta are alive, that Minion babysits Lil’ Monsta."
      },
      {
        "id": "scarletwoman",
        "reason":
            "If there are 5 or more players alive and the player holding the Lil' Monsta token dies, the Scarlet Woman is given the Lil' Monsta token tonight."
      },
      {
        "id": "vizier",
        "reason":
            "The Vizier can die by execution if they are babysitting Lil' Monsta."
      },
      {
        "id": "hatter",
        "reason":
            "If a Demon chooses Lil' Monsta, they also choose a Minion to become and babysit Lil' Monsta tonight."
      }
    ]
  },
  {
    "id": "legion",
    "jinx": [
      {
        "id": "engineer",
        "reason":
            "Legion and the Engineer can not both be in play at the start of the game. If the Engineer creates Legion, most players (including all evil players) become evil Legion."
      },
      {
        "id": "preacher",
        "reason":
            "If the Preacher chooses Legion, Legion keeps their ability, but the Preacher might learn they are Legion."
      },
      {
        "id": "minstrel",
        "reason":
            "If Legion died by execution today, Legion keeps their ability, but the Minstrel might learn they are Legion."
      },
      {
        "id": "hatter",
        "reason":
            "If the Hatter dies and Legion is in play, nothing happens. If the Hatter dies and an evil player chooses Legion, all current evil players become Legion."
      },
      {
        "id": "zealot",
        "reason": "The Zealot might register as evil to Legion's ability."
      }
    ]
  },
  {
    "id": "scarletwoman",
    "jinx": [
      {
        "id": "fanggu",
        "reason":
            "If the Fang Gu chooses an Outsider and dies, the Scarlet Woman does not become the Fang Gu."
      },
      {
        "id": "alhadikhia",
        "reason":
            "If there are two living Al-Hadikhias, the Scarlet Woman Al-Hadikhia becomes the Scarlet Woman again."
      }
    ]
  },
  {
    "id": "spy",
    "jinx": [
      {
        "id": "alchemist",
        "reason":
            "If the Alchemist has the Spy ability, they do not see the Grimoire, and the real Spy cannot register falsely."
      },
      {
        "id": "magician",
        "reason":
            "When the Spy sees the Grimoire, the Demon and Magician's character tokens are removed."
      },
      {
        "id": "poppygrower",
        "reason":
            "If the Poppy Grower is in play, the Spy does not see the Grimoire until the Poppy Grower dies."
      },
      {
        "id": "damsel",
        "reason": "If the Spy is (or has been) in play, the Damsel is poisoned."
      },
      {"id": "ogre", "reason": "The Spy registers as evil to the Ogre."}
    ]
  },
  {
    "id": "widow",
    "jinx": [
      {
        "id": "alchemist",
        "reason":
            "If the Alchemist has the Widow ability, they do not see the Grimoire."
      },
      {
        "id": "magician",
        "reason":
            "When the Widow sees the Grimoire, the Demon and Magician's character tokens are removed."
      },
      {
        "id": "poppygrower",
        "reason":
            "If the Poppy Grower is in play, the Widow does not see the Grimoire until the Poppy Grower dies."
      },
      {
        "id": "damsel",
        "reason":
            "If the Widow is (or has been) in play, the Damsel is poisoned."
      }
    ]
  },
  {
    "id": "yaggababble",
    "jinx": [
      {
        "id": "exorcist",
        "reason":
            "If the Exorcist chooses the Yaggababble, the Yaggababble ability does not kill tonight."
      }
    ]
  },
  {
    "id": "summoner",
    "jinx": [
      {
        "id": "clockmaker",
        "reason":
            "If the Summoner is in play, the Clockmaker does not receive their information until a Demon is created."
      },
      {
        "id": "alchemist",
        "reason":
            "If there is an Alchemist-Summoner in play, the game starts with a Demon in play, as normal. If the Alchemist-Summoner chooses a player, they make that player a Demon but do not change their alignment."
      },
      {
        "id": "poppygrower",
        "reason":
            "If the Poppy Grower is alive when the Summoner acts, the Summoner chooses which Demon, but the Storyteller chooses which player."
      },
      {
        "id": "marionette",
        "reason":
            "The Marionette neighbors the Summoner. The Summoner knows who the Marionette is."
      },
      {
        "id": "pithag",
        "reason":
            "The Summoner cannot create an in-play Demon. If the Summoner creates a not-in-play Demon, deaths tonight are arbitrary."
      },
      {
        "id": "hatter",
        "reason":
            "The Summoner cannot create an in-play Demon. If the Summoner creates a not-in-play Demon, deaths tonight are arbitrary."
      },
      {
        "id": "courtier",
        "reason":
            "If the Summoner is drunk on the 3rd night, the Summoner chooses which Demon, but the Storyteller chooses which player."
      },
      {
        "id": "engineer",
        "reason":
            "If the Engineer removes a Summoner from play before that Summoner uses their ability, the Summoner uses their ability immediately."
      },
      {
        "id": "zombuul",
        "reason":
            "If the Summoner turns a dead player into the Zombuul, the Storyteller treats that player as a Zombuul that has died once."
      },
      {
        "id": "pukka",
        "reason":
            "The Summoner may choose a player to become the Pukka on the 2nd night."
      },
      {
        "id": "legion",
        "reason":
            "If the Summoner creates Legion, most players (including all evil players) become evil Legion."
      },
      {
        "id": "kazali",
        "reason":
            "The Summoner cannot create an in-play Demon. If the Summoner creates a not-in-play Demon, deaths tonight are arbitrary."
      },
      {
        "id": "preacher",
        "reason":
            "If the Preacher chose the Summoner on or before the 3rd night, the Summoner chooses which Demon, but the Storyteller chooses which player."
      },
      {
        "id": "lordoftyphon",
        "reason":
            "If the Summoner creates a Lord of Typhon, the Lord of Typhon must neighbor a Minion. The other neighbor becomes a not-in-play evil Minion."
      }
    ]
  },
  {
    "id": "marionette",
    "jinx": [
      {
        "id": "lilmonsta",
        "reason":
            "The Marionette neighbors a Minion, not the Demon. The Marionette is not woken to choose who takes the Lil' Monsta token, and does not learn they are the Marionette if they have the Lil' Monsta token."
      },
      {
        "id": "poppygrower",
        "reason":
            "When the Poppy Grower dies, the Demon learns the Marionette but the Marionette learns nothing."
      },
      {
        "id": "snitch",
        "reason":
            "The Marionette does not learn 3 not in-play characters. The Demon learns an extra 3 instead."
      },
      {
        "id": "balloonist",
        "reason":
            "If the Marionette thinks that they are the Balloonist, +1 Outsider might have been added."
      },
      {
        "id": "damsel",
        "reason": "The Marionette does not learn that a Damsel is in play."
      },
      {
        "id": "huntsman",
        "reason":
            "If the Marionette thinks that they are the Huntsman, the Damsel was added."
      }
    ]
  },
  {
    "id": "lleech",
    "jinx": [
      {
        "id": "mastermind",
        "reason":
            "If the Mastermind is alive and the Lleech's host dies by execution, the Lleech lives but loses their ability."
      },
      {
        "id": "slayer",
        "reason": "If the Slayer slays the Lleech's host, the host dies."
      }
    ]
  },
  {
    "id": "kazali",
    "jinx": [
      {
        "id": "goon",
        "reason":
            "The Kazali can choose that the Goon player is one of their evil Minions."
      },
      {
        "id": "marionette",
        "reason":
            "If the Kazali chooses to create a Marionette, they must choose one of their neighbors."
      },
      {
        "id": "huntsman",
        "reason":
            "If the Kazali chooses the Damsel to become a Minion, and a Huntsman is in play, a good player becomes the Damsel."
      },
      {
        "id": "choirboy",
        "reason":
            "The Kazali can not choose the King to become a Minion if a Choirboy is in play."
      },
      {
        "id": "soldier",
        "reason":
            "The Kazali can choose that the Soldier player is one of their evil Minions."
      }
    ]
  },
  {
    "id": "riot",
    "jinx": [
      {
        "id": "mayor",
        "reason":
            "The Mayor may choose to stop nominations. If they do so when only 1 Riot is alive, good wins. Otherwise, evil wins."
      },
      {
        "id": "monk",
        "reason":
            "If Riot is in play, the Monk-protected player is safe from all evil abilities."
      },
      {
        "id": "farmer",
        "reason":
            "Each night*, Riot chooses an alive good player (different to previous nights): a chosen Farmer uses their ability but does not die."
      },
      {
        "id": "innkeeper",
        "reason":
            "If Riot is in play, the Innkeeper-protected player is safe from all evil abilities."
      },
      {
        "id": "sage",
        "reason":
            "Each night*, Riot chooses an alive good player (different to previous nights): a chosen Sage uses their ability but does not die."
      },
      {
        "id": "banshee",
        "reason":
            "Each night*, Riot chooses an alive good player (different to previous nights): a chosen Banshee dies & gains their ability."
      },
      {
        "id": "ravenkeeper",
        "reason":
            "Each night*, Riot chooses an alive good player (different to previous nights): a chosen Ravenkeeper uses their ability but does not die."
      },
      {
        "id": "soldier",
        "reason":
            "If Riot is in play, the Soldier is safe from all evil abilities."
      },
      {
        "id": "grandmother",
        "reason":
            "If Riot is in play and the Grandchild dies during the day, the Grandmother dies too."
      },
      {
        "id": "king",
        "reason":
            "If Riot is in play, and at least 1 player is dead, the King learns an alive character each night."
      },
      {
        "id": "exorcist",
        "reason":
            "If the Exorcist chooses Riot on the 3rd night, Minions do not become Riot."
      }
    ]
  },
  {
    "id": "butler",
    "jinx": [
      {
        "id": "organgrinder",
        "reason":
            "If the Organ Grinder is causing eyes closed voting, the Butler may raise their hand to vote but their vote is only counted if their master voted too."
      }
    ]
  },
  {
    "id": "vizier",
    "jinx": [
      {
        "id": "investigator",
        "reason":
            "If the Investigator learns that the Vizier is in play, the existence of the Vizier is not announced by the Storyteller."
      },
      {
        "id": "preacher",
        "reason":
            "If the Vizier loses their ability, they learn this. If the Vizier is executed while they have their ability, their team wins."
      },
      {
        "id": "courtier",
        "reason":
            "If the Vizier loses their ability, they learn this. If the Vizier is executed while they have their ability, their team wins."
      },
      {
        "id": "magician",
        "reason":
            "If the Vizier and Magician are both in play, the Demon does not learn the Minions."
      },
      {
        "id": "fearmonger",
        "reason":
            "The Vizier wakes with the Fearmonger, learns who they choose and cannot choose to immediately execute that player."
      },
      {
        "id": "politician",
        "reason": "The Politician might register as evil to the Vizier."
      },
      {
        "id": "alsaahir",
        "reason":
            "If the Vizier is in play, the Alsaahir must also guess which Demon(s) are in play."
      },
      {
        "id": "zealot",
        "reason": "The Zealot might register as evil to the Vizier."
      }
    ]
  },
  {
    "id": "vortox",
    "jinx": [
      {
        "id": "banshee",
        "reason":
            "If the Vortox is in play and the Demon kills the Banshee, the players still learn that the Banshee has died."
      }
    ]
  },
  {
    "id": "ogre",
    "jinx": [
      {
        "id": "recluse",
        "reason":
            "If the Recluse registers as evil to the Ogre, the Ogre learns that they are evil."
      }
    ]
  },
  {
    "id": "mastermind",
    "jinx": [
      {
        "id": "alhadikhia",
        "reason":
            "If the Al-Hadikhia dies by execution, and the Mastermind is alive, the Al-Hadikhia chooses 3 good players tonight: if all 3 choose to live, evil wins. Otherwise, good wins."
      }
    ]
  },
  {
    "id": "boffin",
    "jinx": [
      {
        "id": "cultleader",
        "reason":
            "If the Demon has the Cult Leader ability, they can’t turn good due to this ability."
      },
      {
        "id": "goon",
        "reason":
            "If the Demon has the Goon ability, they can’t turn good due to this ability."
      },
      {"id": "ogre", "reason": "The Demon cannot have the Ogre ability."},
      {
        "id": "politician",
        "reason": "The Demon cannot have the Politician ability."
      },
      {
        "id": "drunk",
        "reason":
            "If the Demon would have the Drunk ability, the Boffin chooses a Townsfolk player to have this ability instead."
      },
      {
        "id": "alchemist",
        "reason":
            "If the Alchemist has the Boffin ability, the Alchemist does not learn what ability the Demon has."
      },
      {
        "id": "villageidiot",
        "reason":
            "If there is a spare token, the Boffin can give the Demon the Village Idiot ability."
      }
    ]
  },
  {
    "id": "plaguedoctor",
    "jinx": [
      {
        "id": "eviltwin",
        "reason":
            "The Storyteller cannot gain the Evil Twin ability if the Plague Doctor dies."
      },
      {
        "id": "fearmonger",
        "reason":
            "If the Plague Doctor dies, a living Minion gains the Fearmonger ability in addition to their own ability, and learns this."
      },
      {
        "id": "goblin",
        "reason":
            "If the Plague Doctor dies, a living Minion gains the Goblin ability in addition to their own ability, and learns this."
      },
      {
        "id": "spy",
        "reason":
            "If the Plague Doctor dies, a living Minion gains the Spy ability in addition to their own ability, and learns this."
      },
      {
        "id": "scarletwoman",
        "reason":
            "If the Plague Doctor dies, a living Minion gains the Scarlet Woman ability in addition to their own ability, and learns this."
      },
      {
        "id": "boomdandy",
        "reason":
            "If the Plague Doctor is executed and the Storyteller would gain the Boomdandy ability, the Boomdandy ability triggers immediately."
      },
      {
        "id": "baron",
        "reason":
            "If the Storyteller gains the Baron ability, up to two players become not-in-play Outsiders."
      },
      {
        "id": "marionette",
        "reason":
            "If the Demon has a neighbor who is alive and a Townsfolk or Outsider when the Plague Doctor dies, that player becomes an evil Marionette. If there is already an extra evil player, this does not happen."
      }
    ]
  },
  {
    "id": "heretic",
    "jinx": [
      {"id": "godfather", "reason": "Only 1 jinxed character can be in play."},
      {"id": "baron", "reason": "The Baron might only add 1 Outsider, not 2."},
      {"id": "pithag", "reason": "A Pit-Hag can not create a Heretic."},
      {"id": "spy", "reason": "Only 1 jinxed character can be in play."},
      {"id": "widow", "reason": "Only 1 jinxed character can be in play."},
      {
        "id": "lleech",
        "reason":
            "If the Lleech has poisoned the Heretic then the Lleech dies, the Heretic remains poisoned."
      },
      {"id": "boffin", "reason": "The Demon cannot have the Heretic ability."}
    ]
  },
  {
    "id": "bountyhunter",
    "jinx": [
      {
        "id": "philosopher",
        "reason":
            "If the Philosopher gains the Bounty Hunter ability, a Townsfolk might turn evil."
      },
      {
        "id": "kazali",
        "reason":
            "An evil Townsfolk is only created if the Bounty Hunter is still in play after the Kazali acts."
      }
    ]
  }
];

final jinxesMap = {
  for (final jinx in jinxes) jinx['id']: jinx,
};
