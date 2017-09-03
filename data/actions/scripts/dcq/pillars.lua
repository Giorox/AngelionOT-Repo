

function onUse(cid, item, frompos, item2, topos)


local tile1pos = {x=32835, y=32285, z=14, stackpos=1}

local tile2pos = {x=32836, y=32285, z=14, stackpos=1}

local tile3pos = {x=32837, y=32285, z=14, stackpos=1}

local tile4pos = {x=32838, y=32285, z=14, stackpos=1}

local lever1pos = {x=32836, y=32278, z=14, stackpos=1}


local tile1 = getThingfromPos(tile1pos)

local tile2 = getThingfromPos(tile2pos)

local tile3 = getThingfromPos(tile3pos)

local tile4 = getThingfromPos(tile4pos)

local lever1 = getThingfromPos(lever1pos)

if item.itemid == 1945 then


doRemoveItem(tile1.uid,1515)

doRemoveItem(tile2.uid,1515)

doRemoveItem(tile3.uid,1515)

doRemoveItem(tile4.uid,1515)


doTransformItem(lever1.uid,1946)


elseif item.itemid == 1946 then


doCreateItem(1515,1,tile1pos)

doCreateItem(1515,1,tile2pos)

doCreateItem(1515,1,tile3pos)

doCreateItem(1515,1,tile4pos)

doTransformItem(lever1.uid,1945)

else 

doPlayerSendCancel(cid,"Sorry, not possible.") 

end 

return 1
end