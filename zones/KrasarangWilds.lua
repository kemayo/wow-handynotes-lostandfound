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

-- Rares

ns.RegisterPoints(418, { -- Krasarang Wilds
    [56204680] = { -- Arness the Scale
        quest=nil,
        criteria=21092,
        npc=50787,
    },
    [30603820] = { -- Cournith Waterstrider
        quest=nil,
        criteria=21057,
        npc=50768,
    },
    [53403860] = { -- Gaarn the Toxic +2
        quest=nil,
        criteria=21071,
        npc=50340,
    },
    [39402880] = { -- Go-Kan
        quest=nil,
        criteria=21099,
        npc=50331,
    },
    [67202300] = { -- Qu'nas
        quest=nil,
        criteria=21078,
        npc=50352,
    },
    [39405520] = { -- Ruun Ghostpaw
        quest=nil,
        criteria=21085,
        npc=50816,
    },
    [51808900] = { -- Spriggin
        quest=nil,
        criteria=21050,
        npc=50830,
    },
    [14403540] = { -- Torik-Ethis
        quest=nil,
        criteria=21064,
        npc=50388,
    },
}, {
    achievement=7439, -- Glorious!
})

ns.RegisterPoints(418, { -- Krasarang Wilds
    [84802720] = { -- Dalan Nightbreaker
        quest=nil,
        npc=68318,
        loot={
            92783, -- Mark of the Hardened Grunt
        },
    },
    [87402920] = { -- Disha Fearwarden
        quest=nil,
        npc=68319,
        loot={
            92787, -- Horde Insignia of Conquering
        },
    },
    [13605700] = { -- Kar Warmaker
        quest=nil,
        npc=68321,
        loot={
            92782, -- Steadfast Footman's Medallion
        },
    },
    [84403100] = { -- Mavis Harms
        quest=nil,
        npc=68317,
        loot={
            92785, -- Kor'kron Book of Hurting
        },
    },
    [10605660] = { -- Muerta
        quest=nil,
        npc=68322,
        loot={
            92786, -- Alliance Insignia of Conquering
        },
    },
    [13006660] = { -- Ubunti the Shade
        quest=nil,
        npc=68320,
        loot={
            92784, -- SI:7 Operative's Manual
        },
    },
})

ns.RegisterPoints(418, { -- Krasarang Wilds
    [39866578] = { -- Zandalari Warbringer
        quest=nil,
        npc=69841, -- also 69769, 69842
        loot={
            {94230,mount=534,}, -- Reins of the Amber Primordial Direhorn
            {94229,mount=535,}, -- Reins of the Slate Primordial Direhorn
            {94231,mount=536,}, -- Reins of the Jade Primordial Direhorn
        },
        atlas="VignetteKillElite", scale=1.2,
    },
    [20004060] = { -- Zandalari Warscout +4
        quest=nil,
        npc=69768,
        loot={
            94159, -- Small Bag of Zandalari Supplies
            94158, -- Big Bag of Zandalari Supplies
        },
        routes={
            {20004060,25604140,31004680,36005840,38606440,42805860,50404120,51202900,57802920},
        },
    },
    [32403420] = { -- Krakkanon
        quest=nil,
        npc=70323,
        loot={
            88563, -- Nat's Fishing Journal
        },
    },
})
