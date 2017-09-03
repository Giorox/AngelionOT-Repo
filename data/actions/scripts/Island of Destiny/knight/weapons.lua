function onUse(cid, item, frompos, item2, topos)

	if item.uid == 61904 then
		if getPlayerStorageValue(cid,61904) == -1 then
			doPlayerSendTextMessage(cid,25,"You have chosen an Jagged Sword.")
			doPlayerAddItem(cid,8602,1)
			setPlayerStorageValue(cid,61904,1)
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
	elseif item.uid == 61905 then
		if getPlayerStorageValue(cid,61904) == -1 then
			doPlayerSendTextMessage(cid,25,"You have chosen an Daramanian Mace.")
			doPlayerAddItem(cid,2439,1)
			setPlayerStorageValue(cid,61904,1)
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
 	elseif item.uid == 61906 then
		if getPlayerStorageValue(cid,61904) == -1 then
			doPlayerSendTextMessage(cid,25,"You have chosen an Steel Axe.")
			doPlayerAddItem(cid,8601,1)
			setPlayerStorageValue(cid,61905,1)
		else
			doPlayerSendTextMessage(cid,25,"The chest is empty.")
		end
	end
	return true
end