function ChangeBack(cid)

	doRemoveItem(getThingfromPos({x=32479, y=31904, z=3, stackpos=1}).uid, 1386)

end

function onUse(cid, item, frompos, item2, topos)

	food1 = {x=32478, y=31903, z=3, stackpos=255}
	food2 = {x=32479, y=31903, z=3, stackpos=255}



	getfood1 = getThingfromPos(food1)
	getfood2 = getThingfromPos(food2)

	
	ladderpos = {x=32479, y=31904, z=3, stackpos=255}
	getladder = getThingfromPos(ladderpos)

if item.actionid == 11005 and 
item.itemid == 1945 and 
getfood1.itemid == 2628 and 
getfood2.itemid == 2634 then

	addEvent(ChangeBack, 45000, cid)
		doCreateItem(1386,1,ladderpos)
		
		doRemoveItem(getfood1.uid,1)
		doRemoveItem(getfood2.uid,1)

		
		doSendMagicEffect(food1, 36)
		doSendMagicEffect(food2, 36)

		
		doTransformItem(item.uid,item.itemid+1)

elseif item.actionid == 11005 and item.itemid == 1946 then
doTransformItem(item.uid,item.itemid-1)


	end
	return TRUE
end