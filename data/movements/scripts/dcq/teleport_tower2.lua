local pearlId = 5022
local pos = {x=32360, y=31782, z=7}
function onStepIn(cid, item, position, fromPosition)
    if isPlayer(cid) == TRUE and item.actionid == 9633 then
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