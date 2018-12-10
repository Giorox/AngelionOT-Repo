function onUse(cid, item, frompos, item2, topos)
	gatepos = {x=32177, y=32148, z=11, stackpos=1}
	getgate = getThingfromPos(gatepos)

	if item.uid == 60048 and item.itemid == 1946 and getgate.itemid == 5108 then
		doTransformItem(getgate.uid, getgate.itemid+1)
		doTransformItem(item.uid,item.itemid-1)
	elseif item.uid == 60048 and item.itemid == 1945 and getgate.itemid == 5109 then
		doTransformItem(getgate.uid, getgate.itemid-1)
		doTransformItem(item.uid,item.itemid+1)
	else
		doPlayerSendCancel(cid,"Sorry not possible.")
	end
	
	return 1
end