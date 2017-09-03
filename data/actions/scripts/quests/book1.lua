function onUse(cid, item, frompos, item2, topos)

local config = {
        storage = 50012, -- change to your own storage value 
        item = 1955,
               

}

        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
                                doPlayerSendTextMessage(cid,25,"You have found a book.")
                item = doPlayerAddItem(cid, config.item, 1)
                                doSetItemText(item,"Diary of Hengis Wulfson\n...\nI can only hope I can escape the\ncyclops someday. For now I have\noccupied their chief with an attempt\nto learn to read and write, but for\nhow long?\nI'm so desperate.\nWhat a foolish idea to travel here to\nsearch the famous treasures of this\nancient, knightly order.\nI wish I had never heard about it.\nI wish I had never sung that song.\nNo clue how many unfortunate souls I\nhave lured to death with it.\n")
        else
                doPlayerSendTextMessage(cid,25,"The barrel is empty.")
                end
        return TRUE
end