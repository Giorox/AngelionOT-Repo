 local config = {
        storage = 45123,
        key_id = 5926 -- Key ID

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a pirate backpack.")
                key = doPlayerAddItem(cid, config.key_id, 1)
				doAddContainerItem(key, 7590, 1)
				doAddContainerItem(key, 6561, 1)
				doAddContainerItem(key, 2273, 1)
				doAddContainerItem(key, 2268, 1)
				doAddContainerItem(key, 2268, 1)
				doAddContainerItem(key, 2273, 1)
				doAddContainerItem(key, 2273, 1)
				doAddContainerItem(key, 2260, 1)
				doAddContainerItem(key, 2168, 1)
				doAddContainerItem(key, 6300, 1)
				doAddContainerItem(key, 5944, 1)
				doAddContainerItem(key, 5022, 3)
				doAddContainerItem(key, 5944, 1)
				doAddContainerItem(key, 2143, 5)
				doAddContainerItem(key, 2152, 11)
				
        else
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The pile of bones is empty.")
        end
end