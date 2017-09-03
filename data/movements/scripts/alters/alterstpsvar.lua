function onStepIn(cid, item, pos)

	local ice = {x=32193, y=31419, z=2}
	local earth = {x=32974, y=32224, z=7}
	local fire = {x=32909, y=32338, z=15}
	local energy = {x=33060, y=32711, z=5}
	
	if getPlayerLookDir(cid) == 0 then
		newdir = 2
		newdir2 = 2
	elseif getPlayerLookDir(cid) == 1 then
		newdir = 3
		newdir2 = 3
	elseif getPlayerLookDir(cid) == 2 then
		newdir = 0
		newdir2 = 0
	else
		newdir = 1
		newdir2 = 1
	end

	if item.actionid == 7841 then
		if getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6 and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE then
			doTeleportThing(cid,ice)
			doSendMagicEffect(ice,10)
			setPlayerStorageValue(cid, 15121, 1)
		else
			doCreatureSay(cid, "Only Premium Druids of level 30 or higher are able to enter this portal", TALKTYPE_ORANGE_1)
			doMoveCreature(cid, newdir)
			doMoveCreature(cid, newdir2)
			doSendMagicEffect(getCreaturePosition(cid),10)
	end
	elseif item.actionid == 7842 then
		if getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6 and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE then
			doTeleportThing(cid,earth)
			doSendMagicEffect(earth,10)
			setPlayerStorageValue(cid, 15133, 1)
		else
			doCreatureSay(cid, "Only Premium Druids of level 30 or higher are able to enter this portal", TALKTYPE_ORANGE_1)
			doMoveCreature(cid, newdir)
			doMoveCreature(cid, newdir2)
			doSendMagicEffect(getCreaturePosition(cid),10)
	end
	elseif item.actionid == 7843 then
		if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5 and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE then
			doTeleportThing(cid,fire)
			doSendMagicEffect(fire,10)
			setPlayerStorageValue(cid, 15157, 1)
		else
			doCreatureSay(cid, "Only Premium Sorcerers of level 30 or higher are able to enter this portal", TALKTYPE_ORANGE_1)
			doMoveCreature(cid, newdir)
			doMoveCreature(cid, newdir2)
			doSendMagicEffect(getCreaturePosition(cid),10)
	end
	elseif item.actionid == 7844 then
			if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5 and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE then
			doTeleportThing(cid,energy)
			doSendMagicEffect(energy,10)
			setPlayerStorageValue(cid, 15145, 1)
		else
			doCreatureSay(cid, "Only Premium Sorcerers of level 30 or higher are able to enter this portal", TALKTYPE_ORANGE_1)
			doMoveCreature(cid, newdir)
			doMoveCreature(cid, newdir2)
			doSendMagicEffect(getCreaturePosition(cid),10)
	end
	end
end