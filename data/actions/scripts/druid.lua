function onUse(cid, item, fromPosition, itemEx, toPosition)

local tilepos1 = {x=32023, y=32831, z=4}
local tilepos2 = {x=32025, y=32831, z=4}

if(itemEx.uid == 16102) and (itemEx.itemid == 5659) then
if getPlayerStorageValue(cid, 1824) == -1 then
doPlayerRemoveItem(cid, 4869, 1)
doPlayerAddItem(cid, 5937, 1)
doSendMagicEffect(tilepos1,45)
doSendMagicEffect(tilepos2,45)
setPlayerStorageValue(cid, 1824, 1)
doCreatureSay(cid, 'You succesfully took a sample of the rare griffinclaw flower', TALKTYPE_ORANGE_1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You already took a sample of the rare griffinclaw flower.")
end
return TRUE
end
end


