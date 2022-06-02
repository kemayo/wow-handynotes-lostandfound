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
}
