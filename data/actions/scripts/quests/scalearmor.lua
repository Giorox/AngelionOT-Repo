local config = {
        storage = 39781,
        key_id = 1988 -- Key ID

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a backpack.")
                key = doPlayerAddItem(cid, config.key_id, 1)
				doAddContainerItem(key, 2160, 100)
				doAddContainerItem(key, 2160, 100)        
				doAddContainerItem(key, 2160, 100)
				doAddContainerItem(key, 2160, 100)
				doAddContainerItem(key, 2160, 100)
				doAddContainerItem(key, 2160, 100)
				doAddContainerItem(key, 2160, 100)
				doAddContainerItem(key, 2160, 100)
				doAddContainerItem(key, 2160, 100)
				doAddContainerItem(key, 2160, 100)
				doAddContainerItem(key, 2160, 100)      
				doAddContainerItem(key, 2160, 100)
				doAddContainerItem(key, 2160, 100)
				doAddContainerItem(key, 2160, 100)
				doAddContainerItem(key, 9693, 1)
				doAddContainerItem(key, 9693, 1)
				doAddContainerItem(key, 9693, 1)
				doAddContainerItem(key, 9693, 1)
				doAddContainerItem(key, 9693, 1)
else
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The chest is empty.")
        end
end