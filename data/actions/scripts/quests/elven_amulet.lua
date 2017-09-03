function onUse(cid, item, frompos, item2, topos)

local config = {
        storage = 11192, -- change to your own storage value 
        item = 2198, 
		

}

        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,25,"You have found an elven amulet.")
                key = doPlayerAddItem(cid, config.item, 1) ~= -1
        else
                doPlayerSendTextMessage(cid,25,"The dead dragon is empty.")
                end
        return TRUE
end