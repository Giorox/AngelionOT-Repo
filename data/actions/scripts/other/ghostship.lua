function onUse(cid, item, frompos, item2, topos)

if item.uid == 1555 then
queststatus = getPlayerStorageValue(cid,1554)
if queststatus == -1 then
doPlayerSendTextMessage(cid,25,"You have found a plate armor.")
doPlayerAddItem(cid,2463,1)
setPlayerStorageValue(cid,1554,1)
else
doPlayerSendTextMessage(cid,25,"The wooden coffin is empty.")
end
else
return 0
end

return 1
end