function onUse(cid, item, frompos, item2, topos)

local config = {
        storage = 17132, -- change to your own storage value 
        item = 6120, 
		

}

        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,25,"You have found a spellbook of dragha.")
                key = doPlayerAddItem(cid, config.item, 1) ~= -1
        else
                doPlayerSendTextMessage(cid,25,"The dead human is empty.")
                end
        return TRUE
end