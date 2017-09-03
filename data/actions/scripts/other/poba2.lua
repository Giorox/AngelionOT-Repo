function onUse(cid, item, frompos, item2, topos)

if item.uid == 7512 then
queststatus = getPlayerStorageValue(cid,7612)
if queststatus == -1 then
doPlayerSendTextMessage(cid,25,"You have found a piece of a broken amulet.")
doPlayerAddItem(cid,8263,1)
setPlayerStorageValue(cid,7612,1)
else
doPlayerSendTextMessage(cid,25,"It is empty.")
end
else
return 0
end

return 1
end