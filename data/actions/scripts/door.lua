function onUse(cid, item, fromPosition, itemEx, toPosition)

	
for i = 10001, 10008 do

		
if getPlayerStorageValue(cid, i) > 0 then

			
return doTransformItem(item.uid, item.itemid + 1) and doTeleportThing(cid, toPosition, true)

		
end

	
end

	

	
return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "It seems this door is sealed against unwanted intruders.")

end