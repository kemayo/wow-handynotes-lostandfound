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
        achievement_only = true,
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
        [52907140] = { type="item", id=86394, note="in the cave", }, -- Hozen Warrior Spear
        [35207640] = { type="item", id=86125, note="on Frozen Trail Packer", }, -- Kafa Press
        [74707490] = { type="plain", id="Sprite's Cloth Chest", },
        [57507100] = { type="plain", id="Sprite's Cloth Chest", },
        [71206260] = { type="item", id=88723, note="in Stash of Yaungol Weapons", }, -- Sturdy Yaungol Spear
        [44705240] = { type="item", id=86393, }, -- Tablet of Ren Yun
        [64204510] = { type="item", id=86471, junk=true, }, -- Ancient Mogu Tablet
        [49405940] = { type="plain", id="Hozen Treasure Cache", junk=true, },
        [51802580] = { type="plain", id="Hozen Treasure Cache", junk=true, },
        [36707980] = { type="plain", id="Lost Adventurer's Belongings", junk=true, },
        [47007300] = { type="plain", id="Mo-Mo's Treasure Chest", junk=true, },
        [52605150] = { type="item", id=86430, junk=true, note="in Rikktik's Tiny Chest", }, -- Rikktik's Tick Remover
        [72003390] = { type="item", id=86422, junk=true, }, -- Statue of Xuen
        [56804890] = { type="plain", id="Stolen Sprite Treasure", junk=true, },
        [41504360] = { type="plain", id="Stolen Sprite Treasure", junk=true, },
        [32005020] = { type="plain", id="Stolen Sprite Treasure", junk=true, },
        [58407350] = { type="item", id=86427, junk=true, }, -- Terracotta Head
    },
    ["TownlongWastes"] = {
        [66304470] = { type="item", id=86518, }, -- Yaungol Fire Carrier
        [66804800] = { type="item", id=86518, }, -- Yaungol Fire Carrier
        [62803410] = { type="plain", id="Abandoned Crate of Goods", junk=true, },
        [65808610] = { type="item", id=86472, junk=true, }, -- Amber Encased Moth
        [56406480] = { type="item", id=86516, junk=true, }, -- Fragment of Dread
        [36506120] = { type="item", id=86516, junk=true, }, -- Fragment of Dread
        [36908760] = { type="item", id=86516, junk=true, }, -- Fragment of Dread
        [48408860] = { type="item", id=86516, junk=true, }, -- Fragment of Dread
        [52805620] = { type="item", id=86517, junk=true, }, -- Hardened Sap of Kri'vess
        [57505850] = { type="item", id=86517, junk=true, }, -- Hardened Sap of Kri'vess
    },
    ["ValleyoftheFourWinds"] = {
        [46802460] = { type="item", id=85973, note="on Ghostly Pandaren Fisherman", }, -- Ancient Pandaren Fishing Charm
        [45403820] = { type="item", id=86079, note="on Ghostly Pandaren Craftsman", }, -- Ancient Pandaren Woodcutter
        [15402920] = { type="item", id=86218, }, -- Staff of the Hidden Master
        [14903360] = { type="item", id=86218, }, -- Staff of the Hidden Master
        [17503570] = { type="item", id=86218, }, -- Staff of the Hidden Master
        [19103780] = { type="item", id=86218, }, -- Staff of the Hidden Master
        [19004250] = { type="item", id=86218, }, -- Staff of the Hidden Master
        [43503740] = { type="plain", id="Cache of Pilfered Goods", },
        [92003900] = { type="item", id=87524, junk=true, }, -- Boat-Building Instructions
        [23802840] = { type="plain", id="Virmen Treasure Cache", junk=true, },
    },
    ["DreadWastes"] = {
        [66306660] = { type="item", id=86522, }, -- Blade of the Prime
        [25905030] = { type="item", id=86525, }, -- Bloodsoaked Chitin Fragment
        [30209080] = { type="item", id=86524, }, -- Dissector's Staff of Mutation
        [33003010] = { type="item", id=86521, }, -- Lucid Amulet of the Agile Mind
        [48703000] = { type="item", id=86520, }, -- Malik's Stalwart Spear
        [42206360] = { type="item", id=86529, note="on Glinting Rapana Whelk", }, -- Manipulator's Talisman on a Glinting Rapana Whelk (65552)
        [56607780] = { type="item", id=86523, }, -- Swarming Cleaver of Ka'roz
        [71803610] = { type="item", id=86519, }, -- Wind-Reaver's Dagger of Quick Strikes
        [28804190] = { type="item", id=86527, }, -- Blade of the Poisoned Mind
    },
    ["Krasarang"] = {
        [42309200] = { type="plain", id="Equipment Locker", },
        [52308870] = { type="item", id=87266, note="in a barrel" }, -- Recipe: Banana Infused Rum
        [50804930] = { type="item", id=86124, }, -- Pandaren Fishing Spear
        [52007300] = { type="item", id=87798, junk=true, }, -- Stack of Papers
    },
    ["ValeofEternalBlossoms"] = {
        -- nothing?
    },
    ["TheJadeForest"] = {
        [39400730] = { type="item", id=85776, }, -- Wodin's Mantid Shaker
        [39264665] = { type="item", id=86199, }, -- Jade Infused Blade
        [43001160] = { type="item", id=86198, }, -- Hammer of Ten Thunders
        [41801760] = { type="item", id=86198, }, -- Hammer of Ten Thunders
        [44102700] = { type="item", id=85777, }, -- Ancient Pandaren Mining Pick
        [43803070] = { type="item", id=85777, }, -- Ancient Pandaren Mining Pick
        [47106740] = { type="item", id=86196, }, --Ancient Jinyu Staff
        [46207120] = { type="item", id=86196, }, --Ancient Jinyu Staff
        [26203240] = { type="item", id=85780, junk=true, }, -- Ancient Pandaren Tea Pot
        [31902780] = { type="item", id=85781, junk=true, }, -- Lucky Pandaren Coin
        [23503500] = { type="item", id=86216, junk=true, }, -- Pandaren Ritual Stone
    },
    ["TheHiddenPass"] = {
        [74907670] = { type="item", id=86473, junk=true, }, -- The Hammer of Folly
        [55107200] = { type="plain", id="Forgotten Lockbox", junk=true, },
    },
    ["TheDeeper"] = {
        [24106580] = { type="item", id=86394, level=12, }, -- Hozen Warrior Spear
    },
}

local default_texture = select(10, GetAchievementInfo(7284))
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
    item = function(id)
        local name, link, _, _, _, _, _, _, _, texture = GetItemInfo(id)
        return link or 'item:'..id, trimmed_icon(db.icon_item and texture or default_texture)
    end,
    plain = function(id)
        return id, trimmed_icon(default_texture)
    end,
}
local get_point_info = function(point)
    if point then
        local label, icon = point_info_handlers[point.type](point.id)
        if point.note then
            label = ("%s (%s)"):format(label, point.note)
        end
        return label, icon, point.junk
    end
end
local get_point_info_by_coord = function(mapFile, coord)
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
            currentZone = mapFile
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
                    local label, icon, junk = get_point_info(value)
                    Debug("iter step", state, icon, db.icon_scale, db.icon_alpha)
                    if not (junk and db.achievement_only) then
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
        achievement_only = {
            type = "toggle",
            name = "Achievement only",
            desc = "Only show the items which count for the Lost and Found achievement (skips some vendorable greys).",
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

function HL:OnEnable()
    -- self:RegisterEvent("CRITERIA_UPDATE", "Refresh")
    -- self:RegisterEvent("CRITERIA_EARNED", "Refresh")
    -- self:RegisterEvent("CRITERIA_COMPLETE", "Refresh")
    -- self:RegisterEvent("ACHIEVEMENT_EARNED", "Refresh")
end

function HL:Refresh()
    self:SendMessage("HandyNotes_NotifyUpdate", "LostAndFound")
end
