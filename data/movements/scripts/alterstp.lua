function onStepIn(cid, item, pos)

	local ice = {x=32369, y=32241, z=7}
	local fire = {x=1043, y=1011, z=7}
	local energy = {x=1043, y=1011, z=7}
	local earth = {x=1043, y=1011, z=7}
	local esc = {x=1032, y=999, z=7}
	
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

	if item.actionid == 7801 then
		if getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6 and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE then
			doTeleportThing(cid,ice)
			doSendMagicEffect(ice,10)
		else
			doCreatureSay(cid, "Only Premium Druids of level 30 or higher are able to enter this portal", TALKTYPE_ORANGE_1)
			doMoveCreature(cid, newdir)
			doMoveCreature(cid, newdir2)
			doSendMagicEffect(getCreaturePosition(cid),42)
	end
	elseif item.actionid == 7802 then
		if getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6 and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE then
			doTeleportThing(cid,earth)
			doSendMagicEffect(earth,10)
		else
			doPlayerSendTextMessage(cid,21, "Only Premium Druids of level 30 or higher are able to enter this portal")
			doMoveCreature(cid, newdir)
			doMoveCreature(cid, newdir2)
			doSendMagicEffect(getCreaturePosition(cid),10)
	end
	elseif item.actionid == 7803 then
		if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5 and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE then
			doTeleportThing(cid,fire)
			doSendMagicEffect(fire,10)
		else
			doPlayerSendTextMessage(cid,21, "Only Premium Sorcerers of level 30 or higher are able to enter this portal")
			doMoveCreature(cid, newdir)
			doMoveCreature(cid, newdir2)
			doSendMagicEffect(getCreaturePosition(cid),10)
	end
	elseif item.actionid == 7804 then
			if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5 and getPlayerLevel(cid) >= 30 and isPremium(cid) == TRUE then
			doTeleportThing(cid,energy)
			doSendMagicEffect(energy,10)
		else
			doPlayerSendTextMessage(cid,21, "Only Premium Sorcerers of level 30 or higher are able to enter this portal")
			doMoveCreature(cid, newdir)
			doMoveCreature(cid, newdir2)
			doSendMagicEffect(getCreaturePosition(cid),10)
	end
	elseif item.actionid == 7805 then
			doTeleportThing(cid,esc)
			doSendMagicEffect(esc,10)
	end
end