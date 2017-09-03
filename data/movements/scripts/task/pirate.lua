function onStepIn(cid, item, pos)
local config = {
bosspos = {
{x=31984,y=32897,z=0}, -- position where yakchal first spawns
},
boss = "lethal lissy", -- name of the boss
}



local thais = {x=31974, y=32898, z=0}
local thaiss = {x=31976, y=32853, z=1}

    if item.actionid == 16339 and getPlayerStorageValue (cid, 16710) == 1 and getPlayerStorageValue (cid, 16711) == -1 then 
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),10)
		doCreatureSay(cid, 'You have ten minutes to kill and loot this boss, else you will lose that chance and will be kicked out.', TALKTYPE_ORANGE_1)
		doPlayerSetStorageValue (cid, 16711, 1)
		doSummonCreature(config.boss, config.bosspos[1])
		elseif getPlayerStorageValue (cid, 16710) == -1 then
		doTeleportThing(cid,thaiss)
		doCreatureSay(cid, 'You did not complete the task Quest!', TALKTYPE_ORANGE_1)
		else
		doTeleportThing(cid,thaiss)
		doCreatureSay(cid, 'You already had a chance to kill Lethal Lissy.', TALKTYPE_ORANGE_1)
		end	
    return 1
end