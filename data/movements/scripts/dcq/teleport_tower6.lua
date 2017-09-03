local pearlId = 5022
local pos = {x=33213, y=32454, z=1}
function onStepIn(cid, item, position, fromPosition)
    if isPlayer(cid) == TRUE and item.actionid == 9637 then
        if getPlayerItemCount(cid, pearlId) >= 1 then
             doTeleportThing(cid, pos, TRUE)
             doSendMagicEffect(pos, 10)
			 doPlayerRemoveItem(cid,5022,1)
        else
            doTeleportThing(cid, fromPosition, TRUE)
			doSendMagicEffect(getCreaturePosition(cid),10)
        end
    end
    return TRUE
end  