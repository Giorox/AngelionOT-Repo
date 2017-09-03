local holes = {
468, 481, 483, 7932}

local holeId = {
294, 369, 370, 383,
392, 408, 409, 427, 
428, 430, 462, 469, 
470, 482, 484, 485, 
489, 924, 3135, 3136}


function onUse(cid, item, fromPosition, itemEx, toPosition)
	
local groundTile = getThingfromPos(toPosition)
	
if isInArray(holes, itemEx.itemid) == TRUE then
		
doTransformItem(itemEx.uid, itemEx.itemid + 1)
		
doDecayItem(itemEx.uid)
   
elseif itemEx.itemid == 2739 then 
		
doTransformItem(itemEx.uid, 2737)
		
doCreateItem(2694, 1, toPosition)
		
doDecayItem(itemEx.uid)
	
elseif itemEx.itemid == 2782 then
		
doTransformItem(itemEx.uid, 2781)
		
doDecayItem(itemEx.uid)
	
elseif itemEx.itemid == 1499 then
		
doRemoveItem(itemEx.uid)
	
elseif (itemEx.uid <= 65535 or itemEx.actionid > 0) and (itemEx.itemid == 355 or itemEx.itemid == 9025) then

doTransformItem(itemEx.uid, 392)
		
doDecayItem(itemEx.uid)
	
elseif itemEx.uid == 60001 then
		
doTeleportThing(cid, {x=329, y=772, z=10})
		
doSendMagicEffect({x=329, y=772, z=10},10)
	
elseif groundTile.itemid == 384 or groundTile.itemid == 418 or groundTile.itemid == 8278 then
		
doTeleportThing(cid, {x = toPosition.x, y = toPosition.y + 1, z = toPosition.z - 1}, FALSE)
	
elseif isInArray(holeId, itemEx.itemid) == TRUE then
		
local hole = getThingfromPos({
x = toPosition.x, 
y = toPosition.y, 
z = toPosition.z + 1, 
stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE})
		
if hole.itemid > 0 then
			
doTeleportThing(hole.uid, {
x = toPosition.x, 
y = toPosition.y + 1, 
z = toPosition.z}, FALSE)
		
else
			
doPlayerSendCancel(cid, "Sorry, not possible.")
		
end
	
else
		
return FALSE
	
end
	
return TRUE

end