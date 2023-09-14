

function Fangs.Init()
    local KvAF = KvAF
    local KVS = KvAF.KVS

    local KvAF_Main = KvAF.Main
    local VisualLibrary = KvAF.VisualLibrary
    local Fangs = Fangs
    local addonKey = addonKey

    Fangs.categoryKey = "Teeth"

    -- ==================================================
    local function AddFangOption( key, desc, uuid )
        return VisualLibrary.AddOption(addonKey, Fangs.categoryKey, key, desc, uuid)
    end

    local function GetFangOption(fangsKey, reportOptions)
        return VisualLibrary.GetOptionFromCategory(Fangs.categoryKey, fangsKey, reportOptions)
    end

    -- ==================================================
    AddFangOption("Astarion", "Astarion Fangs (Vampire Spawn - Slightly Shorter)", "bf4980d6-e1b1-4dfe-9247-472245f8d17f")
    AddFangOption("Cazador", "Cazador Fangs (Vampire - Longer)", "68b31876-a03f-4ebe-97a9-b532a12612ae")
    AddFangOption("Tiefling_M", "Tiefling Male Fangs (Compatible with Masc Human/Elf/Drow)", "a1402735-3e99-4186-8b82-d2e5a1d8e70c")
    AddFangOption("Tiefling_M_Rolan", "Tiefling Male Fangs - Rolan's (Almost identical to Tiefling_M)", "96a0a712-44b9-443a-ace4-a1aca70f4975")
    AddFangOption("Tiefling_F", "Tiefling Female Fangs (Compatible with Femme Human/Elf/Drow)", "efd07c38-a171-4009-9860-2face607edc8")
    AddFangOption("Tiefling_F_Karlach", "Tiefling Female Fangs - Karlach's (Compatible with Femme Human/Elf/Drow)", "3938183a-fb09-4165-b8ca-138f4cc7696f")
    -- ==================================================

    -- TODO: Move to KvAF category implementation
    function Fangs.Apply( fangs_key, character_uuid, quiet )
        local fangs_uuid = GetFangOption(fangs_key, not quiet)
        if fangs_uuid then
            KvAF_Main.AddVisual(fangs_uuid, character_uuid)
        end
    end

    -- TODO: Move to KvAF category implementation
    function Fangs.Remove( fangs_key, character_uuid, quiet )
        local fangs_uuid = GetFangOption(fangs_key, not quiet)
        if fangs_uuid then
            KvAF_Main.RemoveVisual(fangs_uuid, character_uuid)
        end
    end

    -- TODO: Move to KvAF category implementation
    function Fangs.List()
        return VisualLibrary.ReportOptionsForCategory(Fangs.categoryKey)
    end

    -- ==================================================

end
