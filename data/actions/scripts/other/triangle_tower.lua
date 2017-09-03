function onUse(cid, item, frompos, item2, topos)

local wallpos1    = {x=32566, y=32119, z=7, stackpos=1}   --- coordinates of the wall to be removed ---
local wall1    = getThingfromPos(wallpos1)
local wallID    = 1025 --- item id of the wall to be removed ---


    if item.itemid == 1945 then
        doRemoveItem(wall1.uid, 1)
    elseif item.itemid == 1946 then
        doCreateItem(wallID, toPos, wallpos1)

    end

end