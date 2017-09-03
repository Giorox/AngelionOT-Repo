function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 3695 and item.actionid == 18898 then
		if getPlayerStorageValue(cid, 1889) == 20 then
			if fromPosition.x == CONTAINER_POSITION then
				doSendMagicEffect(getCreaturePosition(cid), CONST_ME_EXPLOSIONHIT)
				doPlayerRemoveItem(cid, 7488, 1)
				setPlayerStorageValue(cid, 1889, 21)
			else
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need hold the item on you.")
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You arent a inquisition member")
		end
	end
    return TRUE
end


