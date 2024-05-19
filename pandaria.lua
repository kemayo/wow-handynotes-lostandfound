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

ns.RegisterPoints(424, {}) -- continent
