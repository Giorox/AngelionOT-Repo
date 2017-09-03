local pearlId = 5022
local pos = {x=32479, y=32102, z=15}
function onStepIn(cid, item, position, fromPosition)
    if isPlayer(cid) == TRUE and item.actionid == 9638 then
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