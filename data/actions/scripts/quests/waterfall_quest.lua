 local config = {
        storage = 1881,
        key_id = 5926 -- Key ID

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a backpack.")
                key = doPlayerAddItem(cid, config.key_id, 1)
				doAddContainerItem(key, 2213, 1)
				doAddContainerItem(key, 6096, 1)
        else
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The chest is empty.")
        end
end