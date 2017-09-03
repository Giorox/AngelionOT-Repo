local id = 42261            -- the action id here

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local cidPosition = getCreaturePosition(cid)
		if (item.actionid == id) then
			if cidPosition.x < toPosition.x then
				doTransformItem(item.uid, item.itemid + 1)
		doTeleportThing(cid, toPosition, TRUE)
		else
				if cidPosition.x > toPosition.x then
				doTransformItem(item.uid, item.itemid + 1)
		doTeleportThing(cid, toPosition, TRUE)
end
end
	return TRUE
end
end
