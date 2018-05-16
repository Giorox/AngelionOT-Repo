function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 7585) then
		doTransformItem(item.uid, item.itemid + 1)
		value = getPlayerStorageValue(cid, 23000)
		if((value > 0) and (value < 5)) then
			setPlayerStorageValue(cid, 23000, value+1)
		end
		
		monster = "Giant Spider"
		pos = {x=33183,y=31867,z=12}
		local cocoon1 = getThing(23001)
		local cocoon2 = getThing(23002)
		local cocoon3 = getThing(23003)
		local cocoon4 = getThing(23004)
		
		if((cocoon.itemid == 7586) and (cocoon.itemid == 7586) and (cocoon3.itemid == 7586) and (cocoon4.itemid == 7586)) then
			doSummonCreature(monster, pos)
		end
	end
end