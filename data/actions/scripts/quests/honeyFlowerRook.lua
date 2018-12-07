local config = {
        storage = 1800,
        item_id = 2103 -- HoneyFlower Pot ID

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a Honeyflower.")
                doPlayerAddItem(cid, config.item_id, 1)
        else
                doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "There are no more Honeyflowers")
        end
end