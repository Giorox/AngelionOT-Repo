function onUse(cid, item, fromPosition, itemEx, toPosition)
local SPIDER_WEB = {7538, 7539}
local DWORCE = {3799, 3798}

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

	return destroyItem(cid, itemEx, toPosition)
end