local tibleId = 1970
local pos = {x=32791, y=32327, z=10}
function onStepIn(cid, item, position, fromPosition)
    if isPlayer(cid) == TRUE then
        if getPlayerItemCount(cid, tibleId) >= 1 then
             doTeleportThing(cid, pos, TRUE)
             doSendMagicEffect(pos, 10)
        else
            doTeleportThing(cid, fromPosition, TRUE)
			doSendMagicEffect(position, 10)
        end
    end
    return TRUE
end  