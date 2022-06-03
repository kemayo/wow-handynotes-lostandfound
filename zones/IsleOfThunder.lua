local myname, ns = ...

ns.RegisterPoints(504, { -- Isle of Thunder
    [44603000] = { -- Al'tabim the All-Seeing
        quest=nil,
        criteria=22826,
        npc=70000,
    },
    [48402540] = { -- Backbreaker Uru
        quest=nil,
        criteria=22827,
        npc=70001,
    },
    [61404940] = { -- God-Hulk Ramuk
        quest=nil,
        criteria=22825,
        npc=69999,
    },
    [53605300] = { -- Goda
        quest=nil,
        criteria=22824,
        npc=69998,
    },
    [48208700] = { -- Haywire Sunreaver Construct
        quest=nil,
        criteria=22820,
        npc=50358,
        loot={
            {94124,pet=1178,}, -- Sunreaver Micro-Sentry
        },
    },
    [33408080] = { -- Ku'lai the Skyclaw +2
        quest=nil,
        criteria=22822,
        npc=69996,
    },
    [54403560] = { -- Lu-Ban
        quest=nil,
        criteria=22828,
        npc=70002,
    },
    [59403640] = { -- Molthor +2
        quest=nil,
        criteria=22829,
        npc=70003,
    },
    [35006220] = { -- Mumta
        quest=nil,
        criteria=22821,
        npc=69664,
    },
    [50407220] = { -- Progenitus
        quest=nil,
        criteria=22823,
        npc=69997,
    },
}, {
    achievement=8103, -- Champions of Lei Shen
})
ns.RegisterPoints(505, { -- Lightning Vein Mine
    [33802760] = { -- Backbreaker Uru +5
        quest=nil,
        criteria=22827,
        npc=70001,
    },
})
ns.RegisterPoints(506, { -- The Swollen Vault
    [32003180] = { -- Molthor +6
        quest=nil,
        criteria=22829,
        npc=70003,
    },
})

ns.RegisterPoints(504, { -- Isle of Thunder
    [60503730] = { -- Nalak
        quest=32518,
        npc=69099,
        loot={
            {95057,mount=542,}, -- Reins of the Thundering Cobalt Cloud Serpent
            95602, -- Stormtouched Cache
        },
        atlas="VignetteKillElite", scale=1.2,
    },
    [39408140] = { -- Ra'sha
        quest=nil,
        npc=70530,
        loot={
            95566, -- Ra'sha's Sacrificial Dagger
        },
    },
})
