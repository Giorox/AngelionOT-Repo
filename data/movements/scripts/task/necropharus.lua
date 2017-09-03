function onStepIn(cid, item, pos)
local config = {
bosspos = {
{x=33027,y=32423,z=12}, -- position where yakchal first spawns
},
boss = "necropharus", -- name of the boss
}



local thais = {x=33028, y=32427, z=12}
local thaiss = {x=33045, y=32439, z=11}

    if item.actionid == 16340 and getPlayerStorageValue (cid, 16721) == 1 and getPlayerStorageValue (cid, 16720) == -1 then 
		doTeleportThing(cid,thais)
        doSendMagicEffect(getCreaturePosition(cid),10)
		doCreatureSay(cid, 'You have ten minutes to kill and loot this boss, else you will lose that chance and will be kicked out.', TALKTYPE_ORANGE_1)
		doPlayerSetStorageValue (cid, 16720, 1)
		doSummonCreature(config.boss, config.bosspos[1])
		elseif getPlayerStorageValue (cid, 16721) == -1 then
		doTeleportThing(cid,thaiss)
		doCreatureSay(cid, 'You did not complete the task Quest!', TALKTYPE_ORANGE_1)
		else
		doTeleportThing(cid,thaiss)
		doCreatureSay(cid, 'You already had a chance to kill Necropharus.', TALKTYPE_ORANGE_1)
		end	
    return 1
end 