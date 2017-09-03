function onUse(cid, item, fromPosition, itemEx, toPosition)
   	if item.uid == 1300 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found robe of the underworld.")
   			doPlayerAddItem(cid,8890,1)
   			setPlayerStorageValue(cid,6076,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 289, 2)
			doPlayerAddOutfit(cid, 289, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 288, 2)
			doPlayerAddOutfit(cid, 288, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
   	elseif item.uid == 1301 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a  Spellbook of Dark Mysteries.")
   			doPlayerAddItem(cid,8918,1)
   			setPlayerStorageValue(cid,6076,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 289, 2)
			doPlayerAddOutfit(cid, 289, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 288, 2)
			doPlayerAddOutfit(cid, 288, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
   	elseif item.uid == 1302 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Fireborn Giant Armor.")
   			doPlayerAddItem(cid,8881,1)
   			setPlayerStorageValue(cid,6076,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 289, 2)
			doPlayerAddOutfit(cid, 289, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 288, 2)
			doPlayerAddOutfit(cid, 288, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
		end
   	elseif item.uid == 1303 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Master Archer's Armor.")
   			doPlayerAddItem(cid,8888,1)
   			setPlayerStorageValue(cid,6076,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 289, 2)
			doPlayerAddOutfit(cid, 289, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 288, 2)
			doPlayerAddOutfit(cid, 288, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
  	elseif item.uid == 1304 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Royal Crossbow.")
   			doPlayerAddItem(cid,8851,1)
   			setPlayerStorageValue(cid,6076,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 289, 2)
			doPlayerAddOutfit(cid, 289, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 288, 2)
			doPlayerAddOutfit(cid, 288, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	elseif item.uid == 1305 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Hellforged Axe.")
   			doPlayerAddItem(cid,8924,1)
   			setPlayerStorageValue(cid,6076,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 289, 2)
			doPlayerAddOutfit(cid, 289, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 288, 2)
			doPlayerAddOutfit(cid, 288, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	elseif item.uid == 1306 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Obsidian Truncheon.")
   			doPlayerAddItem(cid,8928,1)
   			setPlayerStorageValue(cid,6076,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 289, 2)
			doPlayerAddOutfit(cid, 289, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 288, 2)
			doPlayerAddOutfit(cid, 288, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	elseif item.uid == 1307 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Emerald Sword.")
   			doPlayerAddItem(cid,8930,1)
   			setPlayerStorageValue(cid,6076,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 289, 2)
			doPlayerAddOutfit(cid, 289, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 288, 2)
			doPlayerAddOutfit(cid, 288, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	elseif item.uid == 1308 then
		queststatus = getPlayerStorageValue(cid,6076)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Warsinger Bow.")
   			doPlayerAddItem(cid,8854,1)
   			setPlayerStorageValue(cid,6076,1)
			if getPlayerSex(cid) == 1 then 
            doPlayerAddOutfit(cid, 289, 2)
			doPlayerAddOutfit(cid, 289, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			elseif getPlayerSex(cid) == 0 then
            doPlayerAddOutfit(cid, 288, 2)
			doPlayerAddOutfit(cid, 288, 1)
			doSendMagicEffect(getCreaturePosition(cid), 49)
			end
   		else
   			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "It is empty.")
   		end
	end
   	return 1
end
