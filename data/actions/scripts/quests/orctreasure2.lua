local config = {
        storage = 14331,
        key_id = 1988 -- Key ID

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a backpack.")
                key = doPlayerAddItem(cid, config.key_id, 1)
				doAddContainerItem(key, 2545, 30)
				doAddContainerItem(key, 2411, 1)
				doAddContainerItem(key, 2411, 1)
        else
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The box is empty.")
        end
end