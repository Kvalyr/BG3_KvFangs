
function Horns.Init()
    local KvAF = KvAF
    local KVS = KvAF.KVS

    local Utils = KVS.Utils
    local KvAF_Main = KvAF.Main
    local VisualLibrary = KvAF.VisualLibrary
    local Horns = Horns

    Horns.categoryKey = "Horns"

    -- ==================================================
    local function AddHornOption( key, desc, uuid )
        return VisualLibrary.AddOption(addonKey, Horns.categoryKey, key, desc, uuid)
    end

    local function GetHornOption(hornsKey, reportOptions)
        return VisualLibrary.GetOptionFromCategory(Horns.categoryKey, hornsKey, reportOptions)
    end


    -- ==================================================
    AddHornOption("Rhol", "Rhol the Despoiler's Horns", "571fdc8a-e37d-4909-8a02-a8b02b5f495d")
    AddHornOption("Karlach", "Karlach's Horns", "aa1ab644-3e21-4503-91c0-4bc6d2a953bc")
    -- AddHornOption("Rhol_M", "Rhol the Despoiler's Horns (Masc)", nil) -- TODO
    -- ==================================================


    function Horns.Apply( horns_key, character_uuid, quiet )
        local horns_uuid = GetHornOption(horns_key, not quiet)
        if horns_uuid then
            KvAF_Main.AddVisual(horns_uuid, character_uuid)
        end
    end

    function Horns.Remove( horns_key, character_uuid, quiet )
        local horns_uuid = GetHornOption(horns_key, not quiet)
        if horns_uuid then
            KvAF_Main.RemoveVisual(horns_uuid, character_uuid)
        end
    end

    function Horns.List()
        return VisualLibrary.ReportOptionsForCategory(Horns.categoryKey)
    end

-- ==================================================
end
