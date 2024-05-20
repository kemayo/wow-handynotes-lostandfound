local myname, ns = ...

-- Pre-landing: art=430
-- Post-landing: art=499
-- In the original change in patch 5.1(?), this actually changed the coordinates on the map, but as of the remix in 10.2.7 that's no longer the case

ns.RegisterPoints(418, { -- Krasarang Wilds
    [42409200] = { loot={86122}, label="Equipment Locker", quest=31410, }, -- Plankwalking Greaves
    [52308870] = { loot={87266}, note="in a barrel", quest=31411, }, -- Recipe: Banana Infused Rum
    [50804930] = { loot={86124}, quest=31409, }, -- Pandaren Fishing Spear
}, ns.treasure{})
ns.RegisterPoints(418, { -- Krasarang Wilds
    [52007300] = ns.junk{ loot={87798}, quest=31863, }, -- Stack of Papers
    [69500790] = ns.riches{ loot={86220}, note="in the cave", quest=31408, path=70670959 }, -- Saurok Stone Tablet
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
    -- Post-landing PVP rares:
    [84802720] = { -- Dalan Nightbreaker
        quest=nil,
        npc=68318,
        loot={
            92783, -- Mark of the Hardened Grunt
        },
        faction="Horde",
    },
    [87402920] = { -- Disha Fearwarden
        quest=nil,
        npc=68319,
        loot={
            92787, -- Horde Insignia of Conquering
        },
        faction="Horde",
    },
    [13605700] = { -- Kar Warmaker
        quest=nil,
        npc=68321,
        loot={
            92782, -- Steadfast Footman's Medallion
        },
        faction="Alliance",
    },
    [84403100] = { -- Mavis Harms
        quest=nil,
        npc=68317,
        loot={
            92785, -- Kor'kron Book of Hurting
        },
        faction="Horde",
    },
    [10605660] = { -- Muerta
        quest=nil,
        npc=68322,
        loot={
            92786, -- Alliance Insignia of Conquering
        },
        faction="Alliance",
    },
    [13006660] = { -- Ubunti the Shade
        quest=nil,
        npc=68320,
        loot={
            92784, -- SI:7 Operative's Manual
        },
        faction="Alliance",
    },
}, {art=499})

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
        vigentte=163,
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
        vigentte=98,
    },
    [32403420] = { -- Krakkanon
        quest=nil,
        npc=70323,
        loot={
            88563, -- Nat's Fishing Journal
        },
    },
})

-- Lobstmourne
ns.RegisterPoints(418, { -- Krasarang Wilds
    [12608200] = {
        npc=66936, -- Clawlord Krilmandar
        loot={90087}, -- Lobstmourne
        note="Kill six Makrura elites around Pandaria to make {item:90172:Clamshell Band}",
        active=ns.conditions.Item(90172), -- Clamshell Band
        texture=ns.atlas_texture("Vehicle-Trap-Grey", {r=0, g=0, b=1, scale=1.3}),
        minimap=true,
    },
})
local makrura = {
    note="Kill the five other Makrura for their clamshells, make the {item:90172:Clamshell Band}, and summon {npc:66936:Clawlord Krilmandar} in Krasarang Wilds",
    inbag=90172,
    texture=ns.atlas_texture("Vehicle-Trap-Grey", {r=0, g=1, b=1, scale=1.3}),
    minimap=true,
}
ns.RegisterPoints(371, { -- The Jade Forest
    [59203660] = {
        npc=66932, -- Akkalou
        loot={90166}, -- Akkalou's Clamshell
        found={ns.conditions.Item(90166)},
    },
    [59809580] = {
        npc=66937, -- Akkalar
        loot={90167}, -- Akkalar's Clamshell
        found={ns.conditions.Item(90167)},
    },
}, makrura)
ns.RegisterPoints(418, { -- Krasarang Wilds
    [40008860] = {
        npc=66934, -- Damlak
        loot={90169}, -- Damlak's Clamshell
        found={ns.conditions.Item(90169)},
    },
}, makrura)
ns.RegisterPoints(422, { -- Dread Wastes
    [27006900] = {
        npc=66935, -- Clamstok
        loot={90170}, -- Clamstok's Clamshell
        found={ns.conditions.Item(90170)},
    },
}, makrura)
ns.RegisterPoints(388, { -- Townlong Steppes
    [42609260] = {
        npc=66938, -- Odd'nirok
        loot={90171}, -- Odd'nirok's Clamshell
        found={ns.conditions.Item(90171)},
    },
}, makrura)
ns.RegisterPoints(379, { -- Kun Lai Summit
    [54202160] = {
        npc=66933, -- Kishak
        loot={90168}, -- Kishak's Clamshell
        found={ns.conditions.Item(90168)},
        route={54202160, 54002060, 51601840, 47001840, 45002060, 44201940, 42202380},
    },
}, makrura)
