 local config = {
    storage = 13200, -- change to your own storage value 
    item = 2559, 
}
 
 function onUse(cid, item, frompos, item2, topos)
    if getPlayerStorageValue(cid, config.storage) == -1 then
        setPlayerStorageValue(cid, config.storage, 1)
		doPlayerSendTextMessage(cid,25,"You have found a small axe.")
        key = doPlayerAddItem(cid, config.item, 1)
    else
        doPlayerSendTextMessage(cid,25,"The coffin is empty.")
    end
    
	return TRUE
end