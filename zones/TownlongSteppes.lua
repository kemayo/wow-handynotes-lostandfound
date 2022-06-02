local myname, ns = ...

ns.RegisterPoints(388, { -- Townlong Steppes
    [66304470] = { loot={86518}, quest=31425, }, -- Yaungol Fire Carrier
    [66804800] = { loot={86518}, quest=31425, }, -- Yaungol Fire Carrier
}, {
	achievement=7284, -- Is Another Man's Treasure
})
ns.RegisterPoints(388, { -- Townlong Steppes
    [62823405] = { label="Abandoned Crate of Goods", note="in a tent", quest=31427, },
    [65838608] = { loot={86472}, quest=31426, }, -- Amber Encased Moth
    [52845617] = { loot={86517}, quest=31424, }, -- Hardened Sap of Kri'vess
    [57505850] = { loot={86517}, quest=31424, }, -- Hardened Sap of Kri'vess
    [32806160] = { loot={86516}, note="in the cave", quest=31423, }, -- Fragment of Dread
}, ns.riches{})
ns.RegisterPoints(389, { -- Niuzao Catacombs, cave in Townlong
    [56406480] = { loot={86516}, quest=31423, }, -- Fragment of Dread
    [36908760] = { loot={86516}, quest=31423, }, -- Fragment of Dread
    [48408860] = { loot={86516}, quest=31423, }, -- Fragment of Dread
    [64502150] = { loot={86516}, quest=31423, }, -- Fragment of Dread
}, ns.riches{})
