local SUGARCANE = {5465, 5466}



function onUse(cid, item, fromPosition, itemEx, toPosition)

if(isInArray(SUGARCANE, itemEx.itemid)) then

doTransformItem(itemEx.uid, itemEx.itemid -1)

doDecayItem(itemEx.uid)

return true

else

doPlayerSendTextMessage(cid,21,"You already burned the sugar cane.")

end



return destroyItem(cid, itemEx, toPosition)

end
