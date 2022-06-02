local myname, ns = ...

ns.RegisterPoints(379, { -- Kun Lai Summit
    [52907140] = { loot={86394}, note="in the cave", quest=31413, }, -- Hozen Warrior Spear
    [35207640] = { loot={86125}, quest=31304, npc=64227, }, -- Kafa Press
    [73107350] = { label="Sprite's Cloth Chest", note="in the cave", quest=31412, },
    [71206260] = { loot={88723}, note="in Stash of Yaungol Weapons", quest=31421, }, -- Sturdy Yaungol Spear
    [44705240] = { loot={86393}, quest=31417, }, -- Tablet of Ren Yun
    [47007300] = { label="Mo-Mo's Treasure Chest", group="junk", quest=31868, },
}, {
    achievement=7284, -- Is Another Man's Treasure
})
ns.RegisterPoints(383, { -- TheDeeper, cave in Kun-Lai
    [24106580] = { loot={86394}, quest=31413, }, -- Hozen Warrior Spear
}, {
    achievement=7284, -- Is Another Man's Treasure
})
ns.RegisterPoints(381, { -- PrankstersHollow, cave in Kun-Lai
    [54706980] = { label="Sprite's Cloth Chest", quest=31412, },
}, {
    achievement=7284, -- Is Another Man's Treasure
})

ns.RegisterPoints(379, { -- Kun Lai Summit
    [64234513] = { loot={86471}, quest=31420, note="in the cave" }, -- Ancient Mogu Tablet
    [50366177] = { label="Hozen Treasure Cache", note="in the cave", quest=31414, },
    [36707970] = { label="Lost Adventurer's Belongings", quest=31418, },
    [52575154] = { loot={86430}, note="in Rikktik's Tiny Chest", quest=31419, }, -- Rikktik's Tick Remover
    [72013396] = { loot={86422}, quest=31416, }, -- Statue of Xuen
    [59405300] = { label="Stolen Sprite Treasure", note="in the cave", quest=31415, },
    [59247303] = { loot={86427}, quest=31422, }, -- Terracotta Head
}, ns.riches{})
ns.RegisterPoints(382, { -- KnucklethumpHole, cave in Kun-Lai
    [52002750] = ns.riches{ label="Hozen Treasure Cache", quest=31414, },
})
ns.RegisterPoints(380, { -- HowlingwindCavern, cave in Kun-Lai
    [41674412] = ns.riches{ label="Stolen Sprite Treasure", quest=31415, },
})
