local config = {
        storage = 7442,
        key_id = 1988 -- Key ID

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a backpack.")
                key = doPlayerAddItem(cid, config.key_id, 1)
				doAddContainerItem(key, 2182, 1)
				doAddContainerItem(key, 2190, 1)
				doAddContainerItem(key, 2463, 1)
				doAddContainerItem(key, 2643, 1)
				doAddContainerItem(key, 2647, 1)
				doAddContainerItem(key, 2457, 1)
				doAddContainerItem(key, 2525, 1)
				doAddContainerItem(key, 2409, 1)
				doAddContainerItem(key, 2160, 4)
        else
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The chest is empty.")
        end
end