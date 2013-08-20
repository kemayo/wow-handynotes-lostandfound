---------------------------------------------------------
-- Addon declaration
HandyNotes_LostAndFound = LibStub("AceAddon-3.0"):NewAddon("HandyNotes_LostAndFound", "AceEvent-3.0")
local HL = HandyNotes_LostAndFound
local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes")
-- local L = LibStub("AceLocale-3.0"):GetLocale("HandyNotes_LostAndFound", true)

local debugf = tekDebug and tekDebug:GetFrame("LostAndFound")
local function Debug(...) if debugf then debugf:AddMessage(string.join(", ", tostringall(...))) end end

---------------------------------------------------------
-- Our db upvalue and db defaults
local db
local defaults = {
    profile = {
        show_lost = true,
        show_riches = true,
        show_junk = true,
        found = false,
        icon_scale = 1.0,
        icon_alpha = 1.0,
        icon_item = true,
    },
}

---------------------------------------------------------
-- Localize some globals
local next = next
local GameTooltip = GameTooltip
local WorldMapTooltip = WorldMapTooltip
local HandyNotes = HandyNotes
local GetItemInfo = GetItemInfo
local GetAchievementInfo = GetAchievementInfo
local GetAchievementCriteriaInfo = GetAchievementCriteriaInfo

---------------------------------------------------------
-- Constants

local points = {
    -- [mapFile] = { [coord] = { type=[type], id=[id], junk=[bool], }, }
    -- [] = { type="item", id=, }, -- 
    ["KunLaiSummit"] = {
        [52907140] = { type="item", id=86394, note="in the cave", quest=31413, }, -- Hozen Warrior Spear
        [35207640] = { type="item", id=86125, note="on Frozen Trail Packer", quest=31304, npc=64227, }, -- Kafa Press
        [73107350] = { type="plain", id="Sprite's Cloth Chest", note="in the cave", quest=31412, },
        [71206260] = { type="item", id=88723, note="in Stash of Yaungol Weapons", quest=31421, }, -- Sturdy Yaungol Spear
        [44705240] = { type="item", id=86393, quest=31417, }, -- Tablet of Ren Yun
        [64234513] = { type="item", id=86471, riches=true, quest=31420, note="in the cave" }, -- Ancient Mogu Tablet
        [50366177] = { type="plain", id="Hozen Treasure Cache", riches=true, note="in the cave", quest=31414, },
        [36707970] = { type="plain", id="Lost Adventurer's Belongings", riches=true, quest=31418, },
        [47007300] = { type="plain", id="Mo-Mo's Treasure Chest", junk=true, quest=31868, },
        [52575154] = { type="item", id=86430, riches=true, note="in Rikktik's Tiny Chest", quest=31419, }, -- Rikktik's Tick Remover
        [72013396] = { type="item", id=86422, riches=true, quest=31416, }, -- Statue of Xuen
        [59405300] = { type="plain", id="Stolen Sprite Treasure", riches=true, note="in the cave", quest=31415, },
        [59247303] = { type="item", id=86427, riches=true, quest=31422, }, -- Terracotta Head
    },
    ["KnucklethumpHole"] = { -- cave in Kun-Lai
        [52002750] = { type="plain", id="Hozen Treasure Cache", riches=true, quest=31414, },
    },
    ["TheDeeper"] = { -- cave in Kun-Lai
        [24106580] = { type="item", id=86394, level=12, quest=31413, }, -- Hozen Warrior Spear
    },
    ["PrankstersHollow"] = { -- cave in Kun-Lai
        [54706980] = { type="plain", id="Sprite's Cloth Chest", quest=31412, },
    },
    ["HowlingwindCavern"] = { -- cave in Kun-Lai
        [41674412] = { type="plain", id="Stolen Sprite Treasure", riches=true, quest=31415, },
    },
    ["TownlongWastes"] = {
        [66304470] = { type="item", id=86518, quest=31425, }, -- Yaungol Fire Carrier
        [66804800] = { type="item", id=86518, quest=31425, }, -- Yaungol Fire Carrier
        [62823405] = { type="plain", id="Abandoned Crate of Goods", riches=true, note="in a tent", quest=31427, },
        [65838608] = { type="item", id=86472, riches=true, quest=31426, }, -- Amber Encased Moth
        [52845617] = { type="item", id=86517, riches=true, quest=31424, }, -- Hardened Sap of Kri'vess
        [57505850] = { type="item", id=86517, riches=true, quest=31424, }, -- Hardened Sap of Kri'vess
        [32806160] = { type="item", id=86516, riches=true, note="in the cave", quest=31423, }, -- Fragment of Dread
    },
    ["NiuzaoCatacombs"] = { -- cave in Townlong
        [56406480] = { type="item", id=86516, riches=true, quest=31423, }, -- Fragment of Dread
        [36908760] = { type="item", id=86516, riches=true, quest=31423, }, -- Fragment of Dread
        [48408860] = { type="item", id=86516, riches=true, quest=31423, }, -- Fragment of Dread
        [64502150] = { type="item", id=86516, riches=true, quest=31423, }, -- Fragment of Dread
    },
    ["ValleyoftheFourWinds"] = {
        [46802460] = { type="item", id=85973, note="on Ghostly Pandaren Fisherman", npc=64004, quest=31284, }, -- Ancient Pandaren Fishing Charm
        [45403820] = { type="item", id=86079, note="on Ghostly Pandaren Craftsman", npc=64191, quest=31292, }, -- Ancient Pandaren Woodcutter
        [15402920] = { type="item", id=86218, quest=31407, }, -- Staff of the Hidden Master
        [14903360] = { type="item", id=86218, quest=31407, }, -- Staff of the Hidden Master
        [17503570] = { type="item", id=86218, quest=31407, }, -- Staff of the Hidden Master
        [19103780] = { type="item", id=86218, quest=31407, }, -- Staff of the Hidden Master
        [19004250] = { type="item", id=86218, quest=31407, }, -- Staff of the Hidden Master
        [43603740] = { type="plain", id="Cache of Pilfered Goods", quest=31406, },
        [92003900] = { type="item", id=87524, junk=true, quest=31869, }, -- Boat-Building Instructions
        [23712833] = { type="plain", id="Virmen Treasure Cache", riches=true, quest=31405, },
        [75105510] = { type="item", id=86220, riches=true, quest=31408, } -- Saurok Stone Tablet
    },
    ["DreadWastes"] = {
        [66306660] = { type="item", id=86522, quest=31433, }, -- Blade of the Prime
        [25905030] = { type="item", id=86525, quest=31436, note="in the underwater cave", }, -- Bloodsoaked Chitin Fragment
        [30209080] = { type="item", id=86524, quest=31435, }, -- Dissector's Staff of Mutation
        [33003010] = { type="item", id=86521, quest=31431, }, -- Lucid Amulet of the Agile Mind
        [48703000] = { type="item", id=86520, quest=31430, }, -- Malik's Stalwart Spear
        [42206360] = { type="item", id=86529, note="on Glinting Rapana Whelk", npc=65552, quest=31432, }, -- Manipulator's Talisman on a Glinting Rapana Whelk (65552)
        [56607780] = { type="item", id=86523, quest=31434, }, -- Swarming Cleaver of Ka'roz
        [54305650] = { type="item", id=86526, quest=31437, }, -- Swarmkeeper's Medallion
        [71803610] = { type="item", id=86519, quest=31429, }, -- Wind-Reaver's Dagger of Quick Strikes
        [28804190] = { type="item", id=86527, quest=31438, }, -- Blade of the Poisoned Mind
    },
    ["Krasarang"] = {
        [42409200] = { type="plain", id="Equipment Locker", quest=31410, },
        [52308870] = { type="item", id=87266, note="in a barrel", quest=31411, }, -- Recipe: Banana Infused Rum
        [50804930] = { type="item", id=86124, quest=31409, }, -- Pandaren Fishing Spear
        [52007300] = { type="item", id=87798, junk=true, quest=31863, }, -- Stack of Papers
        [71000920] = { type="item", id=86220, riches=true, note="in the cave", quest=31408, }, -- Saurok Stone Tablet
    },
    ["ValeofEternalBlossoms"] = {
        -- nothing?
    },
    ["TheJadeForest"] = {
        [39400730] = { type="item", id=85776, note="in the well", quest=31397, }, -- Wodin's Mantid Shaker
        [39264665] = { type="item", id=86199, note="on Jade Warrior Statue", npc=64272, quest=31307, }, -- Jade Infused Blade
        [43001160] = { type="item", id=86198, quest=31403, }, -- Hammer of Ten Thunders
        [41801760] = { type="item", id=86198, quest=31403, }, -- Hammer of Ten Thunders
        [41201390] = { type="item", id=86198, quest=31403, }, -- Hammer of Ten Thunders
        [46102920] = { type="item", id=85777, note="in the cave", quest=31399, }, -- Ancient Pandaren Mining Pick
        [47106740] = { type="item", id=86196, quest=31402, }, --Ancient Jinyu Staff
        [46207120] = { type="item", id=86196, quest=31402, }, --Ancient Jinyu Staff
        [26223235] = { type="item", id=85780, riches=true, quest=31400, }, -- Ancient Pandaren Tea Pot
        [31962775] = { type="item", id=85781, riches=true, quest=31401, }, -- Lucky Pandaren Coin
        [23493505] = { type="item", id=86216, riches=true, quest=31404, }, -- Pandaren Ritual Stone
        [24005300] = { type="plain", id="Chest of Supplies", junk=true, quest=31864, },
        [46308070] = { type="plain", id="Offering of Rememberance", junk=true, quest=31865, },
        [51229999] = { type="plain", id="Ship's Locker", riches=true, quest=31396, },
        [62452752] = { type="plain", id="Stash of Gems", junk=true, quest=31866, },
    },
    ["GreenstoneQuarry"] = { -- cave in Jade Forest
        [33107800] = { type="item", id=85777, level=7, quest=31399, }, -- Ancient Pandaren Mining Pick
        [44007050] = { type="item", id=85777, level=7, quest=31399, }, -- Ancient Pandaren Mining Pick
        [43703850] = { type="item", id=85777, level=7, quest=31399, }, -- Ancient Pandaren Mining Pick
        [38704750] = { type="item", id=85777, level=7, quest=31399, }, -- Ancient Pandaren Mining Pick
        [32606270] = { type="item", id=85777, level=7, quest=31399, }, -- Ancient Pandaren Mining Pick
    },
    ["TheHiddenPass"] = {
        [74937648] = { type="item", id=86473, riches=true, quest=31428, }, -- The Hammer of Folly
        [55107200] = { type="plain", id="Forgotten Lockbox", junk=true, quest=31867, },
    },
}

local default_texture, default_texture_riches
local icon_cache = {}
local trimmed_icon = function(texture)
    if not icon_cache[texture] then
        icon_cache[texture] = {
            icon = texture,
            tCoordLeft = 0.1,
            tCoordRight = 0.9,
            tCoordTop = 0.1,
            tCoordBottom = 0.9,
        }
    end
    return icon_cache[texture]
end
local point_info_handlers = {
    item = function(point)
        local name, link, _, _, _, _, _, _, _, texture = GetItemInfo(point.id)
        return link or 'item:'..point.id, trimmed_icon(db.icon_item and texture or (point.riches and default_texture_riches or default_texture))
    end,
    plain = function(point)
        return point.id, trimmed_icon(point.riches and default_texture_riches or default_texture)
    end,
}
local get_point_info = function(point)
    if not default_texture then
        default_texture = select(10, GetAchievementInfo(7284))
        default_texture_riches = select(10, GetAchievementInfo(7997))
    end
    if point then
        local label, icon = point_info_handlers[point.type](point)
        if point.note then
            label = ("%s (%s)"):format(label, point.note)
        end
        if not (point.junk or point.riches) then
            label = ("%s: %s"):format(ITEM_QUALITY3_DESC, label) -- rare
        end
        local category = point.junk and "junk" or (point.riches and "riches") or "lost"
        return label, icon, category, point.quest
    end
end
local get_point_info_by_coord = function(mapFile, coord)
    mapFile = string.gsub(mapFile, "_terrain%d+$", "")
    return get_point_info(points[mapFile] and points[mapFile][coord])
end

---------------------------------------------------------
-- Plugin Handlers to HandyNotes
local HLHandler = {}
local info = {}

function HLHandler:OnEnter(mapFile, coord)
    local tooltip = self:GetParent() == WorldMapButton and WorldMapTooltip or GameTooltip
    if ( self:GetCenter() > UIParent:GetCenter() ) then -- compare X coordinate
        tooltip:SetOwner(self, "ANCHOR_LEFT")
    else
        tooltip:SetOwner(self, "ANCHOR_RIGHT")
    end
    local label = get_point_info_by_coord(mapFile, coord)
    if label then
        tooltip:SetText(label)
        tooltip:Show()
    end
end

local function createWaypoint(button, mapFile, coord)
    local c, z = HandyNotes:GetCZ(mapFile)
    local x, y = HandyNotes:getXY(coord)
    local label = get_point_info_by_coord(mapFile, coord)
    if TomTom then
        local persistent, minimap, world
        if temporary then
            persistent = true
            minimap = false
            world = false
        end
        TomTom:AddZWaypoint(c, z, x*100, y*100, label, persistent, minimap, world)
    elseif Cartographer_Waypoints then
        Cartographer_Waypoints:AddWaypoint(NotePoint:new(HandyNotes:GetCZToZone(c, z), x, y, label))
    end
end

do
    local currentZone, currentCoord
    local function generateMenu(button, level)
        if (not level) then return end
        for k in pairs(info) do info[k] = nil end
        if (level == 1) then
            -- Create the title of the menu
            info.isTitle      = 1
            info.text         = "HandyNotes - LostAndFound"
            info.notCheckable = 1
            UIDropDownMenu_AddButton(info, level)

            if TomTom or Cartographer_Waypoints then
                -- Waypoint menu item
                info.disabled     = nil
                info.isTitle      = nil
                info.notCheckable = nil
                info.text = "Create waypoint"
                info.icon = nil
                info.func = createWaypoint
                info.arg1 = currentZone
                info.arg2 = currentCoord
                UIDropDownMenu_AddButton(info, level);
            end

            -- Close menu item
            info.text         = "Close"
            info.icon         = nil
            info.func         = function() CloseDropDownMenus() end
            info.arg1         = nil
            info.notCheckable = 1
            UIDropDownMenu_AddButton(info, level);
        end
    end
    local HL_Dropdown = CreateFrame("Frame", "HandyNotes_LostAndFoundDropdownMenu")
    HL_Dropdown.displayMode = "MENU"
    HL_Dropdown.initialize = generateMenu

    function HLHandler:OnClick(button, down, mapFile, coord)
        if button == "RightButton" and not down then
            currentZone = string.gsub(mapFile, "_terrain%d+$", "")
            currentCoord = coord
            ToggleDropDownMenu(1, nil, HL_Dropdown, self, 0, 0)
        end
    end
end

function HLHandler:OnLeave(mapFile, coord)
    if self:GetParent() == WorldMapButton then
        WorldMapTooltip:Hide()
    else
        GameTooltip:Hide()
    end
end

do
    -- This is a custom iterator we use to iterate over every node in a given zone
    local currentLevel
    local function iter(t, prestate)
        if not t then return nil end
        local state, value = next(t, prestate)
        while state do -- Have we reached the end of this zone?
            if value then
                if not value.level or value.level == currentLevel then
                    local label, icon, category, quest = get_point_info(value)
                    -- Debug("iter step", state, icon, db.icon_scale, db.icon_alpha, category, quest)
                    if quest == 31865 then
                        Debug(label, category, quest)
                        Debug("SETTINGS", db.show_junk, db.show_riches, db.show_lost, db.found)
                        Debug("TEST",
                            (category ~= "junk" or db.show_junk),
                            (category ~= "riches" or db.show_riches),
                            (category ~= "lost" or db.show_lost),
                            (db.found or not (quest and IsQuestFlaggedCompleted(quest))),
                            (category ~= "junk" or db.show_junk)
                                and (category ~= "riches" or db.show_riches)
                                and (category ~= "lost" or db.show_lost)
                                and (db.found or not (quest and IsQuestFlaggedCompleted(quest)))
                        )
                    end
                    if (
                        (category ~= "junk" or db.show_junk)
                        and (category ~= "riches" or db.show_riches)
                        and (category ~= "lost" or db.show_lost)
                        and (db.found or not (quest and IsQuestFlaggedCompleted(quest)))
                    ) then
                        return state, nil, icon, db.icon_scale, db.icon_alpha
                    end
                end
            end
            state, value = next(t, state) -- Get next data
        end
        return nil, nil, nil, nil
    end
    function HLHandler:GetNodes(mapFile, minimap, level)
        currentLevel = level
        mapFile = string.gsub(mapFile, "_terrain%d+$", "")
        return iter, points[mapFile], nil
    end
end

---------------------------------------------------------
-- Options table
local options = {
    type = "group",
    name = "LostAndFound",
    desc = "LostAndFound",
    get = function(info) return db[info[#info]] end,
    set = function(info, v)
        db[info[#info]] = v
        HL:SendMessage("HandyNotes_NotifyUpdate", "LostAndFound")
    end,
    args = {
        desc = {
            name = "These settings control the look and feel of the icon.",
            type = "description",
            order = 0,
        },
        icon_scale = {
            type = "range",
            name = "Icon Scale",
            desc = "The scale of the icons",
            min = 0.25, max = 2, step = 0.01,
            order = 20,
        },
        icon_alpha = {
            type = "range",
            name = "Icon Alpha",
            desc = "The alpha transparency of the icons",
            min = 0, max = 1, step = 0.01,
            order = 30,
        },
        icon_item = {
            type = "toggle",
            name = "Item icons",
            desc = "Show the icons for items, if known; otherwise, the achievement icon will be used",
        },
        show_lost = {
            type = "toggle",
            name = "Lost and Found",
            desc = "Show items that count for the Lost and Found achievement",
        },
        show_riches = {
            type = "toggle",
            name = "Riches of Pandaria",
            desc = "Show items that count for the Riches of Pandaria achievement",
        },
        show_junk = {
            type = "toggle",
            name = "Junk",
            desc = "Show items which don't count for any achievement",
        },
        found = {
            type = "toggle",
            name = "Show found",
            desc = "Show waypoints for items you've already found?",
        },
    },
}


---------------------------------------------------------
-- Addon initialization, enabling and disabling

function HL:OnInitialize()
    -- Set up our database
    self.db = LibStub("AceDB-3.0"):New("HandyNotes_LostAndFoundDB", defaults)
    db = self.db.profile
    -- Initialize our database with HandyNotes
    HandyNotes:RegisterPluginDB("LostAndFound", HLHandler, options)
end

function HL:Refresh()
    self:SendMessage("HandyNotes_NotifyUpdate", "LostAndFound")
end
