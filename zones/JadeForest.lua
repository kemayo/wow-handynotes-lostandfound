local myname, ns = ...

ns.RegisterPoints(371, { -- The Jade Forest
    [39400730] = { loot={85776}, note="in the well", quest=31397, }, -- Wodin's Mantid Shaker
    [39264665] = { loot={86199}, npc=64272, quest=31307, }, -- Jade Infused Blade
    [43001160] = { loot={86198}, quest=31403, }, -- Hammer of Ten Thunders
    [41801760] = { loot={86198}, quest=31403, }, -- Hammer of Ten Thunders
    [41201390] = { loot={86198}, quest=31403, }, -- Hammer of Ten Thunders
    [46102920] = { loot={85777}, note="in the cave", quest=31399, }, -- Ancient Pandaren Mining Pick
    [47106740] = { loot={86196}, quest=31402, }, --Ancient Jinyu Staff
    [46207120] = { loot={86196}, quest=31402, }, --Ancient Jinyu Staff
}, {
	achievement=7284, -- Is Another Man's Treasure
})
ns.RegisterPoints(373, { -- Greenstone Quarry, cave in Jade Forest
    [33107800] = {}, -- Ancient Pandaren Mining Pick
    [44007050] = {}, -- Ancient Pandaren Mining Pick
    [43703850] = {}, -- Ancient Pandaren Mining Pick
    [38704750] = {}, -- Ancient Pandaren Mining Pick
    [32606270] = {}, -- Ancient Pandaren Mining Pick
    [38231394] = {}, -- Ancient Pandaren Mining Pick
}, {
	achievement=7284, -- Is Another Man's Treasure
	quest=31399,
	loot={85777},
})

ns.RegisterPoints(371, { -- The Jade Forest
    [26223235] = { loot={85780}, quest=31400, }, -- Ancient Pandaren Tea Pot
    [31962775] = { loot={85781}, quest=31401, }, -- Lucky Pandaren Coin
    [23493505] = { loot={86216}, quest=31404, }, -- Pandaren Ritual Stone
    [51229999] = { label="Ship's Locker", quest=31396, },
}, ns.riches{})
ns.RegisterPoints(371, { -- The Jade Forest
    [24005300] = { label="Chest of Supplies", group="junk", quest=31864, },
    [46308070] = { label="Offering of Rememberance", group="junk", quest=31865, },
    [62452752] = { label="Stash of Gems", group="junk", quest=31866, },
})
