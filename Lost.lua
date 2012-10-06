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
        completed = false,
        icon_scale = 1.4,
        icon_alpha = 0.8,
    },
}

---------------------------------------------------------
-- Localize some globals
local next = next
local GameTooltip = GameTooltip
local WorldMapTooltip = WorldMapTooltip
local HandyNotes = HandyNotes
local GetAchievementInfo = GetAchievementInfo
local GetAchievementCriteriaInfo = GetAchievementCriteriaInfo

---------------------------------------------------------
-- Constants

local points = {
    -- [mapFile] = { [coord] = "label" }
    ["KunLaiSummit"] = {
    },
    ["TownlongWastes"] = {
    },
    ["ValleyoftheFourWinds"] = {
    },
    ["DreadWastes"] = {
    },
    ["Krasarang"] = {
    },
    ["ValeofEternalBlossoms"] = {
    },
    ["TheJadeForest"] = {
        [39400730] = { type="item", id=85776, }, -- Wodin's Mantid Shaker
        [39264665] = { type="item", id=86199, }, -- Jade Infused Blade
        [43001160] = { type="item", id=86198, }, -- Hammer of Ten Thunders
        [41801760] = { type="item", id=86198, }, -- Hammer of Ten Thunders
        [44102700] = { type="item", id=85777, }, -- Ancient Pandarian Mining Pick
        [43803070] = { type="item", id=85777, }, -- Ancient Pandarian Mining Pick
        [47106740] = { type="item", id=86196, },--Ancient Jinyu Staff
        [46207120] = { type="item", id=86196, },--Ancient Jinyu Staff
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
        return link or 'item:'..id, trimmed_icon(texture or default_texture)
    end,
}
local get_point_info = function(point)
    if point then
        if type(point) == "string" then
            return point, trimmed_icon(default_texture)
        end
        return point_info_handlers[point.type](point.id)
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
            info.arg1 = clickedLandmarkZone
            info.arg2 = clickedLandmark
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
        ToggleDropDownMenu(1, nil, HL_Dropdown, self, 0, 0)
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
    local function iter(t, prestate)
        if not t then return nil end
        local state, value = next(t, prestate)
        while state do -- Have we reached the end of this zone?
            if value then
                local label, icon = get_point_info(value)
                Debug("iter step", state, icon, db.icon_scale, db.icon_alpha)
                return state, nil, icon, db.icon_scale, db.icon_alpha
            end
            state, value = next(t, state) -- Get next data
        end
        return nil, nil, nil, nil
    end
    function HLHandler:GetNodes(mapFile)
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
            arg = "icon_scale",
            order = 20,
        },
        icon_alpha = {
            type = "range",
            name = "Icon Alpha",
            desc = "The alpha transparency of the icons",
            min = 0, max = 1, step = 0.01,
            arg = "icon_alpha",
            order = 30,
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
