

local function createWall(p)


doCreateItem(1025,1,{x=32760, y=32289, z=14})

doCreateItem(1025,1,{x=32760, y=32290, z=14})

doCreateItem(1025,1,{x=32760, y=32291, z=14})

doCreateItem(1025,1,{x=32760, y=32292, z=14})

doCreateItem(1027,1,{x=32760, y=32288, z=14})



end




function onUse(cid, item, frompos, item2, topos)
	
wall1 = {x=32760, y=32289, z=14, stackpos=1}
	
wall2 = {x=32760, y=32290, z=14, stackpos=1}
	
wall3 = {x=32760, y=32291, z=14, stackpos=1}
	
wall4 = {x=32760, y=32292, z=14, stackpos=1}
	
wall5 = {x=32760, y=32288, z=14, stackpos=1}
	
getwall1 = getThingfromPos(wall1)
	
getwall2 = getThingfromPos(wall2)
	
getwall3 = getThingfromPos(wall3)
	
getwall4 = getThingfromPos(wall4)
	
getwall5 = getThingfromPos(wall5)

	
if item.itemid == 1945 and getwall5.itemid == 1027 then
		
doRemoveItem(getwall1.uid,1)
		
doRemoveItem(getwall2.uid,1)
		
doRemoveItem(getwall3.uid,1)
		
doRemoveItem(getwall4.uid,1)
		
doRemoveItem(getwall5.uid,1)
		
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