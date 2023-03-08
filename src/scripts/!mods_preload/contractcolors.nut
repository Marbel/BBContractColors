::ContractColors <- {
    ID = "contract_colors",
    Name = "Contract Colors"
    Version = "%VERSION%",
}

enum ContractType {
    enemy,
    searching,
    caravan,
    location,
    number
}

::mods_registerMod(::ContractColors.ID, ::ContractColors.Version);
::mods_queue(null, "mod_msu", function()
{
    ::ContractColors.Mod <- ::MSU.Class.Mod(::ContractColors.ID, ::ContractColors.Version, ::ContractColors.Name);
    ::MSU.Log.printData("Start " + ::ContractColors.Name);
    ::mods_hookDescendants("contracts/contract", function(contract){
        local contractCreateScreens = ::mods_getMember(contract, "createScreens");
        contract.createScreens = function(){
            contractCreateScreens();
            ::ContractColors.colorScreens(this.m.Screens, this);
        }
    })

    ::ContractColors.colorScreens <- function(screens, contract) {
        foreach(screen in screens){
            if (::MSU.String.startsWith(screen.ID, "Task") == false) {
                continue;
            }
            screen.Text = colorTargets(screen.Text);
        }
    }

    ::ContractColors.colorTargets <- function(text)
	{
        foreach(importantTarget in ::ContractColors.importantTargets)
		{
            local colorData = ::ContractColors.getValueByType(importantTarget.type, ::ContractColors.Colors);
            if(!"color" in colorData){
                continue;
            }
            local color = colorData.color;
            foreach(keyword in importantTarget.keywords) {
                local capitalizedTarget = ::MSU.String.capitalizeFirst(keyword);
                text = ::MSU.String.replace(text, capitalizedTarget, "[color=" + color + "]" + capitalizedTarget + "[/color]", true);
                text = ::MSU.String.replace(text, keyword, "[color=" + color + "]" + keyword + "[/color]", true);
            }
		}
		return text;
	}

    ::ContractColors.getValueByType <- function(type, toBeSearchedArray){
        foreach (entry in toBeSearchedArray) {
            if (entry.type == type){
                return entry;
            }
        }
        return null;
    };

    ::ContractColors.Colors <- [
        {
            type = ContractType.enemy,
            color = "#941C2F"
        },
        {
            type = ContractType.searching,
            color = "#59F8E8"
        },
        {
            type = ContractType.caravan,
            color = "#9D9FEB"
        },
        {
            type = ContractType.location,
            color = "#20A4F3"
        },
        {
            type = ContractType.number,
            color = "#9EE493"
        }
    ];

    ::ContractColors.importantTargets <- [
        {
            type = ContractType.enemy,
            keywords = [
                "beasts",
                " king",
                "ifrits",
                "nomads",
                "desert bandits",
                "brigand",
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
                "orc",
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
            type = ContractType.searching,
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
            type = ContractType.caravan,
            keywords = [
                "caravan",
                "%envoy%",
                "%protectee%"
            ]
        },
        {
            type = ContractType.location,
            keywords = [
                "%holysite%",
                "%worldmapregion%",
                "%objective%",
                "%objective1%",
                "%objective2%"
                "%townname%",
                "%origin%",
                "%location1%",
                "%location2%"
            ]
        },
        {
            type = ContractType.number,
            keywords = [
                "%number%"
            ]
        }
    ];
});