local drawWellAid = 1000
function onUse(cid, item, fromPosition, itemEx, toPosition)
        if item.itemid == 1369 and item.actionid == drawWellAid then
		doTeleportThing(cid, {x = toPosition.x, y = toPosition.y, z = toPosition.z + 1}, TRUE)
        elseif item.itemid == 1369 then
                doPlayerSendCancel(cid, "You can not use this object.")
        end
    end