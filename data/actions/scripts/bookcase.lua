function onUse(cid, item, frompos, item2, topos)


local config = {
        
storage1 = 93800,
		
storage2 = 93802,
        
item = 11098,
               

}

        

if getPlayerStorageValue(cid, config.storage1) == 1 and getPlayerStorageValue(cid, config.storage2) == -1 then

setPlayerStorageValue(cid, config.storage2, 1)
			
doCreatureSay(cid, "A batch of documents has been stashed in the shelf. These might be of interest to Zalamon", TALKTYPE_ORANGE_1, nil, nil)

else 
			
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "The bookcase is empty")

                
end

end