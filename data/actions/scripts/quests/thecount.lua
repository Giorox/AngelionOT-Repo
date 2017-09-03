function onUse(cid, item, fromPosition, itemEx, toPosition)
    local removals = 
	{
        {x = 32777, y = 31982, z = 9, stackpos = 255},
        {x = 32779, y = 31977, z = 9, stackpos = 255},
        {x = 32781, y = 31982, z = 9, stackpos = 255}
    }
   
ret = false
if getPlayerStorageValue(cid, 1889) == 22 then   
	for i = 1, #removals do
		local amuletos = getThingfromPos(removals[i])
		if amuletos.itemid == 2199 then
			doRemoveItem(getThingfromPos(removals[i]).uid, 1)
			doCreateMonster("The Count", {x = 32780, y = 31980, z = 9})
		else
			ret = true
		end
	end
		if ret then 
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You need to put the amulets in the altars.")
		end	
else
	doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You aren't a member of the inquisition.")
end
    return TRUE
end
