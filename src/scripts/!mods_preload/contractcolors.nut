::ContractColors <- {
    ID = "contract_colors",
    Name = "Contract Colors"
    Version = "%VERSION%",
}

::MSU.includeFile("contractColors/", "cC_importantTargets.nut");

::mods_registerMod(::ContractColors.ID, ::ContractColors.Version);
::mods_queue(null, "mod_msu, mod_legends", function()
{
    ::ContractColors.Mod <- ::MSU.Class.Mod(::ContractColors.ID, ::ContractColors.Version, ::ContractColors.Name);
    ::mods_hookBaseClass("contracts/contract",  function(contract){
        local oldBuildText = ::mods_getMember(contract, "buildText");
        local buildText = function(text) {
            if (this.m.ActiveScreen != null
                && ::MSU.String.startsWith(this.m.ActiveScreen.ID, "Task") == true
                && ::MSU.String.startsWith(text, "[img]"))
            {
                ::ContractColors.UpdateColorsFromSettings();
                text = ::ContractColors.colorTargets(text);
            }
            return oldBuildText(text);
        }
        ::mods_override(contract, "buildText", buildText);
    })

    ::ContractColors.colorTargets <- function(text)
	{
        foreach(importantTarget in ::ContractColors.importantTargets)
		{
            local color = importantTarget.color;
            foreach(keyword in importantTarget.keywords) {
                local capitalizedTarget = ::MSU.String.capitalizeFirst(keyword);
                text = ::MSU.String.replace(text, capitalizedTarget, "[color=" + color + "]" + capitalizedTarget + "[/color]", true);
                text = ::MSU.String.replace(text, keyword, "[color=" + color + "]" + keyword + "[/color]", true);
            }
		}
		return text;
	}

    ::ContractColors.UpdateColorsFromSettings <- function(){
        foreach (target in ::ContractColors.importantTargets) {
            target.color = ::ContractColors.getHexString(::ContractColors.Mod.ModSettings.getSetting(target.type).getValueAsHexString());
        }
    };

    ::ContractColors.getHexString <- function(msuHexString){
        return "#" + msuHexString.slice(0, 6);
    };

    // Settings
    local colorPage = ::ContractColors.Mod.ModSettings.addPage("Colors");
    foreach (target in ::ContractColors.importantTargets) {
        local colorSetting = colorPage.addColorPickerSetting(target.type, target.defaultColor, target.name + " Color");
        colorSetting.setDescription(target.settingDescription);
        colorSetting.addAfterChangeCallback(function(oldValue){
            target.color = ::ContractColors.getHexString(this.getValueAsHexString());
        });
    }
});
