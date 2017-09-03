function onStepIn(cid, item, pos)
local config = {
bosspos = {
{x=32842,y=32672,z=11}, -- position where yakchal first spawns
},
boss = "the nexious spawn", -- name of the boss
}



local thais = {x=32843, y=32667, z=11}
local thaiss = {x=32842, y=32659, z=11}

    if item.actionid == 16350 and getPlayerStorageValue (cid, 16751) == 1 and getPlayerStorageValue (cid, 16753) == -1 then 
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),10)
		doCreatureSay(cid, 'You have ten minutes to kill and loot this boss, else you will lose that chance and will be kicked out.', TALKTYPE_ORANGE_1)
		doPlayerSetStorageValue (cid, 16753, 1)
		doSummonCreature(config.boss, config.bosspos[1])
		elseif getPlayerStorageValue (cid, 16751) == -1 then
		doTeleportThing(cid,thaiss)
		doCreatureSay(cid, 'You did not complete the task Quest!', TALKTYPE_ORANGE_1)
		else
		doTeleportThing(cid,thaiss)
		doCreatureSay(cid, 'You already had a chance to kill The Nexious Spawn.', TALKTYPE_ORANGE_1)
		end	
    return 1
end