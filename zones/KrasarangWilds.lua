local myname, ns = ...

ns.RegisterPoints(418, { -- Krasarang Wilds
    [43669232] = { loot={86122}, label="Equipment Locker", quest=31410, }, -- Plankwalking Greaves
    [54488873] = { loot={87266}, note="in a barrel", quest=31411, }, -- Recipe: Banana Infused Rum
    [52814644] = { loot={86124}, quest=31409, }, -- Pandaren Fishing Spear
}, {
    achievement=7284, -- Is Another Man's Treasure
})

ns.RegisterPoints(418, { -- Krasarang Wilds
    [54267232] = { loot={87798}, group="junk", quest=31863, }, -- Stack of Papers
    [71000920] = ns.riches{ loot={86220}, note="in the cave", quest=31408, }, -- Saurok Stone Tablet
})
