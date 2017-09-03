function onUse(cid, item, frompos, item2, topos)

local config = {
        storage = 61907, -- change to your own storage value 
        item = 2660, 
		

}

        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,25,"You have found a ranger's cloak.")
                key = doPlayerAddItem(cid, config.item, 1)
        else
                doPlayerSendTextMessage(cid,25,"The chest is empty.")
                end
        return TRUE
end