function onStepIn(cid, item, pos)

local hss = {x=32839, y=32531, z=9}
local has = {x=32883, y=32633, z=11}

    if item.actionid == 32778 then
		doTeleportThing(cid,hss)
        doSendMagicEffect(getCreaturePosition(cid),20)
		doSendMagicEffect(has,20)
        end
    return 1
end