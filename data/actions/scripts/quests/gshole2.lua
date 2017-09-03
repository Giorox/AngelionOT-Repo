local config = {
        storage = 43430,
        key_id = 1987 -- Key ID

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a bag.")
                key = doPlayerAddItem(cid, config.key_id, 1)
				doAddContainerItem(key, 2547, 5)
				doAddContainerItem(key, 2546, 12)
        else
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The dead human is empty.")
        end
end