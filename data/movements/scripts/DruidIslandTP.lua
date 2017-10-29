function onStepIn(cid, item, position, fromPosition)
	local isle = {x=32856, y=32332, z=6}
	
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

	if getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 6 then
			doTeleportThing(cid,isle)
			doSendMagicEffect(isle,11)
	else
			doCreatureSay(cid, "Only Druids can enter.", TALKTYPE_ORANGE_1)
			doMoveCreature(cid, newdir)
			doMoveCreature(cid, newdir2)
			doSendMagicEffect(getCreaturePosition(cid),3)
	end
end