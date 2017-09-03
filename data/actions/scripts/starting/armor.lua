function onUse(cid, item, frompos, item2, topos)

local config = {
        storage = 0009, -- change to your own storage value 
        item = 8872, 
		

}

        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,25,"You have found a belted cape.")
                key = doPlayerAddItem(cid, config.item, 1) ~= -1
        else
                doPlayerSendTextMessage(cid,25,"The chest is empty.")
                end
        return TRUE
end