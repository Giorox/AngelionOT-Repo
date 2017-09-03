local tilepos = {x=32627, y=31699, z=10, stackpos=0}
local tilepos2 = {x=32627, y=31699, z=10, stackpos=1}
local tilepos3 = {x=32628, y=31699, z=10, stackpos=0}
local tilepos4 = {x=32629, y=31699, z=10, stackpos=0}
local tilepos5 = {x=32629, y=31699, z=10, stackpos=1}

function onUse(cid, item, frompos, item2, topos)

local tile = getThingfromPos(tilepos)
local tile2 = getThingfromPos(tilepos2)
local tile3 = getThingfromPos(tilepos3)
local tile4 = getThingfromPos(tilepos4)
local tile5 = getThingfromPos(tilepos5)
local pos = {x=32629, y=31699, z=10}

if (item.uid == 13444 and item.itemid == 1945) then
doRemoveItem(tile2.uid,1)
doTransformItem(tile.uid,5770)
doTransformItem(tile3.uid,5770)
doRemoveItem(tile5.uid,1)
doTransformItem(tile4.uid,5770)
doTransformItem(item.uid,1946)

elseif (item.uid == 13444 and item.itemid == 1946) then
doTransformItem(tile.uid,493)
		doCreateItem(4799,1,tilepos2)
		doTransformItem(tile3.uid,493)
		doTransformItem(item.uid,1945)
		doTransformItem(tile4.uid,493)
		doCreateItem(4797,1,tilepos5)
		pos.stackpos = 253
		if getThingfromPos(pos).itemid > 0 then
			doMoveCreature(getThingFromPos(pos).uid, EAST)
		end
	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end
   return 1
end
