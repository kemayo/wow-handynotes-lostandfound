local myname, ns = ...

local numbered = function(point)
	point.texture = ns.atlas_texture("services-number-"..point.criteria, nil, 0.25)
	return point
end

ns.RegisterPoints(379, { -- Kun Lai Summit
    [71726302] = numbered{achievement=6847, criteria=3}, -- The Song of the Yaungol, Yaungoil
    [40904250] = numbered{achievement=6855, criteria=7}, -- The Seven Burdens of Shaohao, The Emperor's Burden - Part 7
    [77559533] = numbered{achievement=6716, criteria=2}, -- Between a Saurok and a Hard Place, The Defiant
    [67764833] = numbered{achievement=6855, criteria=6}, -- The Seven Burdens of Shaohao, The Emperor's Burden - Part 6
    [74488355] = numbered{achievement=6846, criteria=4}, -- Fish Tails, Role Call
    [44705237] = numbered{achievement=7230, criteria=3}, -- Legend of the Brewfathers, Ren Yun the Blind
    [50307930] = numbered{achievement=6847, criteria=1}, -- The Song of the Yaungol, Yaungol Tactics
    [50604805] = numbered{achievement=6754, criteria=1}, -- The Dark Heart of the Mogu, Valley of the Emperors
    [63044082] = numbered{achievement=6858, criteria=5}, -- What is Worth Fighting For, Victory in Kun-Lai
    [43825119] = numbered{achievement=6855, criteria=2}, -- The Seven Burdens of Shaohao, The Emperor's Burden - Part 2
    [45766190] = numbered{achievement=6850, criteria=4}, -- Hozen in the Mist, The Hozen Ravage
    -- [53004650] = numbered{6754, 1, "Entrance"}, -- The Dark Heart of the Mogu, Valley of the Emperors
}, {})
ns.RegisterPoints(388, { -- Townlong Steppes
    [84087286] = numbered{achievement=6847, criteria=4}, -- The Song of the Yaungol, Trapped in a Strange Land
    [37746291] = numbered{achievement=6855, criteria=5}, -- The Seven Burdens of Shaohao, The Emperor's Burden - Part 5
    [65505010] = numbered{achievement=6847, criteria=2}, -- The Song of the Yaungol, Dominance
}, {})
ns.RegisterPoints(376, { -- Valley of the Four Winds
    [34576387] = numbered{achievement=6856, criteria=3}, -- Ballad of Liu Lang, The Wandering Widow
    [20255586] = numbered{achievement=6856, criteria=1}, -- Ballad of Liu Lang, The Birthplace of Liu Lang
    [83192118] = numbered{achievement=6850, criteria=3}, -- Hozen in the Mist, Embracing the Passions
    [18843170] = numbered{achievement=6858, criteria=1}, -- What is Worth Fighting For, Pandaren Fighting Tactics
    [61223469] = numbered{achievement=6846, criteria=2}, -- Fish Tails, Waterspeakers
    [55094713] = numbered{achievement=6856, criteria=2}, -- Ballad of Liu Lang, A Most Famous Bill of Sale
}, {})
ns.RegisterPoints(422, { -- Dread Wastes
    [67506090] = numbered{achievement=6716, criteria=3}, -- Between a Saurok and a Hard Place, The Deserters
    [35533261] = numbered{achievement=6857, criteria=4}, -- Heart of the Mantid Swarm, The Empress
    -- [53611548] = numbered{6857, 3, "Entrance"}, -- Heart of the Mantid Swarm, Amber
    [52521006] = numbered{achievement=6857, criteria=3}, -- Heart of the Mantid Swarm, Amber
    [48383285] = numbered{achievement=6857, criteria=1}, -- Heart of the Mantid Swarm, Cycle of the Mantid
    [59905470] = numbered{achievement=6857, criteria=2}, -- Heart of the Mantid Swarm, Mantid Society
}, {})
ns.RegisterPoints(418, { -- Krasarang Wilds
    [52962742] = numbered{achievement=6754, criteria=2}, -- The Dark Heart of the Mogu, The Lost Dynasty
    [33402500] = numbered{achievement=6716, criteria=4}, -- Between a Saurok and a Hard Place, The Last Stand
    [41705420] = numbered{achievement=6855, criteria=4}, -- The Seven Burdens of Shaohao, The Emperor's Burden - Part 4
    [54508770] = numbered{achievement=6850, criteria=2}, -- Hozen in the Mist, Hozen Maturiy
    [31003480] = numbered{achievement=6846, criteria=3}, -- Fish Tails, Origins
    [75812668] = numbered{achievement=6856, criteria=4}, -- Ballad of Liu Lang, Waiting for the Turtle
    [85600560] = numbered{achievement=7230, criteria=1}, -- Legend of the Brewfathers, Quan Tou Kou the Two Fisted
}, {})
ns.RegisterPoints(390, { -- Vale of Eternal Blossoms
    [26622149] = numbered{achievement=6858, criteria=4}, -- What is Worth Fighting For, Together, We Are Strong
    [40247748] = numbered{achievement=6754, criteria=4}, -- The Dark Heart of the Mogu, The Thunder King
    [52936865] = numbered{achievement=6858, criteria=2}, -- What is Worth Fighting For, Always Remember
    [68804422] = numbered{achievement=6855, criteria=8}, -- The Seven Burdens of Shaohao, The Emperor's Burden - Part 8
}, {})
ns.RegisterPoints(371, { -- The Jade Forest
    [35743046] = numbered{achievement=6858, criteria=3}, -- What is Worth Fighting For, The First Monks
    [47084514] = numbered{achievement=6855, criteria=1}, -- The Seven Burdens of Shaohao, The Emperor's Burden - Part 1
    [26382833] = numbered{achievement=6850, criteria=1}, -- Hozen in the Mist, Hozen Speech
    [67722935] = numbered{achievement=6716, criteria=1}, -- Between a Saurok and a Hard Place, The Saurok
    [42261747] = numbered{achievement=6754, criteria=3}, -- The Dark Heart of the Mogu, Spirit Binders
    [37303012] = numbered{achievement=7230, criteria=2}, -- Legend of the Brewfathers, Xin Wo Yin the Broken Hearted
    [66018756] = numbered{achievement=6846, criteria=1}, -- Fish Tails, Watersmithing
    [55885685] = numbered{achievement=6855, criteria=3}, -- The Seven Burdens of Shaohao, The Emperor's Burden - Part 3
}, {})
ns.RegisterPoints(504, { -- Isle of the Thunder King
    [35107010] = numbered{achievement=8049, criteria=1}, -- Zandalari Prophecy, Coming of Age
    [68704580] = numbered{achievement=8049, criteria=2}, -- Zandalari Prophecy, For Council and King
    [36307040] = numbered{achievement=8049, criteria=3}, -- Zandalari Prophecy, Shadows of the Loa
    [52604140] = numbered{achievement=8049, criteria=4}, -- Zandalari Prophecy, The Dark Prophet Zul
    [40204060] = numbered{achievement=8050, criteria=1}, -- Rumbles of Thunder, Lei Shen
    [47005990] = numbered{achievement=8050, criteria=2}, -- Rumbles of Thunder, The Sacred Mount
    [34906560] = numbered{achievement=8050, criteria=3}, -- Rumbles of Thunder, Unity at a Price
    [60706880] = numbered{achievement=8050, criteria=4}, -- Rumbles of Thunder, The Pandaren Problem
    [35805470] = numbered{achievement=8051, criteria=1}, -- Gods and Monsters, Agents of Order
    [59202630] = numbered{achievement=8051, criteria=2}, -- Gods and Monsters, Shadow, Storm, and Stone
    [49902040] = numbered{achievement=8051, criteria=3}, -- Gods and Monsters, The Curse and the Silence
    [62503770] = numbered{achievement=8051, criteria=4}, -- Gods and Monsters, Age of a Hundred Kings
}, {})
