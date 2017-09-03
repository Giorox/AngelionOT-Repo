function onUse(cid, item, fromPosition, itemEx, toPosition)

local tilepos1 = {x=33114, y=31703, z=12}
local tilepos2 = {x=33116, y=31703, z=12}
local tilepos5 = {x=33115, y=31702, z=12}
local tilepos3 = {x=33114, y=31700, z=12}
local tilepos4 = {x=33115, y=31700, z=12}
local tilepos6 = {x=33116, y=31700, z=12}
local tilepos7 = {x=33114, y=31701, z=12}
local tilepos8 = {x=33115, y=31701, z=12}
local tilepos9 = {x=33116, y=31701, z=12}

if(itemEx.uid == 6669) and (itemEx.itemid == 8759) then
if getPlayerStorageValue(cid, 1996) == 1 then
doPlayerRemoveItem(cid, 7494, 1)
doSendMagicEffect(tilepos5,15)
doSendMagicEffect(tilepos1,5)
doSendMagicEffect(tilepos2,5)
doSendMagicEffect(tilepos3,5)
doSendMagicEffect(tilepos4,5)
doSendMagicEffect(tilepos6,5)
doSendMagicEffect(tilepos7,5)
doSendMagicEffect(tilepos8,5)
doSendMagicEffect(tilepos9,5)
setPlayerStorageValue(cid, 1883, 1)
doCreatureSay(cid, 'You succesfully destroyed the Shadow Nexus', TALKTYPE_ORANGE_1)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You arent a inquisition member")
end
return TRUE
end
end


