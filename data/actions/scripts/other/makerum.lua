local DISTILLERY = {5513, 5514, 5469, 5470}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 5467 and isInArray(DISTILLERY, itemEx.itemid) and itemEx.actionid ~= 100) then
		doPlayerRemoveItem(cid, 5467, 1)
		doSetItemActionId(itemEx.uid, 100)
		doSendMagicEffect(toPosition, 67)
		return true
	elseif(item.itemid == 5467 and isInArray(DISTILLERY, itemEx.itemid) and itemEx.actionid == 100) then
		doPlayerSendCancel(cid, "The distillery is already processing something.")
		return true
	else
		doPlayerSendCancel(cid, "Sorry, not possible.")
		return true
	end

	return false
end
