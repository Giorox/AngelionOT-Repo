local id = 58266            -- the action id here
local storage1 = 102500       -- the storage value here

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local cidPosition = getCreaturePosition(cid)
		if (item.actionid == id and getPlayerStorageValue(cid, storage1) >= 1) then
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
