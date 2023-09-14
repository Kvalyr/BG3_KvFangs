
Fangs = {}
Ext.Require("Fangs.lua")

Horns = {}
Ext.Require("Horns.lua")

addonKey = "KvFangs"
addonAuthor = "Kvalyr"
addonName = "Fangs & Horns"
addonDesc = "Adds Fang & Horn options to DAF"
addonVersion = "0.1"

local function init()
    KvAF = Mods.KvAppearanceFramework
    if not KvAF then
        _P("KvFangs: Warning: Dynamic Appearance Framework is required but is not installed.")
    end

    KvAF.Addons.Register(addonKey, addonName, addonAuthor, addonDesc, addonVersion)

    Fangs.Init()
    Horns.Init()
end

Ext.Events.SessionLoaded:Subscribe(init)
