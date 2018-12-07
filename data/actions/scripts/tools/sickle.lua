local SUGARCANE = {5471, 5467}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if(isInArray(SUGARCANE, itemEx.itemid)) then
		doTransformItem(itemEx.uid, itemEx.itemid -4)
		doDecayItem(itemEx.uid)
		return true
	else
		doPlayerSendTextMessage(cid,21,"Você não pode contar essa cana")
	end

	return destroyItem(cid, itemEx, toPosition)

end