local myname, ns = ...

ns.RegisterPoints(376, { -- Valley of the Four Winds
    [46802460] = { loot={{85973, toy=true}}, npc=64004, quest=31284, }, -- Ancient Pandaren Fishing Charm
    [45403820] = { loot={86079}, npc=64191, quest=31292, }, -- Ancient Pandaren Craftsman
    [15402920] = { loot={86218}, quest=31407, }, -- Staff of the Hidden Master
    [14903360] = { loot={86218}, quest=31407, }, -- Staff of the Hidden Master
    [17503570] = { loot={86218}, quest=31407, }, -- Staff of the Hidden Master
    [19103780] = { loot={86218}, quest=31407, }, -- Staff of the Hidden Master
    [19004250] = { loot={86218}, quest=31407, }, -- Staff of the Hidden Master
    [43603740] = { label="Cache of Pilfered Goods", quest=31406, },
}, {
	achievement=7284, -- Is Another Man's Treasure
})

ns.RegisterPoints(376, { -- Valley of the Four Winds
    [23712833] = { label="Virmen Treasure Cache", quest=31405, },
    [75105510] = { loot={86220}, quest=31408, } -- Saurok Stone Tablet
}, ns.riches{})

ns.RegisterPoints(376, { -- Valley of the Four Winds
	[92003900] = { loot={87524}, group="junk", quest=31869, }, -- Boat-Building Instructions
})
