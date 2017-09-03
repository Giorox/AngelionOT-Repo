local config1 = {
		itemuid = 20000,
		storage = 50309,
		key_id = 2519
}
local config2 = {
		itemuid = 20001,
		storage = 50308,
		key_id = 2487
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
       if ((getPlayerStorageValue(cid, config1.storage) == -1) and (item.uid == config1.itemuid)) then
			setPlayerStorageValue(cid, config1.storage, 1)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Crown Shield.")
			doSendMagicEffect(getCreaturePosition(cid),28)
			key = doPlayerAddItem(cid, config1.key_id, 1)
       elseif ((getPlayerStorageValue(cid, config2.storage) == -1) and (item.uid == config2.itemuid)) then
			setPlayerStorageValue(cid, config2.storage, 1)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Crown Armor.")
			doSendMagicEffect(getCreaturePosition(cid),29)
			key = doPlayerAddItem(cid, config2.key_id, 1)
       else
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The dead tree is empty.")
       end
end 