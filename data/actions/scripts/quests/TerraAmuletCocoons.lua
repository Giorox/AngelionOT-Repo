function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 7585 and item.uniqueid ~= nil) then
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
		
		if((cocoon1.itemid == 7586) and (cocoon2.itemid == 7586) and (cocoon3.itemid == 7586) and (cocoon4.itemid == 7586)) then
			doSummonCreature(monster, pos)
		end
	elseif (item.itemid == 7585) then
		local random = math.random(1,100)
		if(random < 40) then
			doTransformItem(item.uid, item.itemid + 1)
			doSendMagicEffect(toPosition, 16)
			doCreatureSay(cid, "Ploft.", TALKTYPE_ORANGE_1, nil, nil, fromPosition)
			doSummonCreature("Spider", toPosition)
			return true
		elseif(random < 80) then
			doTransformItem(item.uid, item.itemid + 1)
			doSendMagicEffect(toPosition, 16)
			doCreatureSay(cid, "Ploft.", TALKTYPE_ORANGE_1, nil, nil, fromPosition)
			doSummonCreature("Poison Spider", toPosition)
			return true
		elseif(random < 100) then
			doTransformItem(item.uid, item.itemid + 1)
			doSendMagicEffect(toPosition, 16)
			doCreatureSay(cid, "Ploft.", TALKTYPE_ORANGE_1, nil, nil, fromPosition)
			return true
		end
	end
end