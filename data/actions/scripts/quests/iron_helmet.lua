local config = {
        storage = 45123,
        key_id = 1988 -- Key ID

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a backpack.")
                key = doPlayerAddItem(cid, config.key_id, 1)
				doAddContainerItem(key, 2238, 1)
				doAddContainerItem(key, 2268, 3)
				doAddContainerItem(key, 2467, 1)
				doAddContainerItem(key, 2459, 1)
				doAddContainerItem(key, 2397, 1)
				doAddContainerItem(key, 2598, 1)
        else
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The dead human is empty.")
        end
end