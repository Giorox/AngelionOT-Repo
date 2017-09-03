function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 2001) == -1) then
		doPlayerAddItem(cid, 2485, 1)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a doublet.")
		setPlayerStorageValue(cid, 2001, 1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The board is empty.")
	end
	return true
end

