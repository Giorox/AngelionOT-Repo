

local function createWall(p)


doCreateItem(1026,1,{x=32761, y=32292, z=14})

doCreateItem(1026,1,{x=32762, y=32292, z=14})

doCreateItem(1026,1,{x=32763, y=32292, z=14})

doCreateItem(1029,1,{x=32764, y=32292, z=14})



end




function onUse(cid, item, frompos, item2, topos)
	
wall1 = {x=32761, y=32292, z=14, stackpos=1}
	
wall2 = {x=32762, y=32292, z=14, stackpos=1}
	
wall3 = {x=32763, y=32292, z=14, stackpos=1}
	
wall4 = {x=32764, y=32292, z=14, stackpos=1}
	
getwall1 = getThingfromPos(wall1)
	
getwall2 = getThingfromPos(wall2)
	
getwall3 = getThingfromPos(wall3)
	
getwall4 = getThingfromPos(wall4)

	
if item.itemid == 1945 and getwall4.itemid == 1029 then
		
doRemoveItem(getwall1.uid,1)
		
doRemoveItem(getwall2.uid,1)
		
doRemoveItem(getwall3.uid,1)
		
doRemoveItem(getwall4.uid,1)
		
doTransformItem(item.uid,item.itemid+1)
		
p = {wallid = getwall1.itemid}
	
addEvent(createWall, 5*1000, p)
	
elseif item.itemid == 1946 then
		
doTransformItem(item.uid,item.itemid-1)	
	
else
		
doPlayerSendCancel(cid,"Sorry, not possible.")
	
end

	
return 1

end