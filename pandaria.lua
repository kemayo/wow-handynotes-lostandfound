local myname, ns = ...

ns.hiddenConfig = {
    groupsHiddenByZone = true,
}

ns.defaultsOverride = {
    -- show_on_minimap = true,
    -- groupsHidden = {junk=true,},
    achievedfound = false,
}

ns.groups["junk"] = "Junk"

ns.riches = ns.nodeMaker{
    achievement=7997, -- Riches of Pandaria
    atlas="auctioneer",
    minimap=true,
}
ns.treasure = ns.nodeMaker{
    achievement=7284, -- Is Another Man's Treasure
    -- atlas="reagents",
    minimap=true,
}
ns.junk = ns.nodeMaker{
    group="junk",
    minimap=true,
    scale=0.9,
}

-- The Zandalari scouting parties roll one pool between them, in every zone
-- they turn up in.
ns.zandalari_loot = {
    94159, -- Small Bag of Zandalari Supplies
    94158, -- Big Bag of Zandalari Supplies
    94223, -- Stolen Shado-Pan Insignia
    94225, -- Stolen Celestial Insignia
    94226, -- Stolen Klaxxi Insignia
    94227, -- Stolen Golden Lotus Insignia
}

ns.RegisterPoints(424, {}) -- continent
