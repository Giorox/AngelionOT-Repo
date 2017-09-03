  local config = {
        storage = 9991,
        key_id = 2088 -- Key ID

}


function onUse(cid, item, fromPosition, itemEx, toPosition)
        
if getPlayerStorageValue(cid, config.storage) == -1 then
                
setPlayerStorageValue(cid, config.storage, 1)
				
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "You have found a key.")
                
key = doPlayerAddItem(cid, config.key_id, 1)
                
doSetItemActionId(key, 3600)
        
else
                
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR, "The pile of bones is empty.")
        
end

end 