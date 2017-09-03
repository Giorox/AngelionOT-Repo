local id = 61133            -- the action id here
local storage1 = 10001       -- the storage value here
local storage2 = 10002
local storage3 = 10003  
local storage4 = 10004  
local storage5 = 10005  
local storage7 = 10007  
local storage8 = 10008
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local cidPosition = getCreaturePosition(cid)
		if (item.actionid == id and getPlayerStorageValue(cid, storage1) >= 1 and getPlayerStorageValue(cid, storage2) >= 1 and getPlayerStorageValue(cid, storage3) >= 1 and getPlayerStorageValue(cid, storage4) >= 1 and getPlayerStorageValue(cid, storage5) >= 1 and getPlayerStorageValue(cid, storage7) >= 1 and getPlayerStorageValue(cid, storage8) >= 1) then
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
