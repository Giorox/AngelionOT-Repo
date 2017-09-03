function onStepIn(cid, item, position, fromPosition)
	doTeleportThing(cid, {x=922, y=1258, z=15}, FALSE)
	doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	local creatures = getCreaturesInRange({x=936, y=1287, z=15}, 6, 7, TRUE, FALSE)
	for i = 1, #creatures do
		doRemoveCreature(creatures[i])
	end
	return TRUE
end

function onAddItem(moveitem, tileitem, pos)
	doSendMagicEffect(pos, CONST_ME_TELEPORT)
	doRelocate(pos, {x=922, y=1258,z=15})
	doSendMagicEffect({x=922, y=1258,z=15}, CONST_ME_TELEPORT)
	return TRUE
end