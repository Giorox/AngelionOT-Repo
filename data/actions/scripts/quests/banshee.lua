local function createWall(p)

doCreateItem(1498,1,{x=32259, y=31890, z=10})
doCreateItem(1498,1,{x=32259, y=31891, z=10})


end


function onUse(cid, item, frompos, item2, topos)
	wall1 = {x=32259, y=31890, z=10, stackpos=1}
	wall2 = {x=32259, y=31891, z=10, stackpos=1}
	getwall1 = getThingfromPos(wall1)
	getwall2 = getThingfromPos(wall2)

	if item.itemid == 1945 and getwall1.itemid == 1498 then
		doRemoveItem(getwall1.uid,1)
		doRemoveItem(getwall2.uid,1)
		doTransformItem(item.uid,item.itemid+1)
		p = {wallid = getwall1.itemid}
	addEvent(createWall, 1800*1000, p)
	elseif item.itemid == 1946 then
		doTransformItem(item.uid,item.itemid-1)	
	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end

	return 1
end