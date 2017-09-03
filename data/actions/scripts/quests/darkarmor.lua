function onUse(cid, item, frompos, item2, topos)

local config = {
        storage = 6662, -- change to your own storage value 
        item = 2489, 
		

}

        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,25,"You have found a dark armor.")
                key = doPlayerAddItem(cid, config.item, 1)
        else
                doPlayerSendTextMessage(cid,25,"The dead human is empty.")
                end
        return TRUE
end