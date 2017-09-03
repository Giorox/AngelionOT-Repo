function onUse(cid, item, fromPosition, itemEx, toPosition)
	local statue1 = getThing(4000)
	local statue2 = getThing(4001)
	local statue3 = getThing(4002)
	local statue4 = getThing(4003)
	local statue5 = getThing(4004)
	if((statue1.itemid == 3697) and (statue2.itemid == 3698) and (statue3.itemid == 3698) and (statue4.itemid == 3697) and (statue5.itemid == 3697)) then
		doTransformItem(4006, 7525)
		doTransformItem(4007, 7521)
		doCreatureSay(cid, "CLICK", TALKTYPE_ORANGE_1, nil, nil, {x=33275,y=32451,z=8})
	else
		doCreatureSay(cid, "CRANK", TALKTYPE_ORANGE_1)
	end
	
end