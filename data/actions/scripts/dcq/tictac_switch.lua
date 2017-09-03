function onUse(cid, item, frompos, item2, topos)

	
food1 = {x=32840, y=32268, z=14, stackpos=1}
	
food2 = {x=32840, y=32269, z=14, stackpos=1}
	
food3 = {x=32841, y=32269, z=14, stackpos=1}
	
food4 = {x=32842, y=32267, z=14, stackpos=1}
	
food5 = {x=32843, y=32268, z=14, stackpos=1}
	
food6 = {x=32843, y=32266, z=14, stackpos=1}
	
food7 = {x=32844, y=32267, z=14, stackpos=1}
	
food8 = {x=32845, y=32264, z=14, stackpos=1}
	
food9 = {x=32845, y=32268, z=14, stackpos=1}


	
getfood1 = getThingfromPos(food1)
	
getfood2 = getThingfromPos(food2)
	
getfood3 = getThingfromPos(food3)
	
getfood4 = getThingfromPos(food4)
	
getfood5 = getThingfromPos(food5)
	
getfood6 = getThingfromPos(food6)
	
getfood7 = getThingfromPos(food7)
	
getfood8 = getThingfromPos(food8)
	
getfood9 = getThingfromPos(food9)
	
	
	
ladderpos = {x=32836, y=32288, z=14, stackpos=255}
	
getladder = getThingfromPos(ladderpos)


if item.actionid == 12942 and item.itemid == 1945 and getfood1.itemid == 6556 and getfood2.itemid == 6557 and getfood3.itemid == 6556 and getfood4.itemid == 6556 and getfood5.itemid == 6557 and getfood6.itemid == 6557 and getfood7.itemid == 6557 and getfood8.itemid == 6557 and getfood9.itemid == 6557 then

		
local golas = doCreateItem(1387,1,ladderpos)
		
doItemSetAttribute(golas, "aid", 2222)
		
		
doRemoveItem(getfood1.uid,1)
		
doRemoveItem(getfood2.uid,1)
		
doRemoveItem(getfood3.uid,1)
		
doRemoveItem(getfood4.uid,1)
		
doRemoveItem(getfood5.uid,1)
		
doRemoveItem(getfood6.uid,1)
		
doRemoveItem(getfood7.uid,1)
		
doRemoveItem(getfood8.uid,1)
		
doRemoveItem(getfood9.uid,1)
		
		
doSendMagicEffect(food1, 12)
		
doSendMagicEffect(food2, 12)
		
doSendMagicEffect(food3, 12)
		
doSendMagicEffect(food4, 12)
		
doSendMagicEffect(food5, 12)
		
doSendMagicEffect(food6, 12)
		
doSendMagicEffect(food7, 12)
		
doSendMagicEffect(food8, 12)
		
doSendMagicEffect(food9, 12)
		
		
doTransformItem(item.uid,item.itemid+1)


elseif item.actionid == 12942 and item.itemid == 1946 then

doTransformItem(item.uid,item.itemid-1)

else

doPlayerSendCancel(cid,"Sorry, not possible.") 

	
end
	
return TRUE

end