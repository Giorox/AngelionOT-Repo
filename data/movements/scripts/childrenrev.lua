function onStepIn(cid, item, pos)

local enter = {x=33261, y=31078, z=8}
local leave = {x=33356, y=31125, z=7}
local noPosition = {x=33356, y=31126, z=7}

    if getPlayerStorageValue(cid, 39721) == 1 and item.actionid == 3932 then
		doTeleportThing(cid,enter)
		doSendMagicEffect(getCreaturePosition(cid),47)
	elseif item.actionid == 3931 then
		doTeleportThing(cid,leave)
		doSendMagicEffect(getCreaturePosition(cid),47)
		else
		doTeleportThing(cid, noPosition, TRUE)
		doSendMagicEffect(getCreaturePosition(cid),47)
	end
end