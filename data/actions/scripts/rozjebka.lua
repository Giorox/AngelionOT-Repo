function onUse(cid, item, fromPosition, itemEx, toPosition)
local SPIDER_WEB = {7538, 7539}
local DWORCE = {3799, 3798}
local SUGARCANE = {5464, 5463}

	if(isInArray(SPIDER_WEB, itemEx.itemid)) then
		doTransformItem(itemEx.uid, (itemEx.itemid + 6))
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		doDecayItem(itemEx.uid)
		return true
	end
	
	if(isInArray(DWORCE, itemEx.itemid)) then
		doTransformItem(itemEx.uid, (itemEx.itemid + 160))
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		doDecayItem(itemEx.uid)
		return true
	end

	if(itemEx.itemid == 1499) then
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		doRemoveItem(itemEx.uid)
		return true
	end
	
	if(isInArray(SUGARCANE, itemEx.itemid) and item.itemid == 2405) then
		doTransformItem(itemEx.uid, itemEx.itemid -1)
		doDecayItem(itemEx.uid)
		doCreateItem(5467, 1, toPosition)
		return true
	else
		doPlayerSendCancel(cid,21,"You cannot cut this sugarcane")
	end

	return destroyItem(cid, itemEx, toPosition)
end