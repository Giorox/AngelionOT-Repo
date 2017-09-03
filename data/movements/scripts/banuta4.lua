function onStepIn(cid, item, pos)

local hss = {x=32882, y=32632, z=11}
local has = {x=32854, y=32544, z=10}

    if item.actionid == 12772 then
		doTeleportThing(cid,hss)
        doSendMagicEffect(getCreaturePosition(cid),20)
		doSendMagicEffect(has,20)
        end
    return 1
end