 function onUse(cid, item, frompos, item2, topos)

if item.uid == 7513 then
queststatus = getPlayerStorageValue(cid,7613)
if queststatus == -1 then
doPlayerSendTextMessage(cid,25,"You have found a piece of a broken amulet.")
doPlayerAddItem(cid,8264,1)
setPlayerStorageValue(cid,7613,1)
else
doPlayerSendTextMessage(cid,25,"It is empty.")
end
else
return 0
end

return 1
end