 function onUse(cid, item, frompos, item2, topos)

local config = {
        storage = 5673, -- change to your own storage value :)
        item = 2378, 
		

}

        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,25,"You have found a battle axe.")
                key = doPlayerAddItem(cid, config.item, 1) ~= -1
        else
                doPlayerSendTextMessage(cid,25,"The pile of bones is empty.")
                end
        return TRUE
end 