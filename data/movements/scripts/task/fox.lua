function onStepIn(cid, item, pos)
local config = {
bosspos = {
{x=32458,y=32005,z=9}, -- position where yakchal first spawns
},
boss = "the horned fox", -- name of the boss
}



local thais = {x=32458, y=31993, z=9}
local thaiss = {x=32451, y=31988, z=9}

    if item.actionid == 16337 and getPlayerStorageValue (cid, 16696) == 1 and getPlayerStorageValue (cid, 16699) == -1 then 
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),10)
		doCreatureSay(cid, 'You have ten minutes to kill and loot this boss, else you will lose that chance and will be kicked out.', TALKTYPE_ORANGE_1)
		doPlayerSetStorageValue (cid, 16699, 1)
		doSummonCreature(config.boss, config.bosspos[1])
		elseif getPlayerStorageValue (cid, 16696) == -1 then
		doTeleportThing(cid,thaiss)
		doCreatureSay(cid, 'You did not complete the task Quest!', TALKTYPE_ORANGE_1)
		else
		doTeleportThing(cid,thaiss)
		doCreatureSay(cid, 'You already had a chance to kill The Horned Fox.', TALKTYPE_ORANGE_1)
		end	
    return 1
end 