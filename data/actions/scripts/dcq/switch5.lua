function onUse(cid, item, frompos, item2, topos)

	food1 = {x=32878, y=32270, z=14, stackpos=1}
	food2 = {x=32881, y=32273, z=14, stackpos=1}
	food3 = {x=32884, y=32270, z=14, stackpos=1}
	food4 = {x=32881, y=32267, z=14, stackpos=1}
	
	food5 = {x=32874, y=32263, z=14, stackpos=1}
	food6 = {x=32875, y=32263, z=14, stackpos=1}
	food7 = {x=32874, y=32264, z=14, stackpos=1}
	food8 = {x=32875, y=32264, z=14, stackpos=1}
	
	


	getfood1 = getThingfromPos(food1)
	getfood2 = getThingfromPos(food2)
	getfood3 = getThingfromPos(food3)
	getfood4 = getThingfromPos(food4)
	
	getfood5 = getThingfromPos(food5)
	getfood6 = getThingfromPos(food6)
	getfood7 = getThingfromPos(food7)
	getfood8 = getThingfromPos(food8)
	
	
	ladderpos = {x=32881, y=32270, z=14, stackpos=1}
	getladder = getThingfromPos(ladderpos)

if item.actionid == 51061 and item.itemid == 1945 and getfood1.itemid == 2016 and getfood2.itemid == 6300 or getfood2.itemid == 6301 and getfood3.itemid == 1492 and getfood4.itemid == 2168 and getladder.itemid == 1355 then

		doRemoveItem(getladder.uid,1)
		local panienka = doCreateItem(1387,1,ladderpos)
		doItemSetAttribute(panienka, "aid", 2223)
		
		doRemoveItem(getfood1.uid,1)
		doRemoveItem(getfood2.uid,1)
		doRemoveItem(getfood3.uid,1)
		doRemoveItem(getfood4.uid,1)
		
		doRemoveItem(getfood5.uid,1)
		doRemoveItem(getfood6.uid,1)
		doRemoveItem(getfood7.uid,1)
		doRemoveItem(getfood8.uid,1)
		
		doCreateItem(3733,1,food5)
		doCreateItem(3734,1,food6)
		doCreateItem(3735,1,food7)
		doCreateItem(3736,1,food8)
		
		doSendMagicEffect(food1, 12)
		doSendMagicEffect(food2, 12)
		doSendMagicEffect(food3, 12)
		doSendMagicEffect(food4, 12)
		
		doTransformItem(item.uid,item.itemid+1)

elseif item.actionid == 51061 and item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)


	end
	return TRUE
end