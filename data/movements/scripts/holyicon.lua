function onStepIn(cid, item, position, fromPosition)
    local newPosition = {x=32716, y=32347, z=7}
        if getPlayerItemCount(cid, 10305) > 0 then
		    	doTeleportThing(cid, newPosition, TRUE)
			doSendMagicEffect(fromPosition, CONST_ME_BIGPLANTS)
			doSendMagicEffect(newPosition, CONST_ME_TELEPORT)
                   	doPlayerSetStorageValue(cid, 35735, 1)
                  	doPlayerRemoveItem(cid, 10305, 1)
	end
end