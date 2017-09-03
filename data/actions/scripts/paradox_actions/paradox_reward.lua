function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.uid == 5045 then
		queststatus = getPlayerStorageValue(cid, 9000)
		if queststatus == -1 or queststatus == 0 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a 32 Talons.")
			doPlayerAddItem(cid, 2151, 32)
			setPlayerStorageValue(cid, 9000, 1)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty!")
		end
	elseif item.uid == 5046 then
		queststatus = getPlayerStorageValue(cid, 9000)
		if queststatus == -1 or queststatus == 0 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a 100 Platinum Coins.")
			axe_uid = doPlayerAddItem(cid, 2152, 100)
			setPlayerStorageValue(cid,9000,1)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty!")
		end
	elseif item.uid == 5047 then
		queststatus = getPlayerStorageValue(cid, 9000)
		if queststatus == -1 or queststatus == 0 then
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have found a Crystal Wand.")
			doPlayerAddItem(cid, 2184, 1)
			setPlayerStorageValue(cid,9000,1)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty!")
		end
	elseif item.uid == 5048 then
		queststatus = getPlayerStorageValue(cid, 9000)
		if queststatus == -1 or queststatus == 0 then
			doPlayerSendTextMessage(cid,22, "You have found a golden key.")
			local key_uid = doPlayerAddItem(cid, 2091, 1)
                  doSetItemActionId(key_uid, 6969)
			setPlayerStorageValue(cid, 9000, 1)
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It is empty!")
		end
	end
	return true
end
