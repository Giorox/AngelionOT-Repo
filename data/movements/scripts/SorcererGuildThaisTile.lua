function onStepIn(cid, item, pos)
local notSorc = {x=32299, y=32267, z=7}
local notSorc2 = {x=32299, y=32268, z=7}
	if (getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 5) then
		doTransformItem(item.uid, 447)
	elseif (item.uid == 9500) then
		doTeleportThing(cid, notSorc)
		doSendMagicEffect(getCreaturePosition(cid), 14)
		doPlayerSendTextMessage(cid,22,"Sorry, you are not a Sorcerer.")
	elseif (item.uid == 9501) then
		doTeleportThing(cid, notSorc2)
		doSendMagicEffect(getCreaturePosition(cid), 14)
		doPlayerSendTextMessage(cid,22,"Sorry, you are not a Sorcerer.")
	end
end

function onStepOut(cid, item, pos)
	if item.itemid == 425 then
		doTransformItem(item.uid, 446)
	end
end