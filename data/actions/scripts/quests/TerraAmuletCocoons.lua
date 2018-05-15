function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 7585) then
		doTransformItem(item.uid, item.itemid + 1)
		value = getPlayerStorageValue(cid, 23000)
		if((value > 0) and (value < 5)) then
			setPlayerStorageValue(cid, 23000, value+1)
		end
	end
end