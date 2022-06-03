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

-- Rares

ns.RegisterPoints(371, { -- The Jade Forest
    [33405080] = { -- Aethis
        quest=nil,
        criteria=21055,
        npc=50750,
    },
    [52004460] = { -- Ferdinand
        quest=nil,
        criteria=21097,
        npc=51078,
    },
    [43407640] = { -- Kor'nas Nightsavage
        quest=nil,
        criteria=21069,
        npc=50338,
    },
    [39406240] = { -- Krax'ik
        quest=nil,
        criteria=21062,
        npc=50363,
    },
    [42403880] = { -- Mister Ferocious
        quest=nil,
        criteria=21048,
        npc=50823,
    },
    [40801520] = { -- Morgrinn Crackfang +2
        quest=nil,
        criteria=21076,
        npc=50350,
    },
    [32206500] = { -- Nasra Spothide
        quest=nil,
        criteria=21084,
        npc=50811,
        loot={
            86587, -- Seed of Tranquil Growth
        },
    },
    [64407400] = { -- Sarnak
        quest=nil,
        criteria=21090,
        npc=50782,
    },
    [57207160] = { -- Urobi the Walker
        quest=nil,
        criteria=21083,
        npc=50808,
    },
}, {
    achievement=7439, -- Glorious!
})
ns.RegisterPoints(371, { -- The Jade Forest
    [52401880] = { -- Zandalari Warbringer
        quest=nil,
        npc=69841, -- also 69769, 69842
        loot={
            {94230,mount=534,}, -- Reins of the Amber Primordial Direhorn
            {94229,mount=535,}, -- Reins of the Slate Primordial Direhorn
            {94231,mount=536,}, -- Reins of the Jade Primordial Direhorn
        },
        atlas="VignetteKillElite", scale=1.2,
    },
    [50803680] = { -- Zandalari Warscout
        quest=nil,
        npc=69768,
        loot={
            94159, -- Small Bag of Zandalari Supplies
            94158, -- Big Bag of Zandalari Supplies
        },
        routes={
            {50803680, 53003460, 52603260, 54202760, 52802380, 53001960, 47602100, 45401740, 43201720},
        },
    },
    [51002080] = { -- Krakkanon +2
        quest=nil,
        npc=70323,
        loot={
            88563, -- Nat's Fishing Journal
        },
    },

})