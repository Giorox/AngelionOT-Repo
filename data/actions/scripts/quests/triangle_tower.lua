  local config = {
        storage = 61001,
        key_id = 1987 -- Key ID

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a bag.")
                key = doPlayerAddItem(cid, config.key_id, 1)
				doAddContainerItem(key, 2213, 1)
				doAddContainerItem(key, 2199, 150)
				doAddContainerItem(key, 2146, 2)
        else
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The chest is empty.")
        end
end 