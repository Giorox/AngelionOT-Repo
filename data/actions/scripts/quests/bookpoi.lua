 function onUse(cid, item, frompos, item2, topos)

local config = {
        storage = 30228, -- change to your own storage value :)
        item = 1950,
               

}

        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
                                doPlayerSendTextMessage(cid,25,"You have found a book.")
                item = doPlayerAddItem(cid, config.item, 1)
                                doSetItemText(item,"look at the 4 and ignore the 2\nend the 7 with 5 in mind\nvalue of 6 is 9\nexplain the second of 4\nrun past the 7\nsubstract 10\nuse the northeast first\nsee the colors change\nerrors are red\nlook what changes\nexpect no mercy\nsix times 10\nstupidity is red.")
        else
                doPlayerSendTextMessage(cid,25,"The pile of bones is empty.")
                end
        return TRUE
end