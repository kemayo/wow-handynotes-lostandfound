local myname, ns = ...

ns.RegisterPoints(507, { -- Isle of Giants
    [50005700] = { -- Oondasta
        quest=32519,
        npc=69161,
        loot={
            {94228,mount=533,}, -- Reins of the Cobalt Primordial Direhorn
            95601, -- Shiny Pile of Refuse
        },
        atlas="VignetteKillElite", scale=1.2,
    },
    [77608220] = { -- War-God Dokah
        quest=nil,
        npc=70096,
        loot={
            94159, -- Small Bag of Zandalari Supplies
            94158, -- Big Bag of Zandalari Supplies
        },
    },
})
