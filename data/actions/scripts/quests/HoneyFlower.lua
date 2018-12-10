 local config = {
    storage = 22001, -- change to your own storage value 
    item = 2103, 
}
 
 function onUse(cid, item, frompos, item2, topos)
    if getPlayerStorageValue(cid, config.storage) == -1 then
        setPlayerStorageValue(cid, config.storage, 1)
		doPlayerSendTextMessage(cid,25,"You have found a honey flower.")
        key = doPlayerAddItem(cid, config.item, 1)
    else
        doPlayerSendTextMessage(cid,25,"There are no more honey flowers.")
    end
    
	return TRUE
end