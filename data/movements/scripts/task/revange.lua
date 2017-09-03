function onStepIn(cid, item, pos)
local config = {
bosspos = {
{x=32883,y=32580,z=4}, -- position where yakchal first spawns
},
boss = "tiquandas revenge", -- name of the boss
}



local thais = {x=32888, y=32580, z=4}
local thaiss = {x=32876, y=32583, z=7}

    if item.actionid == 16335 and getPlayerStorageValue (cid, 16693) == 1 and getPlayerStorageValue (cid, 16694) == -1 then 
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),10)
		doCreatureSay(cid, 'You have ten minutes to kill and loot this boss, else you will lose that chance and will be kicked out.', TALKTYPE_ORANGE_1)
		doPlayerSetStorageValue (cid, 16694, 1)
		doSummonCreature(config.boss, config.bosspos[1])
		elseif getPlayerStorageValue (cid, 16693) == -1 then
		doTeleportThing(cid,thaiss)
		doCreatureSay(cid, 'You did not complete the task Quest!', TALKTYPE_ORANGE_1)
		else
		doTeleportThing(cid,thaiss)
		doCreatureSay(cid, 'You already had a chance to kill Tiquandas Revange.', TALKTYPE_ORANGE_1)
		end	
    return 1
end 