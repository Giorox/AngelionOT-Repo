function onStepIn(cid, item, pos)
local config = {
bosspos = {
{x=32746,y=32295,z=10}, -- position where yakchal first spawns
},
boss = "demodras", -- name of the boss
}



local thais = {x=32749, y=32287, z=10}
local thaiss = {x=32770, y=32290, z=10}

    if item.actionid == 16345 and getPlayerStorageValue (cid, 16730) == 1 and getPlayerStorageValue (cid, 16733) == -1 then 
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),10)
		doCreatureSay(cid, 'You have ten minutes to kill and loot this boss, else you will lose that chance and will be kicked out.', TALKTYPE_ORANGE_1)
		doPlayerSetStorageValue (cid, 16733, 1)
		doSummonCreature(config.boss, config.bosspos[1])
		elseif getPlayerStorageValue (cid, 16730) == -1 then
		doTeleportThing(cid,thaiss)
		doCreatureSay(cid, 'You did not complete the task Quest!', TALKTYPE_ORANGE_1)
		else
		doTeleportThing(cid,thaiss)
		doCreatureSay(cid, 'You already had a chance to kill Demodras.', TALKTYPE_ORANGE_1)
		end	
    return 1
end