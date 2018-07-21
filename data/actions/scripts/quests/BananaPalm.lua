 local config = {
    storage = 61000, -- change to your own storage value 
    item = 2676, 
}
 
 function onUse(cid, item, frompos, item2, topos)
    if getPlayerStorageValue(cid, config.storage) == -1 then
        setPlayerStorageValue(cid, config.storage, 1)
		doPlayerSendTextMessage(cid,25,"You have found a banana.")
        key = doPlayerAddItem(cid, config.item, 1)
    else
        doPlayerSendTextMessage(cid,25,"The Bananapalm is empty.")
    end
    
	return TRUE
end