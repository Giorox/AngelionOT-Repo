function onStepIn(cid, item, pos)

local hss = {x=32840, y=32533, z=9}
local has = {x=32749, y=32538, z=10}

    if item.actionid == 12771 then
		doTeleportThing(cid,hss)
        doSendMagicEffect(getCreaturePosition(cid),14)
		doSendMagicEffect(has,14)
        end
    return 1
end