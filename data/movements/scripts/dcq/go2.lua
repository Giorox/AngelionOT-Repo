function onStepIn(cid, item, pos)

	food5 = {x=32874, y=32263, z=14, stackpos=1}
	food6 = {x=32875, y=32263, z=14, stackpos=1}
	food7 = {x=32874, y=32264, z=14, stackpos=1}
	food8 = {x=32875, y=32264, z=14, stackpos=1}

	getfood5 = getThingfromPos(food5)
	getfood6 = getThingfromPos(food6)
	getfood7 = getThingfromPos(food7)
	getfood8 = getThingfromPos(food8)


local go1 = {x=32920, y=32296, z=13}
ladderpos = {x=32881, y=32270, z=14, stackpos=1}
getladder = getThingfromPos(ladderpos)

    if(item.actionid == 2223) and (item.itemid == 1387) then
		doTeleportThing(cid,go1)
        doSendMagicEffect(getCreaturePosition(cid),12)
		local tp = doRemoveItem(item.uid, 1387)
		local panienka = doCreateItem(1355,1,ladderpos)
		
		doRemoveItem(getfood5.uid,1)
		doRemoveItem(getfood6.uid,1)
		doRemoveItem(getfood7.uid,1)
		doRemoveItem(getfood8.uid,1)
		
		doCreateItem(3729,1,food5)
		doCreateItem(3730,1,food6)
		doCreateItem(3731,1,food7)
		doCreateItem(3732,1,food8)
		
        end
    return 1
end