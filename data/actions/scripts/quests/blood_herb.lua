local config = {
        storage = 59659,
        key_id = 2798 -- Key ID

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a blood herb.")
                key = doPlayerAddItem(cid, config.key_id, 1)
        else
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The dead tree is empty.")
        end
end