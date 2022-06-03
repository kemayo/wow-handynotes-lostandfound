local myname, ns = ...

-- Rares

local archiereus = { -- Archiereus of Flame +4
    quest=33312,
    criteria=31, -- API says 0 for its ID, maybe because of the two npc ids?
    npc=73174,
}
local flintlord = { -- Flintlord Gairan +4
    quest=33309,
    criteria=23995,
    npc=73172,
    loot={
        104298, -- Ordon Death Chime
    },
}
ns.RegisterPoints(554, { -- Timeless Isle
    [48203320] = archiereus,
    [49602200] = archiereus,
    [56603570] = archiereus,
    [58202490] = archiereus,
    [35003130] = { -- Archiereus of Flame
        quest={33312, 33343},
        criteria=31, -- API says 0 for its ID, maybe because of the two npc ids?
        npc=73666,
        note="Summoned for {quest:33343}",
    },
    [63737281] = { -- Bufo
        quest=33301,
        criteria=23986,
        npc=72775,
        loot={
            {104169, pet=1338,}, -- Gulp Froglet
        },
    },
    [60005100] = { -- Champion of the Black Flame
        quest=33299,
        criteria=23996,
        npc=73171,
        loot={
            {104302, toy=true,}, -- Blackflame Daggers
            106130, -- Big Bag of Herbs
        },
        routes={{60005100,61404540,63704280,66804240,69404360,71104600,70205300,66405880}},
    },
    [25203540] = { -- Chelon
        quest=32966,
        criteria=23974,
        npc=72045,
        loot={
            {86584, toy=true,}, -- Hardened Shell
        },
    },
    [54005240] = { -- Cinderfall
        quest=33310,
        criteria=23981,
        npc=73175,
        loot={
            104299, -- Falling Flame
            104261, -- Glowing Blue Ash
        },
    },
    [43606940] = { -- Cranegnasher
        quest=33319,
        criteria=23976,
        npc=72049,
        loot={
            104268, -- Pristine Stalker Hide
        },
    },
    [25802260] = { -- Dread Ship Vazuvius
        quest=33314,
        criteria=23987,
        npc=73281,
        loot={
            {104294, toy=true,}, -- Rime of the Time-Lost Mariner
        },
        note="Requires {item:104115} from {npc:73279} to summon",
    },
    [33149115] = { -- Evermaw
        quest=33289,
        criteria=23990,
        npc=73279,
        loot={
            104115, -- Mist-Filled Spirit Lantern
        },
        routes={
            {14003500,14202960,18201840,24200820,33400280,44000360,53000540,63600680,72401480,76002080,79002820,80603420,80606060, 80206640,77607600,75408280,63409520,42409780,35409260,26208500,20407380,16806480,14405880,14004460, loop=true}
        }
    },
    [40202580] = flintlord,
    [43803320] = flintlord,
    [46203920] = flintlord,
    [48803700] = flintlord,
    [55203800] = flintlord,
    [64202860] = { -- Garnia
        quest=33300,
        criteria=23982,
        npc=73282,
        loot={
            {104159, pet=1328,}, -- Ruby Droplet
        },
    },
    [61606340] = { -- Golganarr
        quest=33315,
        criteria=23988,
        npc=72970,
        loot={
            {104262, toy=true,}, -- Odd Polished Stone
            104263, -- Glinting Pile of Stone
        },
    },
    [40208280] = { -- Gu'chi the Swarmbringer +5
        quest=33260,
        criteria=23970,
        npc=72909,
        loot={
            {104291,pet=1345,}, -- Swarmling of Gu'chi
            104290, -- Sticky Silkworm Goo
        },
        routes={{40208280, 40607940, 42067500, 40807000, 36206960, 30607280, 33607940, 36808100, loop=true}},
        note="Patrols counterclockwise around the village",
    },
    [65505730] = { -- Huolon
        quest=33311,
        criteria=23984,
        npc=73167,
        loot={
            {104269,mount=561,}, -- Reins of the Thundering Onyx Cloud Serpent
        },
        routes={{65505730,71805100,74004500,64404060,60304490,58005840}},
    },
    [52408240] = { -- Jakur of Ordon
        quest=33306,
        criteria=23994,
        npc=73169,
        loot={
            {104331, toy=true,}, -- Warning Sign
            104245, -- Technique: Glyph of the Weaponmaster
        },
    },
    [33608540] = { -- Karkanos
        quest=33292,
        criteria=23973,
        npc=72193,
        loot={
            104035, -- Giant Purse of Timeless Coins
        },
    },
    [67404380] = { -- Leafmender
        quest=33298,
        criteria=23979,
        npc=73277,
        loot={
            {104156, pet=1323,}, -- Ashleaf Spriteling
        },
    },
    [60208740] = { -- Rattleskew
        quest=nil,
        criteria=23977,
        npc=72048,
        loot={
            104321, -- Captain Zvezdan's Lost Leg
            104219, -- Technique: Glyph of Skeleton
        },
    },
    [44003920] = { -- Rock Moss
        quest=33307,
        criteria=23980,
        npc=73157,
        loot={
            104313, -- Golden Moss
        },
        note="Inside the cave",
    },
    [58004860] = { -- Spelurk
        quest=32960,
        criteria=23975,
        npc=71864,
        loot={
            104320, -- Cursed Talisman
        },
    },
    [44003720] = { -- Spirit of Jadefire
        quest=33293,
        criteria=23978,
        npc=72769,
        loot={
            {104307,pet=1348,}, -- Jadefire Spirit
            104258, -- Glowing Green Ash
        },
        note="Inside the cave",
    },
    [71208220] = { -- Stinkbraid
        quest=33305,
        criteria=24144,
        npc=73704,
        loot={6657}, -- Savory Deviate Delight
    },
    [54004220] = { -- Tsavo'ka
        quest=33304,
        criteria=23983,
        npc=72808,
        loot={
            104268, -- Pristine Stalker Hide
        },
    },
    [43202660] = { -- Urdur the Cauterizer
        quest=33308,
        criteria=23993,
        npc=73173,
        loot={
            104306, -- Sunset Stone
        },
    },
    [57207640] = { -- Watcher Osu
        quest=33322,
        criteria=23992,
        npc=73170,
        loot={
            104305, -- Ashen Stone
        },
    },
    [47008740] = { -- Zesqua
        quest=33316,
        criteria=23971,
        npc=72245,
        loot={
            104303, -- Rain Stone
            104225, -- Charred Recipe
        },
    },
    [37207700] = { -- Zhu-Gon the Sour
        quest=33317,
        criteria=23972,
        npc=71919,
        loot={
            {104167, pet=1336,}, -- Skunky Alemental
        },
    },
}, {
    achievement=8714, -- Timeless Champion
})
ns.RegisterPoints(554, { -- Timeless Isle
    [30805060] = { -- Emerald Gander +11
        quest=33261,
        criteria=23967,
        npc=73158,
        note="Rare spawn of {npc:72762:Brilliant Windfeather}",
    },
    [23604980] = { -- Great Turtle Furyshell +6
        quest=33297,
        criteria=23969,
        npc=73161,
        loot={
            {86584,toy=true,}, -- Hardened Shell
        },
        note="Rare spawn of {npc:72764:Great Turtle}",
    },
    [29206320] = { -- Imperial Python +10
        quest=33303,
        criteria=23989,
        npc=73163,
        loot={
            {104161,pet=1330,}, -- Death Adder Hatchling
        },
        note="Rare spawn of {npc:72841:Death Adder}",
    },
    [31805840] = { -- Ironfur Steelhorn +9
        quest=33296,
        criteria=23968,
        npc=73160,
        note="Rare spawn of {npc:72844:Ironfur Great Bull}",
    },
    [18805460] = { -- Monstrous Spineclaw +14
        quest=nil,
        criteria=23985,
        npc=73166,
        loot={
            {104168,pet=1337,}, -- Spineclaw Crab
        },
        note="Rare spawn of {npc:72766:Ancient Spineclaw}",
    },
}, {
    achievement=8714, -- Timeless Champion
    note="Kill similar mobs nearby until it spawns",
})
ns.RegisterPoints(555, { -- Cavern of Lost Spirits
    [43003180] = { -- Rock Moss
        quest=33307,
        criteria=23980,
        npc=73157,
        loot={
            104313, -- Golden Moss
        },
    },
    [47806180] = { -- Spirit of Jadefire +7
        quest=33293,
        npc=72769,
        loot={
            {104307, pet=1348,}, -- Jadefire Spirit
            104258, -- Glowing Green Ash
        },
    },
}, {
    achievement=8714, -- Timeless Champion
})
