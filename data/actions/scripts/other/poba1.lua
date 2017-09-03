function onUse(cid, item, frompos, item2, topos)

if item.uid == 7511 then
queststatus = getPlayerStorageValue(cid,7611)
if queststatus == -1 then
doPlayerSendTextMessage(cid,25,"You have found a piece of a broken amulet.")
doPlayerAddItem(cid,8262,1)
setPlayerStorageValue(cid,7611,1)
else
doPlayerSendTextMessage(cid,25,"It is empty.")
end
else
return 0
end

return 1
end