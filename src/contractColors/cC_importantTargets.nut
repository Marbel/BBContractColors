enum ContractType {
    ENEMY = "ENEMY",
    SEARCHING = "SEARCHING",
    CARAVAN = "CARAVAN",
    LOCATION = "LOCATION",
    NUMBER = "NUMBER"
};

::ContractColors.importantTargets <- [
    {
        type = ContractType.ENEMY,
        name = "Enemy",
        settingDescription = "Sets the color for words and word combinations like:\nbeasts\ndesert bandits",
        color = "#941C2F",
        defaultColor = "148,28,47,1",
        keywords = [
            "brigands",
            "beasts",
            " king",
            "ifrits",
            "nomads",
            "desert bandits",
            "brigand",
            "thieves "
            "vandals",
            "vagabonds",
            "undead",
            "nachzehrers",
            "ghoulish",
            "corpse eating",
            "furry monsters",
            "corpse eating things",
            "alps",
            "dream eaters",
            "strange spirit",
            "dreams",
            "nightmares",
            "witches",
            "beautiful women",
            " orc",
            "greenskin",
            "greenies",
            "goblins",
            "gobbos",
            "warlord",
            "swordmaster",
            "raiders",
            "hedge Knight",
            "hate knight",
            "blade Dancer",
            "unhold",
            "A giant!",
            "giants",
            "giant men",
            "gladiators",
            "webknechts",
            "spider",
            "eight-legged",
            "schrats",
            "tree mimics",
            "oak tree",
            "trees on the move",
            "trees are coming alive",
            "monsters made of wood",
            "murderous trees",
            "wolves",
            "serpents",
            "snake",
            "frenzied hyenas",
            "hyenas",
            "lindwurm",
            "sellswords",
            "heathens",
            "barbarian",
            "northern savage",
            "raiding parties",
            "caravan destroyed",
            "caravan I need destroyed",
            "kill the peasantry",
            "any occupants",
            "Necromancer",
            "graverobbers",
            "grave robbing fool",
            "dead rising",
            "the dead walking",
            "ghosts",
            "indebted have overtaken",
            "indebted have overrun",
            "%champion1%",
            "%enemynoblehouse%",
            "%feudfamily%",
            "%enemy%",
            "%settlementname%"
        ]
    },
    {
        type = ContractType.SEARCHING,
        name = "Searching",
        settingDescription = "Sets the color for words and word combinations like:\ndistance\ndirection",
        color = "#59F8E8",
        defaultColor = "89,248,232,1",
        keywords = [
            "%distance%",
            "%commander%",
            "%days%",
            "%direction%",
            "%region%",
            "%location%",
            "patrol the area",
            "find it"
        ]
    },
    {
        type = ContractType.CARAVAN,
        name = "Caravan",
        settingDescription = "Sets the color for words and word combinations like:\ncaravan\nenvoy",
        color = "#9D9FEB",
        defaultColor = "157,159,235,1",
        keywords = [
            "caravan",
            "%envoy%",
            "%protectee%"
        ]
    },
    {
        type = ContractType.LOCATION,
        name = "Location",
        settingDescription = "Sets the color for words and word combinations like:\nholysite\ntownname",
        color = "#20A4F3",
        defaultColor = "32,164,243,1",
        keywords = [
            "%holysite%",
            "%worldmapregion%",
            "%objective%",
            "%objective1%",
            "%objective2%"
            "%townname%",
            "%origin%",
            "%location1%",
            "%location2%",
            "location of a great artifact"
        ]
    },
    {
        type = ContractType.NUMBER,
        name = "Number",
        settingDescription = "Sets the color for words and word combinations like:\nnumber",
        color = "#9EE493",
        defaultColor = "158,228,147,1",
        keywords = [
            "%number%",
            "%numberC%"
        ]
    }
];