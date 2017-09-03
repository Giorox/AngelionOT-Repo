function onUse(cid, item, frompos, item2, topos)

local config = {
        storage = 50011, -- change to your own storage value 
        item = 1955, 
		

}

        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
				doPlayerSendTextMessage(cid,25,"You have found a book.")
                item = doPlayerAddItem(cid, config.item, 1)
				doSetItemText(item,"Uhgly beholda stollen ki we gut from slain humi nigt. Tohk it 2 stinky place, noone will go thare fur guud king of cyclops. Beholda bat und ughly, to manni eyes!.")
        else
                doPlayerSendTextMessage(cid,25,"The drawers is empty.")
                end
        return TRUE
end